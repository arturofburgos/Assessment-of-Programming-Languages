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
A = 0
B = 1

##############################
# Variable iterative fibonacci  --> Worse performance, why?
##############################

function varloop(F1,F2,S,k)
    for i = 1:k
        F1 = S
        S = F1 + F2
        F2 = F1
    end
    return S
    
end

Fbn = varloop(A,B,Fbn,n)

println("The correspond indices number is: ",Fbn)



@time @CPUtime varloop(A,B,Fbn,n)

println("\n")

###########################
# Array iterative fibonacci  --> Better performance, why?
###########################

Fbn = 0
C = [0 1]

function arrayloop(A,S,k)
    
    for i = 1:k
        A[1]=S
        S = sum(A)
        A[2] = A[1]
    end
    return S

end

Fbn = arrayloop(C,Fbn,n)

println("The correspond indices number is: ",Fbn)

@time @CPUtime arrayloop(C,Fbn,n)

