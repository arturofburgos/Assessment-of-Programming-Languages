# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
# MFLab, Block 5P, Uberlândia, MG, Brazil

# First exercise: Consider an arbitrary Matrix NxNx3 - by a common loop

clear;
clc;

x = 1:10;

y = cos(x);
tic
fid = fopen("/home/arturo/Desktop/IC/Comparing-Languages/txt_File/OCTAVE/...
test.txt","w");
fdisp(fid,"x \t y\n");
fdisp (fid, "The value of pi is:"), fdisp (fid, [x;y]), fdisp(fid,"\n)


fclose(fid);
toc