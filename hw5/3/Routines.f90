module Routines
    use Global
    implicit none
    contains

        subroutine init
            implicit none
            Integer :: i
            forall (i = 1:nx)
                x(i) = (i-1) * dx + x_range(1)
            end forall
            u = exp(-(x/0.1)**2)
            u_last = u
            u_next = u
            t = 0
        end subroutine init

        subroutine next
            implicit none
            Real, save :: u_t(0:nx+1), alpha

            dt = dx*CFL/maxval(abs(u))
            u_t(1:nx) = u
            u_t(0) = 0
            u_t(nx+1) = 0

            alpha = 2*b*dt/dx**2

            u_next = (u + alpha*(u_t(2:nx+1) - u_last + u_t(0:nx-1)))/(1+alpha)
            u_last = u
            u = u_next
            t = t + dt
        end subroutine next
end module Routines
