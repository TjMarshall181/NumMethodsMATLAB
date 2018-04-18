#Algorithm: Simpson.m#
This Algorithm is a MATLAB aglorithm to perform Simpson's 1/3 Composite rule for numerical integration. If the number of data points submitted is not even, one iteration of the Trapezoidal method is used on the last interval of data points. (A warning will be issued if trapezoidal rule is used).
##Inputs##
* X: Vector of length m with equally spaced points (Dependant Var)
* Y: Vector of length m (Independant Var)
##Outputs##
* I: Numerical integral value
##Limitations##
Vectors imputed to this function must be the same length. X vector values must be equally spaced. 
