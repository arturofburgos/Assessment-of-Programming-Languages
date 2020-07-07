# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
# MFLab, Block 5P, Uberlândia, MG, Brazil

# Second exercise: Consider two arbitrary Matrix NxN
clear all;
clc;
A = randi(3,3)
B = randi(3,3)

# C = A.*B this multiplies point by point 
# Is the same as for i = 1:2 for j = 1:2 F(i,j) = A(i,j)*B(i,j)
fprintf('\n\nExpected result: \n\n');
D = A*B # this is the vectorized way for this problem

# i represents lines and j represents columns. k represents
# the line or column 11element11 indices

function z = multi_vec(x,y)
  
z = x*y;

endfunction

fprintf('\n\nThe new matrix is: \n\n');

tic
R = multi_vec(A,B)
toc