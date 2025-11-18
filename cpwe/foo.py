#!/usr/bin/env python

import cython
from cython.cimports import isl

# pet_scop_p_vec = cython.typedef(vector[ctadashi.pet_scop_p])

p_ctx = cython.typedef(cython.pointer[isl.isl_ctx])
ctx = cython.declare(p_ctx)
ctx = isl.isl_ctx_alloc()
# isl.isl_ctx_free(ctx)
