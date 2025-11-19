# distutils: language=c++

import cython
from cython.cimports import isl

p_ctx = cython.typedef(cython.pointer[isl.isl_ctx])
p_union_map = cython.typedef(cython.pointer[isl.isl_union_map])


@cython.cclass
class UnionMap:
    _ctx = cython.declare(cython.pointer[isl.isl_ctx])
    _umap = cython.declare(cython.pointer[isl.isl_union_map])

    def __cinit__(self, umap: str):
        self._ctx = isl.isl_ctx_alloc()
        self._umap = isl.isl_union_map_read_from_str(self._ctx, umap.encode())

    def __dealloc__(self):
        if self._ctx is not cython.NULL:
            isl.isl_ctx_free(self._ctx)

    def __repr__(self):
        return isl.isl_union_map_to_str(self._umap).decode()
