```markdown
# cURL Commands

1. Upload a file via POST:
```bash
curl -X POST -F "file=@/path/to/your/file.ext" https://example.com/upload
```

2. Simple GET request:
```bash
curl https://example.com
```

3. GET with query parameters:
```bash
curl "https://example.com/search?q=query&sort=asc"
```

4. POST JSON data:
```bash
curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' https://example.com/api
```

5. Basic authentication:
```bash
curl -u username:password https://example.com/protected
```

6. Bearer token authentication:
```bash
curl -H "Authorization: Bearer your_token_here" https://example.com/api
```

7. Download a file:
```bash
curl -O https://example.com/file.zip
```

8. Download and rename file:
```bash
curl -o newname.zip https://example.com/file.zip
```

9. Follow redirects:
```bash
curl -L https://example.com/redirect
```

10. Verbose output:
```bash
curl -v https://example.com
```

11. Silent mode:
```bash
curl -s https://example.com
```

12. POST form data:
```bash
curl -X POST -d "param1=value1&param2=value2" https://example.com/form
```

13. PUT request with data:
```bash
curl -X PUT -d "new data" https://example.com/resource/id
```

14. DELETE request:
```bash
curl -X DELETE https://example.com/resource/id
```

15. Custom headers:
```bash
curl -H "User-Agent: MyCustomAgent" -H "Accept: application/json" https://example.com
```

16. Upload multiple files:
```bash
curl -X POST -F "file1=@/path/file1.txt" -F "file2=@/path/file2.txt" https://example.com/upload
```

17. Resume download:
```bash
curl -C - -O https://example.com/largefile.zip
```

18. Limit rate:
```bash
curl --limit-rate 100K https://example.com/largefile.zip -O
```

19. Proxy usage:
```bash
curl -x http://proxy.example.com:8080 https://example.com
```

20. Cookie handling (save cookies):
```bash
curl -c cookies.txt https://example.com/login
```

21. Send cookies:
```bash
curl -b cookies.txt https://example.com/protected
```

22. HEAD request:
```bash
curl -I https://example.com
```

23. Timeout setting:
```bash
curl --max-time 10 https://example.com
```

24. Ignore SSL errors:
```bash
curl -k https://example.com
```

25. Multipart form with text and file:
```bash
curl -X POST -F "name=John" -F "file=@/path/file.txt" https://example.com/upload
```

26. PATCH request:
```bash
curl -X PATCH -H "Content-Type: application/json" -d '{"key":"newvalue"}' https://example.com/resource/id
```

27. Progress bar:
```bash
curl -# -O https://example.com/file.zip
```

28. User agent spoofing:
```bash
curl -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" https://example.com
```

29. Compressed response:
```bash
curl -H "Accept-Encoding: gzip" --compressed https://example.com
```

30. Upload from stdin:
```bash
echo "data" | curl -X POST -d @- https://example.com/upload
```
```
