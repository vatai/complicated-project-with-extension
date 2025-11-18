#!/usr/bin/env python

# ext-modules = [ {name = "foo", sources = ["ext/foo.c"]} ]

from Cython.Build import cythonize
from setuptools import Extension, setup

ext_modules = [
    Extension(
        "foo",
        sources=["ext/foo.c"],
        # libraries=["pet", "isl"],
        # library_dirs=["/home/vatai/code/tadashi/ctadashi/lib"],
        # runtime_library_dirs=["/home/vatai/code/tadashi/ctadashi/lib"],
        # include_dirs=["/home/vatai/code/tadashi/ctadashi/include"],
    )
]

setup(ext_modules=cythonize(ext_modules))
