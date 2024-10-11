#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <errno.h>
#include <fcntl.h>

/* Special propertie of the fifo: Opening the read or write end of FIFO blocks until 
    the other end is also opened (by another process or thread), which basically means
    that if you initiate it with the process of writing it's gonna hang waiting until
    there comes along a process of reading, momement in which the writing stops
    
    To use the Fifo you must have two terminals windows:
    One that is running your C program and another one where you write the arguments*/

int main(int argc, char* argv[]) {
    if (mkfifo("fifo1", 0777) == -1) {
        if (errno != EEXIST) {
            perror("An error occured while creating the FIFO");
            return EXIT_FAILURE;
        }
    }

    printf("Opening...\n");
    int fd = open("fifo1", O_WRONLY);   // open the FIFO for writing only
    if (fd == -1) {
        perror("An error occured while opening the FIFO");
        return EXIT_FAILURE;
    }
    printf("Opened the FIFO\n");

    int x = 5;
    if (write(fd, &x, sizeof(x)) == -1) {
        perror("An error occured while writing to the FIFO");
        return EXIT_FAILURE;
    }
    printf("Wrote to the FIFO\n");

    close(fd);
    printf("Closed the FIFO\n");
    return 0;
}
