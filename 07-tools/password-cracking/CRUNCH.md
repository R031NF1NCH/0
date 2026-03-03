```markdown
# Create Password Lists

## Create custom password list using crunch. Min/max length set to 6 and first 3 letters of password are Lab
```bash
crunch 6 6 -t Lab%%% > wordlist
```

## Generate passwords of 4 to 8 characters using default lowercase charset and save to wordlist.txt
```bash
crunch 4 8 -o wordlist.txt
```

## Create 6-digit numeric passwords using charset file
```bash
crunch 6 6 -f /usr/share/crunch/charset.lst numeric -o numbers.txt
```

## Generate 8-character passwords with 3 lowercase letters, fixed "Pass", and 2 digits
```bash
crunch 8 8 -t @@@Pass%% -o custom.txt
```

## Generate all permutations of the words dog, cat, and bird, ignoring length parameters
```bash
crunch 5 5 -p dog cat bird
```

## Generate 4-character lowercase passwords with a limit of 2 repeated characters
```bash
crunch 4 4 -d 2@ -o limited.txt
```

## Generate 6-character passwords (uppercase, lowercase, digit) and split output into 10MB files
```bash
crunch 6 6 -t ,@% -b 10mb -o split.txt
```

## Generate 7-character passwords starting at abc1234 and ending at xyz9999
```bash
crunch 7 7 -s abc1234 -e xyz9999 -o range.txt
```

## Generate up to 1000 passwords with symbol, lowercase, digit pattern
```bash
crunch 5 5 -t ^%@ -c 1000 -o short.txt
```

## Generate 8-character passwords and compress output to gzip format
```bash
crunch 8 8 -z gzip -o compressed.gz
```
```
