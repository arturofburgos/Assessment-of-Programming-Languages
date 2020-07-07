# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
# MFLab, Block 5P, Uberlândia, MG, Brazil

# First exercise: Consider an arbitrary Matrix NxNx3 - by a common loop

clear;
clc;

n = 3;

mtx = rand(n,n,3); 


fprintf('\n\nThe original matrix is: \n\n');
disp(mtx);

fprintf('\n\nThe element mtx(1,1,1) of the matrix is : %f',mtx(1,1,1))
fprintf('\n\nThe element mtx(1,1,2) of the matrix is : %f\n\n',mtx(1,1,2))

function x = vectorized(x)
  x(:,:,1) = x(:,:,2);
  x(:,:,3) = x(:,:,1);

end

tic
mtx = vectorized(mtx);
toc

fprintf('\n\nThe new matrix is: \n\n');
disp(mtx(1:3,:,:))

fprintf('\n\nThe element x(1,1,1) of the matrix is : %f',mtx(1,1,1))
fprintf('\n\nThe element x(1,1,2) of the matrix is : %f\n\n',mtx(1,1,2))