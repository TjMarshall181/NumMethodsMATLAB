function [root fx ea iter] = falsePosition(func,x1,u1,es,maxiter)
% Function falsePosition is a function that utilizes false position or
% linear interpolation methods to estimate the root of a function. This
% function takes the x1 and u1 inputes as a bracket to the root, then by
% using the the false position equation : 
% u1 - [f(u1)*(x1-u1)]/[f(x1)-f(u1)], a root is aproximated until the
% relative error of the approximate root ea < es, or until the maximum
% interations have been achieved. 
% NOTE: INPUT FUNCTION MUST ALREADY BE DEFINED IN THE WORKSPACE as
% f(x) = *function* , and input should be in the form of "f" 
% I.E. falsePostion(f,0,-5) -example
%
% INPUTS: 
%
% func = function of interest
% x1 = lower bracket (guess)- found by plotting function
% u1 = upper bracket (guess)- found by plotting function
% es = desired realative error *optional* - [defaults to .0001%]
% iter = maximum iterations desired *optional* - [defaults to 200]
%
% OUTPUTS:
%
% root = estimation of function root
% fx = function evaluated at the root value
% ea = realative error of aproximation
% iter = number of itereations completed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin < 3
    error('insufficient input arguments')
end
if nargin < 4 || isempty(es)
    es = .0001;
end
if nargin < 5 || isempty(maxiter)
    maxiter = 200;
end
iter = 0;
root = 0;
t = 1;

if func(x1) == 0 || func(u1) == 0
   fprintf('\n Root is equal = to one of two brackets')
   t = 0;
elseif func(x1)*func(u1) > 0
    error('No root exhists between chosen brackets')
    t = 0;
end

while t == 1
    rtold = root;
    root = double(u1-(((func(u1))*(x1-u1))/(func(x1)-func(u1))));
    
    if root ~= 0
        ea = abs((root-rtold)/root)*100;
    end
    
    fx = func(root);
    iter = iter + 1;
    
    if ea <= es || iter >= maxiter
                t = 0;
                fprintf('\n The root estimate is %4.4f',root)
                fprintf('\n The realative error is %4.2f percent',ea)
                fprintf('\n Function evaluated at approximation = %4.4f',fx)
                fprintf('\n Number of iterations: %4.2f',iter)
    elseif func(x1)* func(root) < 0
        u1 = root;
    elseif func(x1)*func(root) > 0 
        x1 = root;
    end
end
end

        
        
        
    

