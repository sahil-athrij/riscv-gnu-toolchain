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
uintXLEN kabs8 (uintXLEN ra)
{
  return __rv__kabs8 (ra);
}

static __attribute__ ((noinline))
uintXLEN kabs16 (uintXLEN ra)
{
  return __rv__kabs16 (ra);
}

static __attribute__ ((noinline))
uintXLEN kabsw (intXLEN ra)
{
  return __rv__kabsw (ra);
}

int
main ()
{
#if __LP64__
  assert(sizeof(long) == 4);
#else
  assert(sizeof(long) == 2);
#endif
  uintXLEN retKabs8  = kabs8  (0x11223344);
  uintXLEN retKabs16 = kabs16 (0x1123344);
  uintXLEN retKabsw  = kabsw  (0x11223344);
}