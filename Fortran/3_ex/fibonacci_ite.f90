program fibonacci_ite
    implicit none
    
    INTEGER :: A,B,S1,S2,i
    DOUBLE PRECISION :: start1, finish1, start2, finish2
    INTEGER :: C(0:1) !Defining an array ----> do not forget


    print*, 'Fibonacci s indice value for n = 50'
    write(*,'(/A)')

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    !Variable iterative fibonacci 
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    A = 0 
    B = 1
    S1 = 0

    call cpu_time(start1)
    do i = 1,45

        A = S1
        S1 = A + B
        B = A

    end do 
    call cpu_time(finish1)

    print*,'Variable iterative fibonacci'
    print*, 'The number is: ',S1
    print*, finish1 - start1

    write(*,'(/A)')

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    !Array iterative fibonacci 
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    C(0) = 0
    C(1) = 1

    S2 = 0
    
    !print*, C !--> Just to be more clear

    call cpu_time(start2)
    do i = 1,45

        C(0) = S2
        S2 = sum(C)
        C(1) = C(0)

    end do
    call cpu_time(finish2)

    print*,'Array iterative fibonacci'
    print*, 'The number is: ',S2
    print *, finish2 - start2
    

end program fibonacci_ite