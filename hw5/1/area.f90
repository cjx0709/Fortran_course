module area_module
    implicit none
    interface area
    module procedure area_circle, area_rectangle
    end interface

    contains
        function area_circle(r)
        !Calculate area of a circle, if one arg recieved.
            Real :: area_circle, r
            area_circle = 3.14159265358979 * r**2
        end function area_circle

        function area_rectangle(a, b)
        !Calculate area of a rectangle, if two args recieved.
            Real :: area_rectangle, a, b
            area_rectangle = a * b
        end function area_rectangle
end module area_module
