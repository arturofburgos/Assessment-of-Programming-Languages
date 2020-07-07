# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil

using Printf # Just the same as import a module
using Statistics
using CPUTime

A = rand(1:50,5000,5000,3)


println("\n\nThe A[1,1,1] is: ",A[1,1,1])
println("The A[1,1,2] is: ",A[1,1,2])
println("The A[1,1,3] is: ",A[1,1,3])




@time @CPUtime A[:, :, 1] = A[:, :, 2]
@time @CPUtime A[:, :, 3] = A[:, :, 1]





println("\n\nThe A[1,1,1] is: ",A[1,1,1])
println("The A[1,1,2] is: ",A[1,1,2])
println("The A[1,1,3] is: ",A[1,1,3])

