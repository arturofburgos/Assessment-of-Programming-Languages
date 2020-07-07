# Undergraduate Student: Arturo Burgos
# Professor: João Rodrigo Andrade
# Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory - MFLab, Block 5P, Uberlândia, MG, Brazil


# Third exercise: Fibonacci sequence - by a common loop

using Printf
using Statistics
using CPUTime

println("Choose a indice value for n: ")
N = chomp(readline())
n = parse(Int32,N)
println("\n")

Fbn = 0

##############################
# Variable iterative fibonacci  --> Worse performance, why?
##############################

function recurfibonacci(k)

    if k <= 2
     return 1
    else
       return S = recurfibonacci(k-1) + recurfibonacci(k-2)
    end
    
end

Fbn = recurfibonacci(n)

println("The correspond indices number is: ",Fbn)

@time @CPUtime recurfibonacci(n)
