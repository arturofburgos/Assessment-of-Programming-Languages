

n = 0 

while n < 10 
    global n = n + 1
    println(n)

    for i = 1:5
        println("oi")
    end
end

a = zeros(n,n)

for i = 1:n
  for j = 1:n
    if i==j

      a[i,j] = -4
    
    elseif i == j-3 | i == j+3

      a[i,j] = 1

    elseif (mod(i,3) != 0 & j == i+1) 

      a[i,j] = 1

    elseif (mod(i,3) != 1 & j == i - 1)

      a[i,j] = 1
    
    end
  end
end

println("The A matrix is: ")

for i = 1:n

  println(a[i,:])
  
end

