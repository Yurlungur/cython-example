#!/usr/bin/env python2

"""
setup.py

Author: Jonah Miller (jonah.maxwell.miller@gmail.com)
Time-stamp: <2014-10-12 23:20:00 (jonah)>

This program compiles the *.pyx file into a binary. If there are more
files, we can add those too.
"""

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
import numpy,scipy # not necessary here, but included for example purposes
import Cython
import Cython.Compiler
import Cython.Compiler.Options
# An example of an option you might set:
# Cython.Compiler.Options.buffer_max_dims = 9

setup(
    cmdclass = {'build_ext' : build_ext},
    ext_modules = [Extension("pi_monte_carlo",["pi_monte_carlo.pyx"])],
    include_dirs=[numpy.get_include(),scipy.get_include()] # you don't need this for our simple example but I include it because you'll probably want it.
    )
