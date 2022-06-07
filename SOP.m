function [W,T] = SOP(Data,labels,nf,alpha,beta)
% Sparse Orthogonal Projection (SOP) dimension reduction

% inputs
% Data is n X p observation matrix. n is number of observations. p
% is number of variables (dimensions)
% labels - n X 1 vector of class labels. Inputs of labels are in
% {0,1,...,n_c}, where n_c+1 is the number of classes.
% alpha is parameter to enforce that W is orthogonal, e.g., alpha=1e+3
% beta is the sparsity (L1 norm) parameter, which controls the level of
% sparsity in W
% nf (positive integer) is the number of features (number of columns of W) to be extracted,
% e.g., nf=3.

% outputs
% W - p X nf sparse orthogonal matrix used to perform dimension reduction
% T - n X nf matrix of reduced dimension data

options.maxIts=3000;
options.maxTotalIts=6000;

p=size(Data,2);

x0=orthogonal_procrustes(Data,labels,nf); 
x0=reshape(x0,p,nf); x0(1,:)=mean(x0(2:end,:));
V=solve_miR_odiag(x0(:),nf,labels,Data,Data',alpha,beta,options);
V=reshape(V,p,nf);
    
[U1,~,V1]=csvd(V); 
W=U1*V1';
T=Data*W;
    
end

