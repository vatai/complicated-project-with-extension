#!/usr/bin/env python

import os

import setuptools
from Cython.Build import cythonize
from setuptools import Extension, setup

ext_modules = [
    Extension(
        "cpwe.foo",
        sources=["cpwe/foo.py"],
        libraries=["isl"],
        # library_dirs=["/home/vatai/code/tadashi/ctadashi/lib"],
        # runtime_library_dirs=["/home/vatai/code/tadashi/ctadashi/lib"],
        # include_dirs=["/home/vatai/code/tadashi/ctadashi/include"],
    )
]

setup(ext_modules=cythonize(ext_modules))
