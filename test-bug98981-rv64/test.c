extern void sub2 (void);

void
test (int *i, int *j)
{
  int k = *i + 1;
  *j = k;
  if (k == 0)
    sub2 ();
}
