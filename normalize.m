function [T1,mn,mx,mu] = normalize(Data)

% normalize Data (n X p matrix) to cube [-1,1]^p
% T1 is normalized data

T1=Data;
mn=min(T1);
T1=T1-mn;
mx=max(T1);
T1=T1./mx; T1(isnan(T1))=0;
mu=mean(T1);
T1=T1-mu;

end

