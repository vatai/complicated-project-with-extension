#!/usr/bin/env python

from Cython.Build import cythonize
from setuptools import Extension, setup

ext_modules = [
    Extension(
        "cpwe.foo",
        sources=[
            "cpwe/foo.c",
        ],
        # libraries=["pet", "isl"],
        # library_dirs=["/home/vatai/code/tadashi/ctadashi/lib"],
        # runtime_library_dirs=["/home/vatai/code/tadashi/ctadashi/lib"],
        # include_dirs=["/home/vatai/code/tadashi/ctadashi/include"],
    )
]

setup(ext_modules=cythonize(ext_modules))
