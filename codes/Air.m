uX=0.6;ut=90;M=15;N=3000;C=0.023611;
phi=inline('37');psi1=inline('65.12-28.12*exp(-t/0.62)');
psi2=inline('48.1-12.6*exp(-t/0.62)');
[U x t]=PDEparabolicClassicalExplicit(uX,ut,phi,psi1,psi2,M,N,C);
