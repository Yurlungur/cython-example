#!python
#cython: profile=True

"""
pi_monte_carlo.pyx

Author: Jonah Miller (jonah.maxwell.miller@gmail.com)
Time-stamp: <2014-10-13 00:13:01 (jonah)>

This is the cythonized monte carlo code.
"""

# First import libraries we need:
import random
cimport cython # the library that controls c compilation

# Important constants
# ----------------------------------------------------------------------
# Note that we use the "cdef" command to define variables. Also note
# that we declare their type.
cdef double radius = 1.0 # Radius of the circle and square
cdef double rectangle_xmin = -radius
cdef double rectangle_ymin = rectangle_xmin
cdef double rectangle_width = 2*radius
cdef double rectangle_height = rectangle_width
cdef double rectangle_xmax = rectangle_xmin + rectangle_width
cdef double rectangle_ymax = rectangle_ymin + rectangle_height
# ----------------------------------------------------------------------


cpdef double estimate_pi(int square_count,int circle_count):
    """
    The area of the circle divided by the area of the square is pi/4.
    """
    if square_count != 0:
        return (4.0*circle_count)/square_count
    else:
        return 0.0

cpdef double monte_carlo_for_pi(int num_random_samples):
    """
    Calculates the value for pi by monte carlo algorithm. Generates
    data that can be animated.
    """
    # The total counta nd circle count
    cdef int total_count = 0
    cdef int circle_count = 0

    # To get a speed up, we need to declare variables before we use them
    cdef double x,y # These will be the x,y coordinates of darts.

    # Start the pseudorandom process
    random.seed()

    # throw darts and see if they land in the circle
    cdef int i # to get a speedup, loop variables must be declared.
    for i in range(num_random_samples):
        x = random.uniform(rectangle_xmin,rectangle_xmax)
        y = random.uniform(rectangle_ymin,rectangle_ymax)
        if x**2 + y**2 <= radius:
            circle_count += 1
        total_count += 1

    return estimate_pi(total_count,circle_count)
