#include <stdio.h>

void main (){
  int a = 5;
  int *pa = &a;
  printf("Pointer: %d, %d\n", &a, *pa);
  return;
}
