# Algorithm: Heun.m
Heun, called as [t,y] = Heun(dydx,tspan,y0,h,es,maxit) that employs the iterative Heuns mothod for solving ordinary differencial equations numerically.

## INPUTS:
* dydt - anonymous function representing the differential equation
* tspan - 1x2 vector containing the range of t values to solve
* y0 - initial value of y at tspan(1)
* h - step size
* es - maxiumim error for iteration on y estimates - default(.001)
* maxit - maximum number of iterations on y estimates - default(50)

## OUTPUTS:
* t - vector containing t variables
* y - vector containing estimated y values at each t

### NOTE:
tspan must be input as a 1x2 vector containing the range of range of integration; EX: [t0 tf]. y0 is submitted as the value of y at the first value in the tspan vector. If es and maxit are not included in inputs, values will default to .001 and 50 respectively. If step size does not agree with the tspan range, the step size will be adjusted to account for the last value of tspan. 
