program mtx_multi_loop

    !Undergraduate Student: Arturo Burgos
    !Professor: João Rodrigo Andrade
    !Federal University of Uberlândia - UFU, Fluid Mechanics Laboratory
    !MFLab, Block 5P, Uberlândia, MG, Brazil

    implicit none !To avoid variable definition problems, checking if they are correctly defined
    integer :: i, j, k
    real :: soma
    real, DIMENSION(1500,1500) :: mtx1, mtx2, mtx3
    DOUBLE PRECISION :: start, finish
    
    call random_number(mtx1)
    call random_number(mtx2)
    

    call cpu_time(start)

    do i = 1,1500

        do j = 1,1500
            soma = 0
            do k = 1,1500
            
                soma = soma + mtx1(i,k)*mtx2(k,j)
                mtx3(i,j) = soma

            end do

        end do

    end do

    call cpu_time(finish)

    print *,'Elapsed time is:',finish - start

end program mtx_multi_loop