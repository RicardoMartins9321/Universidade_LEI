#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {

    int fd[2];  // fd[0] is the read end of the pipe, fd[1] is the write end of the pipe
    if (pipe(fd) == -1) {
        perror("An error occured while creating the pipe");
        return EXIT_FAILURE;
    }
    int id = fork();
    if (id == -1) {
        perror("An error occured while creating the child process");
        return EXIT_FAILURE;
    }

    if (id == 0) {
        close(fd[0]); // close the read end of the pipe
        int x;
        printf("Enter a number: ");
        scanf("%d", &x);
        // write to the pipe and check for errors
        if (write(fd[1], &x, sizeof(int)) == -1) {
            perror("An error occured while writing to the pipe");
            return EXIT_FAILURE;
        }
        close(fd[1]); // close the write end of the pipe
    } else {
        close(fd[1]); // close the write end of the pipe
        int y;
        if (read(fd[0], &y, sizeof(int)) == -1) {
            perror("An error occured while reading from the pipe");
            return EXIT_FAILURE;
        } // read from the pipe and check for errors
        y = y * 2;
        printf("Got from child process: %d\n", y);
        close(fd[0]); // close the read end of the pipe
    }

    return 0;
}