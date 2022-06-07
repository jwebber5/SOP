function [fun,grad] = orth_constraint_odiag(x,nf,P)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
m=round(length(x)./nf);
V=reshape(x,m,nf);

C=V'*V;

fun=norm(C,'fro').^2-norm(diag(C),'fro').^2;

grad=0;
for i=1:size(P,1)
    ind=P(i,:);
    c=C(ind(1),ind(2));
    M=zeros(size(V));
    M(:,ind(1))=V(:,ind(2));
    M(:,ind(2))=V(:,ind(1));
    grad=grad+c.*M(:);
end

grad=2.*grad;
fun=0.5.*fun;


end