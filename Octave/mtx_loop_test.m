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

function x = looping(x)
  
  for i = 1:3
    for j = 1:3
        x(i,j,1) = x(i,j,2);
        x(i,j,3) = x(i,j,1); 
        
        
        endfor
    endfor  
end

tic
mtx =looping(mtx);
toc

fn = 'mtx_loop_test.txt';
fID = fopen(fn,'w');
fprintf(fID, '%f', mtx);
fclose(fID);

fprintf('\n\nThe new matrix is: \n\n');
disp(mtx)

fprintf('\n\nThe element x(1,1,1) of the matrix is : %f',mtx(1,1,1))
fprintf('\n\nThe element x(1,1,2) of the matrix is : %f\n\n',mtx(1,1,2))


#clear

#fn = fopen('mtx_loop_test.txt','r');
#output = fgetl(fn);
#output = textscan(fn);
#fclose(fn);