program teste

    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil

    !Fourth exercise: Solving a Linear System --> ax = b


    implicit none !To avoid variable definition problems, checking if they are correctly defined
    integer :: i, j, k, n ! = 9
    real :: soma
    
    !n = 9 
    

    real, DIMENSION(9,9) :: mtx_a
    real, DIMENSION(9) :: mtx_b
    DOUBLE PRECISION :: start, finish
    
    k = sqrt(real(9))
    

    call cpu_time(start)

    ! Set the A matrix

    do i = 1,9
        do j = 1,9
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

    do i = 1,9

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





end program teste