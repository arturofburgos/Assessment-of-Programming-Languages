clear

fn = fopen('mtx_loop_test.txt','r');
output = fgetl(fn);
#output = textscan(fn);
fclose(fn);
