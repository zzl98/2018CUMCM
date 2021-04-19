function[U x t]=PDEparabolicClassicalExplicit(uX,ut,phi,psil,psi2,M,N,C)
 
%example
%uX=1;ut=0.2;M=15;N=100;C=1;
%phi=inline('sin(pi*x)');psi1=inline('0');psi2=inline('0');
%[U x t]=PDEparabolicClassicalExplicit(uX,ut,phi,psi1,psi2,M,N,C);

if nargin==7
    C=1;
end
dx=uX/M;
dt=ut/N;
x=(0:M)*dx;
t=(0:N)*dt;
r=C*dt/dx/dx;
r1=1-2*r;
if r>0.5
    disp('r>0.5,不稳定')
end
U=zeros(M+1,N+1);
for i=1:M+1
    U(i,1)=phi(x(i));
end
for j=1:N+1
    U(1,j)=psil(t(j));
    U(M+1,j)=psi2(t(j));
end
for j=1:N
    for i=2:M
        U(i,j+1)=r*U(i-1,j)+r1*U(i,j)+r*U(i+1,j);
    end
end
U=U';
mesh(x,t,U);
title('古典显式格式，一维热传导方程的解的图像')
xlabel('空间变量 x')
ylabel('时间变量 t')
zlabel('一维热传导方程的解 T')
return;
