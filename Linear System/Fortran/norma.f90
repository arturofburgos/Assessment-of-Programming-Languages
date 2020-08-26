program norma

        implicit none
        
        real :: b
        real, DIMENSION(:), ALLOCATABLE :: numbers

        numbers = (/1.5, 54.236879,12.5,0.9,7.2 /)

        b = normainf(numbers)
        
        write(*,2) b
        2 format(1f9.6)
        
    
        contains
        
        function normainf(vec) result(y)
    
            implicit none
    
            
            real, DIMENSION(:), ALLOCATABLE :: vec
            real :: y
           
            
            y = maxval(ABS(vec))
    
        end function normainf 


end program norma



