function x=EqtsForwardAndBackward(L,D,U,b)
%追赶法求解三对角线性方程组Ax=b
%x=EqtsForwardAndBackward(L,D,U,b)
%x:三对角线性方程组的解
%L:三对角矩阵的下对角线，行向量
%D:三对角矩阵的对角线，行向量
%U:三对角矩阵的上对角线，行向量
%b:线性方程组Ax=b中的b，列向量
%
%应用举例:
%L=[-1 -2 -3];D=[2 3 4 5];U=[-1 -2 -3];b=[6 1 -2 1]';
%x=EqtsForwardAndBackward(L,D,U,b)
%检查参数的输入是否正确
n=length(D);m=length(b);
n1=length(L);n2=length(U);
if n-n1 ~= 1 || n-n2 ~= 1 || n ~= m
    disp('输入参数有误！')
    x=' ';
    return;
end

%追的过程
for i=2:n
    L(i-1)=L(i-1)/D(i-1);
    D(i)=D(i)-L(i-1)*U(i-1);
end
x=zeros(n,1);
x(1)=b(1);
for i=2:n
    x(i)=b(i)-L(i-1)*x(i-1);
end

%赶的过程
x(n)=x(n)/D(n);
for i=n-1:-1:1
    x(i)=(x(i)-U(i)*x(i+1))/D(i);
end

return;
