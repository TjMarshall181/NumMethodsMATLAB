# Algorithm: falsePositio.m
falsePosition, called as [root fx ea iter] = falsePosition(func,x1,u1,es,maxiter), is a function that utilizes false position or linear interpolation methods to estimate the root of a function. This function takes the x1 and u1 inputes as a bracket to the root, then by using the the false position equation :  u1 - [f(u1)*(x1-u1)]/[f(x1)-f(u1)], a root is aproximated until the relative error of the approximate root ea < es, or until the maximum interations have been achieved.
## Inputs
* func = function of interest
* x1 = lower bracket (guess)- found by plotting function
* u1 = upper bracket (guess)- found by plotting function
* es = desired realative error *optional* - [defaults to .0001%]
* iter = maximum iterations desired *optional* - [defaults to 200]
## Outputs
* root = estimation of function root
* fx = function evaluated at the root value
* ea = realative error of aproximation
* iter = number of itereations completed
## Limitations
False position is a closed method for root approximation, so depending on the function or data, it may converge slowly. 
