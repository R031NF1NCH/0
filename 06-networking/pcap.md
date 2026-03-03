```markdown
# Packet Capture & Analysis Commands

## tcpdump Commands (Basic Reading and Filtering)

**Reads and displays all packets.**
```bash
tcpdump -r capture.pcap
```

**Displays packets without name resolution.**
```bash
tcpdump -r capture.pcap -n
```

**Verbose output with more details.**
```bash
tcpdump -r capture.pcap -v
```

**Even more verbose output.**
```bash
tcpdump -r capture.pcap -vv
```

**Shows hex and ASCII packet contents.**
```bash
tcpdump -r capture.pcap -X
```

**Limits to first 100 packets.**
```bash
tcpdump -r capture.pcap -c 100
```

**Filters HTTPS traffic.**
```bash
tcpdump -r capture.pcap 'tcp port 443'
```

**Filters DNS traffic.**
```bash
tcpdump -r capture.pcap 'udp port 53'
```

**Filters ICMP packets (e.g., pings).**
```bash
tcpdump -r capture.pcap 'icmp'
```

**Filters by specific host IP.**
```bash
tcpdump -r capture.pcap 'host 8.8.8.8'
```

**Filters by network subnet.**
```bash
tcpdump -r capture.pcap 'net 192.168.0.0/24'
```

**Filters TCP ACK packets.**
```bash
tcpdump -r capture.pcap 'tcp flags ack'
```

**Filters TCP SYN packets (using byte offset).**
```bash
tcpdump -r capture.pcap 'tcp[13] & 2 != 0'
```

**Filters by source MAC address.**
```bash
tcpdump -r capture.pcap 'ether src 00:11:22:33:44:55'
```

**Writes filtered packets to a new file.**
```bash
tcpdump -r capture.pcap -w filtered.pcap 'port 80'
```

## tshark Commands (Wireshark CLI for Detailed Analysis)

**Reads and displays packets (Wireshark's CLI equivalent to tcpdump).**
```bash
tshark -r capture.pcap
```

**Filters HTTP traffic using display filters.**
```bash
tshark -r capture.pcap -Y "http"
```

**Filters by TCP port.**
```bash
tshark -r capture.pcap -Y "tcp.port == 80"
```

**Detailed protocol tree for each packet.**
```bash
tshark -r capture.pcap -V
```

**Hex dump of packets.**
```bash
tshark -r capture.pcap -x
```

**Extracts source/dest IPs and TCP ports.**
```bash
tshark -r capture.pcap -T fields -e ip.src -e ip.dst -e tcp.port
```

**Generates I/O statistics every 1 second.**
```bash
tshark -r capture.pcap -z io,stat,1
```

**Shows TCP conversation statistics.**
```bash
tshark -r capture.pcap -z conv,tcp
```

**HTTP request/response tree statistics.**
```bash
tshark -r capture.pcap -z http,tree
```

**Searches for strings in packets.**
```bash
tshark -r capture.pcap -Y "frame contains 'password'"
```

**Decodes only HTTP protocol details.**
```bash
tshark -r capture.pcap -O http
```

**Extracts timestamps for each packet.**
```bash
tshark -r capture.pcap -e frame.time -T fields
```

**Shows expert info (errors, warnings).**
```bash
tshark -r capture.pcap -z expert
```

**Analyzes RTP streams (e.g., VoIP).**
```bash
tshark -r capture.pcap -z rtp,streams
```

**WLAN (Wi-Fi) statistics.**
```bash
tshark -r capture.pcap -z wlan,stat
```

## Wireshark GUI and Related Commands

**Opens the PCAP in Wireshark GUI for visual analysis.**
```bash
wireshark -r capture.pcap
```

**Opens with a pre-applied HTTP GET filter.**
```bash
wireshark -r capture.pcap -Y "http.request.method == GET"
```

**Opens with a custom window title.**
```bash
wireshark -r capture.pcap -o "gui.window_title:MyCapture"
```

**Dumps packets (part of Wireshark suite, similar to basic read).**
```bash
dumpcap -r capture.pcap
```

**Converts text/hex dump to PCAP (useful for recreating from logs).**
```bash
text2pcap -T 1234,5678 input.txt output.pcap
```

## File Manipulation and Info Commands (Wireshark Suite)

**Summary info (packet count, duration, etc.).**
```bash
capinfos capture.pcap
```

**Removes duplicates.**
```bash
editcap -d capture.pcap dedup.pcap
```

**Merges PCAP files.**
```bash
mergecap -w merged.pcap file1.pcap file2.pcap
```

**Splits into files of 500 packets each.**
```bash
editcap -c 500 capture.pcap split
```

**Extracts first 100 packets to new file.**
```bash
editcap -r capture.pcap filtered.pcap 1-100
```

**Reorders packets by timestamp.**
```bash
reordercap capture.pcap sorted.pcap
```

## Other Tools and Advanced Commands

**Searches for FTP credentials.**
```bash
ngrep -I capture.pcap 'user|pass' 'tcp port 21'
```

**Decrypts SSL/TLS (with private key).**
```bash
ssldump -r capture.pcap -k keyfile.pem
```

**Long TCP connection stats.**
```bash
tcptrace -l capture.pcap
```

**Runs Zeek for network event logging.**
```bash
zeek -r capture.pcap
```

**Extracts strings and filters for HTTP.**
```bash
strings capture.pcap | grep -i 'http'
```

**Hex dumps the file for paging.**
```bash
hexdump -C capture.pcap | less
```

**Hex dumps first 50 lines.**
```bash
xxd capture.pcap | head -n 50
```

**Checks file type and metadata.**
```bash
file capture.pcap
```

**Replays packets on an interface (for testing).**
```bash
tcpreplay -i eth0 capture.pcap
```
```
