function [L,U,P] = luFactor(A)
% luFactor: Call function as [L,U,P] = luFactor(A) to perform lu decomposition on a square nxn
% matrix (A). This algorithm uses lu decomposition with partial pivoting to
% determine an upper matrix, a lower matrix, and the resulting permutation
% matrix. This algorithm DOES Not SOLVE the systems of equations, but the
% results can be used to forward substitute and back substitute to
% determine the system of equations.
% 
% INPUTS:
% A : a single nxn square matrix to be decomposed.
%
% OUTPUTS: 
% L: A lower triangular matrix "L" With recorded factors of elimination
% U: The upper triangular matrix as a result of Gauss elimination methods
% P: Final Permutaion matrix to record pivoting

% Check input values
if nargin ~= 1
    error('Input Value should be a single nxn matrix')
end
% Check that Matrix a is square
[row,col] = size(A);
if row ~= col
    error('Matrix A must be a square Matrix')
end

% Store input matrix A in a seperate variable for later steps
A1 = A;
% Generate ID Matrix for L matrix
L = eye(row,col);
% Generate Permuation matrix
perm = eye(row,col);

% Index through columns
for i= 1:col-1;
    % Find maximum value and location of max value in column
    [n,m] = max(abs(A(i:row,i)));
        maxval = max(abs(A(i:row,i)));
        % Check if pivoting is necessary - if max value is not in first
        % row.
    if abs(A(i,i)) ~= maxval;
        
        % Pivot Matrix A - switch first row with the maximum value row.
    a1 = A(i,:);
    a2 = A((m+i-1),:);
    A(i,:) = a2;
    A((m+i-1),:) = a1;
    
       % Pivot Permutaion matrix
       p1 = perm(i,:);
       p2 = perm((m+i-1),:);
       perm(i,:) = p2;
       perm((m+i-1),:) = p1;
          end
   
     
         % Iterate through rows to perform elimination
        for k = i+1:row;
            % Find Factor to multiply upper column by, multiply, then
            % eliminate variable using Gauss elimination methods
           factor = A(k,i)/A(i,i);
           % Multiply row in interest by factor, store as alternate row
           altRow = A(i,:).*factor;
           % Subtract alternate row from second row of interest to
           % eliminate variable
           A(k,:) = A(k,:)- altRow;                
           
        end
end
% Finalize Output Variables:
U = A;
P = perm;
% Use forward division using The Origional A matrix, U matrix, and P matrix
% to solve for the correctly pivoted L matrix.
L = (P*A1)/U;
end
    
    
