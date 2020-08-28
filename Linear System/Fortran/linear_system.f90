program linear_system

    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil

    !Fourth exercise: Solving a Linear System --> ax = b


    implicit none
    
    integer :: i, j, k, n, ite
    real, DIMENSION(:), ALLOCATABLE :: mtx_b
    real, DIMENSION(:,:), ALLOCATABLE :: mtx_a
    DOUBLE PRECISION :: start, finish
    DOUBLE PRECISION :: erro, tol
    DOUBLE PRECISION, DIMENSION(:), ALLOCATABLE :: x_k, x_k1

    n = 400
    k = int(SQRT(real(n)))

    ALLOCATE (mtx_a(n,n))
    ALLOCATE (mtx_b(n))

    

    ! Set the A matrix

    do i = 1,n
        do j = 1,n
            if (i==j) then
                            
                mtx_a(i,j) = -4
            
            else if (i==j-3 .or. i==j+3) then

                mtx_a(i,j) = 1

            else if ((mod(i,3)/=0 .and. j==i+1).or.(mod(i,3)/=1 .and. j==i-1)) then
                
                mtx_a(i,j) = 1

            else

                mtx_a(i,j) = 0
            
            end if
        end do
    end do


    ! Set the B matrix

    do i = 1,k
        if (i<k) then

            mtx_b(i) = -50 
        
        else

            mtx_b(i) = -150
        
        endif
    end do

    do i = k+1,n-k
        if (mod(i,k)/=0) then

            mtx_b(i) = 0
        
        else

            mtx_b(i) = -100
        
        endif
    end do

    do i = n-k+1,n
        if (i<n) then

            mtx_b(i) = -50 
        
        else

            mtx_b(i) = -150
        
        endif
    end do
    
    ALLOCATE (x_k(n))
    ALLOCATE (x_k1(n))


    x_k(:) = 0
    x_k1(:) = 1


    erro = norma(x_k1,x_k)
    tol = 1e-9
    ite = 0


    call cpu_time(start)
    do while (erro > tol)

        do i = 1,n

            x_k1(i) = mtx_b(i)

            do j = 1,n
                if (j/=i) then

                    x_k1(i) = x_k1(i) - mtx_a(i,j)*x_k(j)

                endif
            end do

            x_k1(i) = x_k1(i)/mtx_a(i,i)

        end do

        erro = norma(x_k1,x_k)
        x_k = x_k1
        ite = ite + 1

    end do
    call cpu_time(finish)

    print *,'Elapsed time is:',finish - start
    print *, 'Solution: '
    print *, x_k1
    print *, 'Iterations: ',ite


    contains
    
    function norma(vec1,vec2) result(y)

        implicit none

        
        DOUBLE PRECISION, DIMENSION(:), ALLOCATABLE :: vec1, vec2
        DOUBLE PRECISION :: y

        
        y = maxval(ABS(vec1 - vec2))

    end function norma 


end program linear_system