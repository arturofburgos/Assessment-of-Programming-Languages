program linear_system_test

    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil

    !Fourth exercise: Solving a Linear System --> ax = b


    implicit none !To avoid variable definition problems, checking if they are correctly defined
    

    integer :: i, j, k, n, ite
    
    real, DIMENSION(:,:), ALLOCATABLE :: mtx_a
    real, DIMENSION(:), ALLOCATABLE :: mtx_b
    DOUBLE PRECISION :: start, finish
    DOUBLE PRECISION :: erro, tol
    DOUBLE PRECISION, DIMENSION(:), ALLOCATABLE :: x_k, x_k1

    
    
    n = 9
    k = int(SQRT(real(n)))

    ALLOCATE (mtx_a(n,n))
    ALLOCATE (mtx_b(n))

    call cpu_time(start)

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


    ! Show Matrix A in the output

    print*, 'The matrix A is: '
    write(*,'(/A)')

    do i = 1,n

        write(*,1) int(mtx_a(i,:))
        1 format(9i3)
        !write(*,1) mtx_a(i,:)
        !1 format(16f5.0)
        
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
    
    write(*,'(/A)')

    ! Show Matrix A in the output

    print*, 'The matrix B is: '
    write(*,'(/A)')


    write(*,2) int(mtx_b(:))
    2 format(9i5)

    ALLOCATE (x_k(n))
    ALLOCATE (x_k1(n))

    
    write(*,'(/A)')

    x_k(:) = 0

    write(*,3) int(x_k)
    3 format(9i4)


    x_k1(:) = 1

    !print *, x_k1
    write(*,4) int(x_k1)
    4 format(9i4)


    erro = norma(x_k1,x_k)    
    
    write(*,5) erro
    5 format(1f10.8)
    
    tol = 1e-14

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

    write(*,'(/A)')

    print *,'Elapsed time is:',finish - start
    print *, 'Solution: '
    write(*,6) real(x_k1)
    6 format(9f7.2)
    print *, 'Iterations: ',ite

    

    contains
    
    function norma(vec1,vec2) result(y)

        implicit none

        
        DOUBLE PRECISION, DIMENSION(:), ALLOCATABLE :: vec1, vec2
        DOUBLE PRECISION :: y

        
        y = maxval(ABS(vec1 - vec2))

    end function norma 

end program linear_system_test