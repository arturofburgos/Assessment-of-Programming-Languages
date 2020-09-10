# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
# MFLab, Block 5P, Uberlândia, MG, Brazil

# First exercise:  txt File

clear;
clc;

x = 1:10:100;

y = cos(x);
tic
fid = fopen("/home/arturo/Desktop/IC/Comparing-Languages/txt_File/OCTAVE/...
test.txt","w");
for i = 1:length(x)
  fprintf(fid, "%d \t %d\n", x(i),y(i));
  
endfor
fdisp(fid,"\n");
for i = 1:length(y)
  fprintf(fid, "%d ", y(i));
endfor
fclose(fid);
toc