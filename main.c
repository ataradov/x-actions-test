#include <stdio.h>

#ifndef VERSION
#define VERSION "<undefined>"
#endif

int main(void)
{
  printf("CMSIS-DAP SWD programmer %s, built " __DATE__ " " __TIME__ " \n\n", VERSION);

  return 0;
}


