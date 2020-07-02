# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

using Printf # Just the same as import a module
using Statistics
using CPUTime

# A = rand(1:50,3,3)
# B = rand(1:50,3,3)

A = [1 2; 3 4]
println("\n\n\nThe A Matrix is: \n\n",A)

B = [1 2; 3 4]
println("\n\nThe B Matrix is: \n\n",B)

R = zeros(2,2) # Here I create a zero matrix just to get the multiply of A and B


D = A*B # This is the vectorized way for this problem, like MATLAB
C = A.*B # This multiplies point by point

println("\n\nThe D Matrix is: \n\n",D)
println("\n\nThe C Matrix is: \n\n",C)

# println("\n\n",D[:,1])

# i represents lines and j represents columns. k represents
# the line or column 11element11 indices

function multiloop(mtx1,mtx2,mtx3)

    for i = 1:2
        for j = 1:2
            soma = 0;
            for k = 1:2
                soma = soma + mtx1[i,k]*mtx2[k,j];
                mtx3[i,j] = soma;
            end
        end
    end
    return mtx3 # Returns a value to the variable
end


R = multiloop(A,B,R);
println("\n\nThe R Matrix is: \n\n",R)
println("\n\n")

@time @CPUtime multiloop(A,B,R)