# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
# MFLab, Block 5P, Uberlândia, MG, Brazil

# Second exercise: Consider two arbitrary Matrix NxN
clear all;
clc;
A = randi(250,250);
B = randi(250,250);

# C = A.*B this multiplies point by point 
# Is the same as for i = 1:2 for j = 1:2 F(i,j) = A(i,j)*B(i,j)

# D = A*B this is the vectorized way for this problem

# i represents lines and j represents columns. k represents
# the line or column 11element11 indices

function z = multi_loop(x,y)
  
for i = 1:250
    for j = 1:250
    soma = 0;
      for k = 1:250
        soma = soma + x(i,k)*y(k,j) ;
      endfor
    z(i,j) = soma;
    endfor
  endfor
end


tic
R = multi_loop(A,B);
toc