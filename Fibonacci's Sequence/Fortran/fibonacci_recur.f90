program fibonacci_recur
    implicit none
    INTEGER:: n1
    real :: start, finish


    call cpu_time(start)
    n1 = fibonacci_recursive(40)
    call cpu_time(finish)


    print*, 'The number is: ',n1
    print*, 'Elapsed time is: ', finish - start


    contains !Separate the program from the function or sub-routine

    recursive function fibonacci_recursive(n) result(fbn) !
        integer, intent(in) :: n !Intent (in) that is the variable recieves info from outside the function
        integer :: fbn

        select case (n)

            case (:2);      fbn = 1
            case default;   fbn = fibonacci_recursive(n-1) + fibonacci_recursive(n-2)

        end select
    end function fibonacci_recursive

end program fibonacci_recur

