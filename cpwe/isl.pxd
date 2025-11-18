cdef extern from "isl/ctx.h":
    ctypedef struct isl_ctx: pass
    isl_ctx* isl_ctx_alloc()
    void isl_ctx_free(isl_ctx* ctx)

cdef extern from "isl/union_map.h":
    ctypedef struct isl_union_map: pass
    isl_union_map* isl_union_map_read_from_str(isl_ctx* ctx, const char *str)
    const char *isl_union_map_to_str(isl_union_map *map)
    void isl_union_map_free(isl_union_map* map)
