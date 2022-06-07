function [fun,grad] = linear_obj(x,A,At,b,nf)

Y=repmat(b,[nf,1]); %Xt=repmat(At,[1,nf]);

m=round(length(x)./nf);
V=reshape(x,m,nf);

res = A*V;
res = res(:) - Y;
fun = 0.5 * sum(abs(res(:)).^2);
grad = At*reshape(res,length(b),nf);
grad = grad(:);

end

