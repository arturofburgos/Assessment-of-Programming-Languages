program x

    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil

    !Fourth exercise: Solving a Linear System --> ax = b


    implicit none !To avoid variable definition problems, checking if they are correctly defined
    

    integer :: i, j, k, n , a, b
    real, DIMENSION(:,:), ALLOCATABLE :: mtx_a
    real, DIMENSION(:), ALLOCATABLE :: mtx_b
    DOUBLE PRECISION :: start, finish
    real, dimension(:), ALLOCATABLE :: numbers

    b = 0
    
    n = 16
    k = SQRT(real(n))

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

    call cpu_time(finish)

    print *,'Elapsed time is:',finish - start

    ! Show Matrix A in the output

    print*, 'The matrix A is: '
    write(*,'(/A)')

    do i = 1,n

        write(*,1) int(mtx_a(i,:))
        1 format(16i3)
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
    2 format(16i5)

    numbers = (/1.5, 54.2,12.5,0.9,7.2 /)

    b = norma(numbers)
    
    write(*,3) b
    3 format(1f5.2)
    

    contains
    
    function norma(vec) result(y)

        implicit none

        
        real, DIMENSION(:), ALLOCATABLE :: vec
        real :: y


     
        
        y = maxval(ABS(vec))

    end function norma 



end program x