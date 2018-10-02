function obj = objective(arg);

eo=arg(1);
ro=arg(2);
gamma=arg(3);
delta=arg(4);

%load measured data
    load('data.mat');
    xm = mat(:,1);
    ym = mat(:,2);
    
%define fitting function
    y = (eo/2)*((1+gamma)*(ro./xm).**12 - 4*gamma*(ro./xm).**6 - 3*(1 - gamma)*(ro./xm).**4) + delta;
    
%define objective funciton using least squares
    obj = (y-ym).**2;
    obj = sum(obj);
    
end