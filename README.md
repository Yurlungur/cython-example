CYTHON EXAMPLE
======================================================================

Author: Jonah Miller (jonah.maxwell.miller@gmail.com)
Time-stamp: <2014-10-13 00:14:14 (jonah)>    

Open the IPython notebook through a walkthrough of how to change raw
Python code to Cython code and to look at the speedup it gives.

Or open the *.pyx file to look at what a Cython file looks like.

To compile the Cython code, simply run:
    python setup.py build_ext --inplace

The setup.py defines which files to compile. The files ending in .pyx
are Cython files.

Cython will generate two types of files: files ending in .c and files
and files ending in .o. The files ending in .c are c source code that
was generated based on the Python code. The files ending in .o are
compiled library files that Python can read. To use a file named
library.o, simply start Python and type:
    import library