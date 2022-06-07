% Example use of SOP. Generates figure 1(c) from paper.

close all

load('spintop_data.mat')

alpha=1e+6; beta=1e+2; nf=2;

[W,T] = SOP(Data,labels,nf,alpha,beta);

figure, gscatter(T(:,1),T(:,2),labels)
xlabel('x'); ylabel('y');
legend('controls','cases','Location','southeast')