// exception_test.c
#include <stdio.h>

void cause_exception(void) {
    int a = 1;
    int b = 0;
    printf("About to cause an exception...\n");
    int c = a / b; // This will cause a division by zero error
    printf("This line will never be printed because of the exception: %d\n", c);
}
