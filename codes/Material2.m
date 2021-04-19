uX=6;ut=5400;M=15;N=3000;C=0.000204;
phi=inline('37');psi1=inline('74.3-37.3*exp(-t/143.7)');
psi2=inline('72.75-35.75*exp(-t/143.7)');
[U x t]=PDEparabolicClassicalExplicit(uX,ut,phi,psi1,psi2,M,N,C);
