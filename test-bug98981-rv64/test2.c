#include <stdint.h>
int a[256], b[256];
int32_t test() {
  int32_t xme = 0, sc=0;
  for (int32_t i = 0; i < 100; i++) {
    if ((sc=a[i]+b[i]) > xme) xme=sc;
  }
  return xme;
}