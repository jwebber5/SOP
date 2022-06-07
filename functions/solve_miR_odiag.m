function [solution, converged] = solve_miR_odiag(x_0, nf, b, A, ...
    At, alpha, beta, options)

    L=tril(ones(nf));
    L=find(L==0);
    [row,col] = ind2sub([nf,nf],L);
    P=[row,col];
    
    fun = @(x) full_obj_odiag(x,A,At,b,nf,alpha,beta,P);
    
    %vone=ones(size(x_0));
        
    [solution, converged] = JR_L_BFGS_B(x_0, fun, [], [], options);  
    
end