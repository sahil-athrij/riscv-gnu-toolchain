#include <p_ext_intrinsic.h>
#include <stdlib.h>
#include <stdint.h>

#if TARGET_32BIT
#define uintXLEN uint32_t
#define intXLEN int32_t
#elif TARGET_64BIT
#define uintXLEN uint64_t
#define intXLEN int64_t
#endif

static __attribute__ ((noinline))
uintXLEN kadd8 (uintXLEN ra, uintXLEN rb)
{
  return __rv__kadd8 (ra, rb);
}

static __attribute__ ((noinline))
uintXLEN kadd16 (uintXLEN ra, uintXLEN rb)
{
  return __rv__kadd16 (ra, rb);
}

static __attribute__ ((noinline))
int64_t kadd64 (int64_t ra, int64_t rb)
{
  return __rv__kadd64 (ra, rb);
}

static __attribute__ ((noinline))
intXLEN kaddh (int32_t ra, int32_t rb)
{
  return __rv__kaddh (ra, rb);
}

static __attribute__ ((noinline))
intXLEN kaddw (int32_t ra, int32_t rb)
{
  return __rv__kaddw (ra, rb);
}

int
main ()
{
  uintXLEN retKadd8  = kadd8  (0x11223344, 0x55667788);
  uintXLEN retKadd16 = kadd16 (0x11223344, 0x55667788);
  intXLEN  retKaddh  = kaddh  (0x11223344, 0x55667788);
  intXLEN  retKaddw  = kaddw (0x11223344, 0x55667788);
  int64_t  retKadd64 = kadd64 (0x11223344, 0x55667788);
}
