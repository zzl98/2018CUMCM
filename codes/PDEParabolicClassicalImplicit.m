function[U, x, t]=PDEParabolicClassicalImplicit(uX,uT,phi,psi1,psi2,M,N,C)
 
%example
%phi=inline('sin(pi*x)');psi1=inline('0');psi2=inline('0');
%[U?x?t]=PDEParabolicClassicalImplicit(uX,uT,phi,psi1,psi2,M,N,C);?
 
if nargin==7
    C=1;
end
dx=uX/M;
dt=uT/N;
x=(0:M)*dx;
t=(0:N)*dt;
r=C*dt/dx/dx;
Diag=zeros(1,M-1);
Low=zeros(1,M-2);
Up=zeros(1,M-2);
for i=1:M-2
    Diag(i)=1+2*i;
    Low(i)=r;
    Up(i)=r;
end
 
Diag(M-1)=1+2*r;
 
U=zeros(M+1,N+1);
 
for i=1:M+1
    U(i,1)=phi(x(i));
end
for j=1:N+1
    U(1,j)=psi1(t(j));
    U(M+1,j)=psi2(t(j));
end
for j=1:N
    b1=zeros(M-1,1);
    b1(1)=r*U(1,j+1);
    b1(M-1)=r*U(M+1,j+1);
    b=U(2:M,j)+b1;
    U(2:M,j+1)=EqtsForwardAndBackward(Low,Diag,Up,b);
end
U=U';
 
mesh(x,t,U);
title('古典隐式格式')
xlabel('x')
ylabel(' t')
zlabel(' T')
return;
