#!/usr/bin/env python

import cython
from cython.cimports import isl

p_ctx = cython.typedef(cython.pointer[isl.isl_ctx])
p_union_map = cython.typedef(cython.pointer[isl.isl_union_map])
ctx = cython.declare(p_ctx)
ctx = isl.isl_ctx_alloc()
umap = cython.declare(p_union_map)
umap = isl.isl_union_map_read_from_str(ctx, "[N] -> {}")

print(isl.isl_union_map_to_str(umap))
print("{ctx=}")
isl.isl_ctx_free(ctx)
