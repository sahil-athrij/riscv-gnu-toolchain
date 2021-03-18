#include <p_ext_intrinsic.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>

#if __LP64__
#define uintXLEN uint64_t
#define intXLEN int64_t
#else
#define uintXLEN uint32_t
#define intXLEN int32_t
#endif

static __attribute__ ((noinline))
uintXLEN sra16 (uintXLEN ra, uint32_t rb)
{
  return __rv__sra16 (ra, rb);
}

static __attribute__ ((noinline))
uintXLEN sra16u (uintXLEN ra, uint32_t rb)
{
  return __rv__sra16u (ra, rb);
}

static __attribute__ ((noinline))
uintXLEN sra16i (uintXLEN ra)
{
  return __rv__srai16 (ra, 5);
}

static __attribute__ ((noinline))
uintXLEN sra16iu (uintXLEN ra)
{
  return __rv__srai16u (ra, 5);
}

int
main ()
{
    uint32_t shift = 1;
#if __LP64__
    uint64_t var1 = 0x0ffff7fffffff;
    uint64_t var2 = 0xffffffffffffff;
    uint64_t var3 = 0xfffffffffff;
    uint64_t var4 = 0x11fffffffffff;
    assert(sizeof(long) == 4);
#else
    uint32_t var1 = 0x7fffffff;
    uint32_t var2 = 0xffffffff;
    uint32_t var3 = 0xffffffff;
    uint32_t var4 = 0xfff;
    assert(sizeof(long) == 2);
#endif
    uintXLEN retSra16   = sra16 (var1, shift);
    uintXLEN retSra16u  = sra16u (var2, shift);
    uintXLEN retSra16i  = sra16i (var3);
    uintXLEN retSra16iu = sra16iu (var4);
}
