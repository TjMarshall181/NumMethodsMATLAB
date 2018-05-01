function [I] = Simpson(x,y)
% Function uses Simpson's 1/3 rule to numerically integrate a set of data
% points over an equispaced domain. Function takes an x vector and a y
% vector of data points and employs 1/3 rule to integrate. IF number of
% data points is even, the trapezoidal method for integration is employed
% on the last interval.
%
%INPUTS: 
%x: X vector of length m (independant var) - evenly spaced
%y: y vecotr of length m (dependant var)
%
%OUTPUTS: 
% I: Numerical integral value

% Initialization
[n,m] = size(x);
[n1,m1] = size(y);

% check if transposition of inputs is needed
if n ~= 1
    x = x'
end
if n1 ~=1
    y = y'
end

% Reassign size vecoters after transpsotion.
[n,m] = size(x);
[n1,m1] = size(y);

% Error Check
if nargin ~= 2
    error('Input values must be two vectors x & y');
elseif m ~= m1
    error('x and y vectors must be the same size')
elseif isvector(x) == 0 || isvector(y) == 0
    error('Inputs must be vectors')
end

if max(2.^diff(x))- min(2.^diff(x)) ~= 0
    error('X matrix must be equally spaced')
end


% if trapezoidal method is not needed
Traptest = mod(m,2);
if Traptest == 1 % Simpsons 1/3 exclusively used
    % assign variables of 1/3 rule
    fx0 = y(1);
    fx1 = 4*(sum(y(2:2:m1-1)));
    fx2 = 2*(sum(y(3:2:m1-2)));
    fxn = y(m1);
    % employ simpson 1/3 rule formula
    I = (x(m)-x(1))*((fx0+fx1+fx2+fxn)/(3*(m-1)))
else % If trapezoidal method is needed
warning('The number of terms m in x vector is even, so trapezoidal integration method will be utilized for the last interval of values')
% perform 1/3 rule for all but last interval
 fx0 = y(1);
 fx1 = 4*(sum(y(2:2:m1-2)));
 fx2 = 2*(sum(y(3:2:m1-3)));
 fxn = y(m1-1);
 % employ simpson 1/3 rule formula
    I = (x(m-1)-x(1))*((fx0+fx1+fx2+fxn)/(3*(m-1)));
    %employ trapezoidal rule
    t = (x(m)-x(m-1))*((y(m-1)+y(m))/2);
    %combine results for total integral
    I = I + t;
end
end
    
    
 