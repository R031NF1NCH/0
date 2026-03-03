```markdown
# cewl Commands

\# Make wordlist of website, crawl 3 pages deep and save all words as lowercase
```bash
cewl http://192.168.3.5/ --lowercase -d 3
```

\# To spider a site for a given depth and minimum word length
```bash
cewl -d <depth> -m <min word length> <url>
```

\# To spider a site and store email addresses in a separate file
```bash
cewl -e -email_file <file> <url>
```

\# Save the generated wordlist to a specified file
```bash
cewl -w wordlist.txt <url>
```

\# Crawl 2 pages deep, minimum word length 5, save to output.txt
```bash
cewl -d 2 -m 5 -w output.txt <url>
```

\# Spider a site with basic HTTP authentication
```bash
cewl --auth_type basic --auth_user <username> --auth_pass <password> <url>
```

\# Keep the original case of words while crawling 3 pages deep
```bash
cewl -k -d 3 <url>
```

\# Include word frequency count in the output and save to countlist.txt
```bash
cewl -c -w countlist.txt <url>
```

\# Crawl 2 pages deep without saving numbers in the wordlist
```bash
cewl -n -d 2 <url>
```

\# Include meta data in the wordlist and save to file
```bash
cewl -a -w wordlist_with_meta.txt <url>
```

\# Use a proxy server to spider the site
```bash
cewl --proxy_host <host> --proxy_port <port> <url>
```

\# Run in verbose mode to show detailed output while crawling 2 pages deep
```bash
cewl -v -d 2 <url>
```

\# Exclude numbers and set minimum word length to 4
```bash
cewl --no_numbers -m 4 <url>
```

\# Save both emails and wordlist to separate files
```bash
cewl -e -email_file emails.txt -w wordlist.txt <url>
```

\# Use a custom User-Agent header while crawling
```bash
cewl --header "User-Agent: CustomAgent" <url>
```

\# Crawl 4 pages deep and convert all words to lowercase
```bash
cewl -d 4 --lowercase <url>
```

\# Include numbers in the wordlist and save to file
```bash
cewl --with_numbers -w num_wordlist.txt <url>
```
```
