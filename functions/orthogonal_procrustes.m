function V = orthogonal_procrustes(A,b,nf)

    Y=repmat(b,[1,nf]);
    M=Y'*A;
    [U,~,V]=csvd(M);
    sol1=U*V';
    sol1=sol1';
    V=sol1(:);
    
end