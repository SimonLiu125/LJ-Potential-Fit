clc;
clear;
close all;

%use dlmread to read csv data file
mat = dlmread('cation.csv',",");
%save data for objective functions
save('data.mat')

xm = mat(:,1);
ym = mat(:,2);

%make a good guess, it has to be close
arg0=[0.5,2,-1,0.5];
argz=fminunc(@objective,arg0)
eo=argz(1);
ro=argz(2);
gamma=argz(3);
delta=argz(4);

figure(1);
hold on;
plot(xm,ym,'bx')
fplot(@(x)(eo/2)*((1+gamma)*(ro./x).**12 - 4*gamma*(ro./x).**6 - 3*(1 - gamma)*(ro./x).**4) + delta,[2,8],'r-');