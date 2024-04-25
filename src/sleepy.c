#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>  // Header file for sleep()

// Function to sleep for a specified number of seconds.

// Note: I had to rename it from 'main' to 'sleepy_main' to avoid a name conflict
int sleepy_main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <seconds>\n", argv[0]);
        return 1;
    }

    int delay_seconds = atoi(argv[1]);  // Convert the argument to an integer
    if (delay_seconds < 0) {
        printf("Please enter a non-negative number of seconds.\n");
        return 1;
    }

    printf("Delaying for %d seconds...\n", delay_seconds);
    sleep(delay_seconds);  // POSIX sleep function
    printf("Delay complete.\n");

    return 0;
}