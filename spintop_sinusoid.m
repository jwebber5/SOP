% Generates spintop data and labels

close all

nsamp=3000; 
nsamp1=1500;

sig1=0.1;
sig2=0.2;
nf=2;

ang=pi/4;
rot=[cos(ang),sin(ang);-sin(ang),cos(ang)];
ang=pi/12;
rot1=[cos(ang),sin(ang);-sin(ang),cos(ang)];

R1=eye(3); R1(2:3,2:3)=rot;
R2=eye(3); R2(1:2,1:2)=rot;
R3=eye(3); R3(1:2,1:2)=rot1;
R=R3*R1*R2;

eta=[0,0,1]*R; 
eta1=[1,0,0]*R; 
eta2=[0,1,0]*R; 

D1=randn(nsamp,3);
D1(:,3)=D1(:,3)*sig1;

D2=randn(nsamp1,3);
D2(:,1)=D2(:,1)*sig2; 
D2(:,2)=D2(:,2)*sig2;

D=[D1;D2];

L=D(:,2)>0.2*sin(10*D(:,3));
L=double(L);

D=D*R;

D=[D,randn(size(D,1),100)];

Data=D; labels=L;