uX=0.6;ut=5400;M=15;N=3000;C=0.000198;
phi=inline('37');psi1=inline('75-38*exp(-t/143.7)');
psi2=inline('74.3-37.3*exp(-t/143.7)');
[U x t]=PDEparabolicClassicalExplicit(uX,ut,phi,psi1,psi2,M,N,C);
