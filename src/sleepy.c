#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>  // Header file for sleep()

// Function to sleep for a specified number of milliseconds.
void sleep_ms(int milliseconds)
{
    // Convert milliseconds to microseconds
    usleep(milliseconds * 1000);
}

// Note: I had to rename it from 'main' to 'sleepy_main' to avoid a name conflict with Ada's 'main' function.
int sleepy_main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <seconds>\n", argv[0]);
        return 1;
    }

    int delay_ms = atoi(argv[1]);  // Convert the argument to an integer
    if (delay_ms < 0) {
        printf("Please enter a non-negative number of seconds.\n");
        return 1;
    }

    printf("C Sleepy_Task Delaying for %d ms...\n", delay_ms);
    sleep_ms(delay_ms);  // POSIX sleep function
    printf("C Sleepy_Task Delay complete.\n");

    return 0;
}