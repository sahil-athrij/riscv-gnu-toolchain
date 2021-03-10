#include <p_ext_intrinsic.h>
#include <stdlib.h>

static __attribute__ ((noinline))
long kaddh (int ra, int rb)
{
  return __rv__kaddh (ra, rb);
}
