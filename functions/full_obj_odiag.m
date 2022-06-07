function [fun,grad] = full_obj_odiag(x,A,At,b,nf,alpha,beta,P)

[fun1,grad1]=linear_obj(x,A,At,b,nf);

[fun2,grad2]=orth_constraint_odiag(x,nf,P);

fun2=alpha.*fun2; grad2=alpha.*grad2;

[fun3,grad3]=L1_miR(x);

fun3=beta.*fun3; grad3=beta.*grad3;

fun=fun1+fun2+fun3;

grad=grad1+grad2+grad3;

end