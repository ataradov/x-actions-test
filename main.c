#include <stdio.h>

#ifndef VERSION
#define VERSION "<undefined>"
#endif

int main(void)
{
  printf("Hello, world! Version '%s'\n", VERSION);
  return 0;
}


