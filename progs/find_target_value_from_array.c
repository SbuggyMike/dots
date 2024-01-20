#include <stdio.h>

int main(){
  int array[] = {0, 1, 2, 3, 4};
  int target;
  int c, d;
  int checker = 0;

  printf("Enter a target value\n");
  scanf("%d", &target);

  for(c = 0; c < sizeof(array) / sizeof(array[0]); c++)
    {
        for(d = c; d < sizeof(array) / sizeof(array[0]); d++)
	  {
	    if(c + d == target)
	      {
		printf ("Array[%d] (%d) and array[%d] (%d) add up to %d.\n", c, array[c], d, array[d], target);
	        checker = 1;
	      }
	  }
    }
  if (checker == 0)
    {
      printf("No values found which add up to %d \n", target);
      return 1;
    }
}
