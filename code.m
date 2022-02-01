
% fahad mostafa @ttu 2019
clear all; 
clc;
a=8;
lamda = 1;
t=lamda -(1/a);
mt= lamda/(lamda-t);

m=1000;
for j=1:m
    n=10*j;
    u=rand(1,n);
    expo=-log(u); % generating data from exponential

%classical monte carlo estimate estimate
for i=1:length(expo)
if expo(i)>=a
    gx1(i)=1;
else
    gx1(i)= 0;
end
end
theta_hat(j)=(1/n)*sum(gx1);   % monte carlo
end 


%Importance Sampling 

lamda = 1;
t=lamda -(1/a);
mt= lamda/(lamda-t);
tic  % time of convergence 
m=1000;

for j=1:m
    n=10*j;
    u=rand(1,n);
    x = -a*log(u); % generating data from exponential
%tilted sampling
for i=1:length(x)
if x(i)>=a
gx(i)=exp(-t*x(i));
else
gx(i)= 0;
end
end
   theta_tilda(j)=(mt/n)*sum(gx);
end

figure(1);
plot(10*[1:m],theta_hat)

hold on;
plot(10*[1:m],theta_tilda)
