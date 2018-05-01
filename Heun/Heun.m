function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
% Heun: This function employs the iterative Heuns mothod for solving
% ordinary differencial equations numerically. NOTE: tspan must be input as
% a 1x2 vector containing the range of range of integration; EX: [t0 tf].
% y0 is submitted as the value of y at the first value in the tspan vector.
% if es and maxit are not included in inputs, values will default to .001
% and 50 respectively. If step size does not agree with the tspan range,
% the step size will be adjusted to account for the last value of tspan.
%
% INPUTS: 
% dydt - anonymous function representing the differential equation
% tspan - 1x2 vector containing the range of t values to solve 
% y0 - initial value of y at tspan(1)
% h - step size
% es - maxiumim error for iteration on y estimates - default(.001)
% maxit - maximum number of iterations on y estimates - default(50)
%
% OUTPUTS:
% t - vector containing t variables
% y - vector containing estimated y values at each t
%

% error check
% Check inputs
close all
if nargin < 4
    error('Function must be input with 4 input values: (dydt,tspan,y0,h)')
end

if nargin < 5
    es = .001;
    maxit = 50;
elseif nargin < 6
    maxit = 50;
end
% Check tspan format
[u,v] = size(tspan);
if u ~= 1 || v ~= 2
    error('tspan vector must be a 1x2 vector containing first and last value of t')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = [tspan(1,1):h:tspan(1,2)];

% Check if h does not agree with tspan range
chk = 0;
if t(end) ~= tspan(end)
    t1 = [t(end) tspan(end)];
    chk = 1;
    warning('Step size does not agree with interval; step size will be adjusted to calculate the last data value')
end

% Initialize necessary variables for computation
err = 100;
y(1) = y0;
yi = y0;
[m,n] = size(t);


% Iterate through each t value to find resulting y value estimate.
for i = 1:n-1
    % Find left slope
   slopeL = dydt(t(i),yi);
   % forward predict
   pred = yi + (slopeL)*(h);
   % find initial right slope
   slopeR = dydt(t(i+1),pred);
   % reinitialiize error for next set of iterations
   err = 100;
   % Iterate y guess
   iter = 1;
   
   % Iterate through right slope to determine more accurate y value for
   % a set t value
   while abs(err) > es && iter <= maxit % while the error and maxit conditions are met
       iter = iter + 1;
       % Calculate next y value guess
       yi1 = yi + ((slopeL + dydt(t(i+1),pred))/2)*(h);
       % recalculate error
       err = ((yi1 - pred)/yi1);
       % assign new guess to be used in next iteration
       pred = yi1;
   end
   
   % Format final output vectors
   y(i+1) = pred;
   yi = pred;
  
end
% If h dissagreed with tspan, iterate a guess for the final interval
if chk == 1
    % Find slope left
    slopeL = dydt(t1(1),y(end));
    % forward predict
    pred = y(end) + (slopeL)*(t1(2)-t1(1));
    % calculate slipe right
    slopeR = dydt(t1(2), pred);
    iter = 1;
    % iterate for accurate y value
     while abs(err) > es && iter <= maxit % while conditions met
       iter = iter + 1;
       yi1 = y(end) + ((slopeL + dydt(t(2),pred))/2)*(t1(2)-t1(1));
       err = ((yi1 - pred)/yi1);
       pred = yi1;
     end
     % attatch final variable to final output vectors
     y(end + 1) = pred;
     t(end + 1) = t1(2);
end
% Create plot of solved differential equation
plot(t,y)
title('dydx - Heun method')
xlabel('t')
ylabel('y')
end
      
       
       
   
   
    

