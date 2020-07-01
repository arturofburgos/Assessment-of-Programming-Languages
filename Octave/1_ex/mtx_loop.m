# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
# MFLab, Block 5P, Uberlândia, MG, Brazil

# First exercise: Consider an arbitrary Matrix NxNx3 - by a common loop

clear;
clc;

n = 1000;

mtx = rand(n,n,3); 



fprintf('\nThe element mtx(1,1,1) of the matrix is : %f\n',mtx(1,1,1))
fprintf('\nThe element mtx(1,1,2) of the matrix is : %f\n',mtx(1,1,2))
fprintf('\nThe element mtx(1,1,3) of the matrix is : %f\n',mtx(1,1,3))
fprintf('\nThe element mtx(n,n,1) of the matrix is : %f\n',mtx(n,n,1))
fprintf('\nThe element mtx(n,n,2) of the matrix is : %f\n',mtx(n,n,2))
fprintf('\nThe element mtx(n,n,3) of the matrix is : %f\n\n\n',mtx(n,n,3))

function x = looping(x,n)
  
  for i = 1:n
    for j = 1:n
        x(i,j,1) = x(i,j,2);
        x(i,j,3) = x(i,j,1); 
        endfor
    endfor  
end

tic
mtx = looping(mtx,n);
toc


fprintf('\n\n\nThe element mtx(1,1,1) of the matrix is : %f\n',mtx(1,1,1))
fprintf('\nThe element mtx(1,1,2) of the matrix is : %f\n',mtx(1,1,2))
fprintf('\nThe element mtx(1,1,3) of the matrix is : %f\n',mtx(1,1,3))
fprintf('\nThe element mtx(n,n,1) of the matrix is : %f\n',mtx(n,n,1))
fprintf('\nThe element mtx(n,n,2) of the matrix is : %f\n',mtx(n,n,2))
fprintf('\nThe element mtx(n,n,3) of the matrix is : %f\n',mtx(n,n,3))