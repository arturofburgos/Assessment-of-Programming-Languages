# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

using Printf # Just the same as import a module
using Statistics
using CPUTime

A = rand(1:3000,5000,5000,3)


println("\n\nThe A[1,1,1] is: ",A[1,1,1])
println("The A[1,1,2] is: ",A[1,1,2])
println("The A[1,1,3] is: ",A[1,1,3])




@time @CPUtime for i = 1:5000
    for j=1:5000
        A[i, j, 1] = A[i, j, 2]
        A[i, j, 3] = A[i, j, 1]
    end
end
    



println("\n\n\nThe new Matrix is: \n\n")

println("\n\nThe A[1,1,1] is: ",A[1,1,1])
println("The A[1,1,2] is: ",A[1,1,2])
println("The A[1,1,3] is: ",A[1,1,3])
