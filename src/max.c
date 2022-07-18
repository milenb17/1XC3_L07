/*******************************************************************************
*
* Purpose: Prints the maximum number of any number of int command-line 
* arguments that are provided.  So if this program is run with:
*   ./max 5 10 20 25 15
* then we can expect it to print 25.
*
*******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include "library.h"

int main(int argc, char *argv[])
{
  int length = argc - 1;
  int arr[length];
  for (int i = 0; i <  length; i++) {
    arr[i] = atoi(argv[i+1]);
  }
  int m = max(arr, length);
  printf("%d\n", m);

  return 0;
}
