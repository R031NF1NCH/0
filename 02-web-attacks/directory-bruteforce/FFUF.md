# FFUF

## Sample Command (Linux / Windows)

```bash
# Linux
ffuf -u "https://test.com/FUZZ" -w "/home/kali/wordlists/dirb/common.txt" -H "Authorization: Bearer asdasdasdasdasas" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0" -mc "200,201,202,204,301,302,307,401,403,429" -k -x http://127.0.0.1:7177 -t 3 -p 0.5 -o output.json -recursion -recursion-depth 3 -recursion-strategy greedy
```

```powershell
# Windows
ffuf -u "https://test.com/FUZZ" -w "C:\Users\R031NF1NCH\Desktop\ffuf\IntruderList.txt" -H "Authorization: Bearer asdasdasdasdasas" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0" -mc "200,201,202,204,301,302,307,401,403,429" -k -x http://127.0.0.1:7177 -t 3 -p 0.5 -o output.json -recursion -recursion-depth 3 -recursion-strategy greedy
```

## Flag Reference

| Flag | Description |
|------|-------------|
| `-u` | URL to target |
| `FUZZ` | Ffuf injects into the URL wherever the word "FUZZ" is placed |
| `-w` | Wordlist location |
| `-H` | Custom header (auth, cookies, User-Agent, etc.) |
| `-mc` | Status codes to report |
| `-k` | Skips SSL certificate verification |
| `-x` | Proxy (e.g. Burp) port and IP |
| `-t` | Threads (use with `-p` for delay) |
| `-p` | Delay in seconds to apply to threads (e.g. `0.5` for half a second) |
| `-o` | Output file |
| `-recursion` | Turn on recursion so ffuf discovers files/directories from previously discovered items |
| `-recursion-depth` | Number of directories deep ffuf will attempt to discover items |
| `-recursion-strategy greedy` | Force ffuf to recurse into discovered directories (it won't recurse if it thinks it found a file) |
| `-fs` | Filter by response size |
| `-fc` | Filter by status code |
| `-fr` | Filter by regex in response |
| `-c` | Colourised output |
| `-v` | Verbose output |
| `-X` | HTTP method |
| `-d` | POST data |

---

## Use Cases

### Directory Discovery

```bash
ffuf -w /path/to/wordlist -u https://target/FUZZ -x http://proxy:8080
```

### WAF Bypass with Classical Headers

```bash
ffuf -c -w "/opt/host/main.txt:FILE" -H "X-Originating-IP: 127.0.0.1, X-Forwarded-For: 127.0.0.1, X-Remote-IP: 127.0.0.1, X-Remote-Addr: 127.0.0.1, X-Client-IP: 127.0.0.1" -fs 5682,0 -u https://target/FUZZ
```

### Match All Responses, Filter by Content Size

```bash
ffuf -w wordlist.txt -u https://example.org/FUZZ -mc all -fs 42 -c -v
```

### Fuzz Host Header (Match HTTP 200)

```bash
ffuf -w hosts.txt -u https://example.org/ -H "Host: FUZZ" -mc 200
```

### Virtual Host Discovery (Without DNS Records)

```bash
ffuf -w /path/to/vhost/wordlist -u https://target -H "Host: FUZZ" -fs 4242
```

### Rate-Limited Scan (Threads + Delay)

```bash
ffuf -u https://target/FUZZ -w /home/mdayber/Documents/Tools/Wordlists/WebContent_Discovery/content_discovery_4500.txt -c -p 0.1 -t 10
```

### GET Parameter Fuzzing (Discover Param Names)

```bash
ffuf -w /path/to/paramnames.txt -u https://target/script.php?FUZZ=test_value -fs 4242
```

### GET Parameter Fuzzing (Known Param, Fuzz Values)

```bash
ffuf -w /path/to/values.txt -u https://target/script.php?valid_name=FUZZ -fc 401
```

### POST Parameter Fuzzing

```bash
ffuf -w /path/to/postdata.txt -X POST -d "username=admin\&password=FUZZ" -u https://target/login.php -fc 401
```

### POST JSON Fuzzing (Filter Responses Containing "error")

```bash
ffuf -w entries.txt -u https://example.org/ -X POST -H "Content-Type: application/json" \
  -d '{"name": "FUZZ", "anotherkey": "anothervalue"}' -fr "error"
```
