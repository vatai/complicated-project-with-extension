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
        library_dirs=["/project/isl/.libs"],
        runtime_library_dirs=["/project/isl/.libs"],
        include_dirs=["/project/isl/include"],
    )
]

setup(ext_modules=cythonize(ext_modules))
