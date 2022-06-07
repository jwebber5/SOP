function [fun,grad] = L1_miR(x)

fun = sum(abs(x));
grad = zeros(length(x),1);
grad(x<0)=-1; grad(x>0)=1;

end

