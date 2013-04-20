dbmex off;
clear all;
mex -g mexRosenbrock.c;
options = optimset('GradObj','on');
x0 = [1,1,1,1.1];

x = fminunc(@mexRosenbrock,x0,options);
