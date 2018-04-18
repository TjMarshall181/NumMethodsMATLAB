#Algorithm: luFactor.m#
luFactor: Call function as [L,U,P] = luFactor(A) to perform lu decomposition on a square nxn matrix (A). This algorithm uses lu decomposition with partial pivoting to determine an upper matrix, a lower matrix, and the resulting permutation matrix
##Inputs##
* A: A single n by n square matrix to be decomposed
##Outputs## 
* L: A lower triangular matrix "L" With recorded factors of elimination
* U: The upper triangular matrix as a result of Gauss elimination methods
* P: Final Permutaion matrix to record pivoting
##Limitations##
This algorithm DOES Not SOLVE the systems of equations, but the results can be used to forward substitute and back substitute to determine the system of equations. Matrix must also be square.
