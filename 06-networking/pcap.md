# tcpdump Commands (Basic Reading and Filtering)

tcpdump -r capture.pcap - Reads and displays all packets.
tcpdump -r capture.pcap -n - Displays packets without name resolution.
tcpdump -r capture.pcap -v - Verbose output with more details.
tcpdump -r capture.pcap -vv - Even more verbose output.
tcpdump -r capture.pcap -X - Shows hex and ASCII packet contents.
tcpdump -r capture.pcap -c 100 - Limits to first 100 packets.
tcpdump -r capture.pcap 'tcp port 443' - Filters HTTPS traffic.
tcpdump -r capture.pcap 'udp port 53' - Filters DNS traffic.
tcpdump -r capture.pcap 'icmp' - Filters ICMP packets (e.g., pings).
tcpdump -r capture.pcap 'host 8.8.8.8' - Filters by specific host IP.
tcpdump -r capture.pcap 'net 192.168.0.0/24' - Filters by network subnet.
tcpdump -r capture.pcap 'tcp flags ack' - Filters TCP ACK packets.
tcpdump -r capture.pcap 'tcp[13] & 2 != 0' - Filters TCP SYN packets (using byte offset).
tcpdump -r capture.pcap 'ether src 00:11:22:33:44:55' - Filters by source MAC address.
tcpdump -r capture.pcap -w filtered.pcap 'port 80' - Writes filtered packets to a new file.

# tshark Commands (Wireshark CLI for Detailed Analysis)

tshark -r capture.pcap - Reads and displays packets (Wireshark's CLI equivalent to tcpdump).
tshark -r capture.pcap -Y "http" - Filters HTTP traffic using display filters.
tshark -r capture.pcap -Y "tcp.port == 80" - Filters by TCP port.
tshark -r capture.pcap -V - Detailed protocol tree for each packet.
tshark -r capture.pcap -x - Hex dump of packets.
tshark -r capture.pcap -T fields -e ip.src -e ip.dst -e tcp.port - Extracts source/dest IPs and TCP ports.
tshark -r capture.pcap -z io,stat,1 - Generates I/O statistics every 1 second.
tshark -r capture.pcap -z conv,tcp - Shows TCP conversation statistics.
tshark -r capture.pcap -z http,tree - HTTP request/response tree statistics.
tshark -r capture.pcap -Y "frame contains 'password'" - Searches for strings in packets.
tshark -r capture.pcap -O http - Decodes only HTTP protocol details.
tshark -r capture.pcap -e frame.time -T fields - Extracts timestamps for each packet.
tshark -r capture.pcap -z expert - Shows expert info (errors, warnings).
tshark -r capture.pcap -z rtp,streams - Analyzes RTP streams (e.g., VoIP).
tshark -r capture.pcap -z wlan,stat - WLAN (Wi-Fi) statistics.

# Wireshark GUI and Related Commands

wireshark -r capture.pcap - Opens the PCAP in Wireshark GUI for visual analysis.
wireshark -r capture.pcap -Y "http.request.method == GET" - Opens with a pre-applied HTTP GET filter.
wireshark -r capture.pcap -o "gui.window_title:MyCapture" - Opens with a custom window title.
dumpcap -r capture.pcap - Dumps packets (part of Wireshark suite, similar to basic read).
text2pcap -T 1234,5678 input.txt output.pcap - Converts text/hex dump to PCAP (useful for recreating from logs).

# File Manipulation and Info Commands (Wireshark Suite)

capinfos capture.pcap - Summary info (packet count, duration, etc.).
editcap -d capture.pcap dedup.pcap - Removes duplicates.
mergecap -w merged.pcap file1.pcap file2.pcap - Merges PCAP files.
editcap -c 500 capture.pcap split - Splits into files of 500 packets each.
editcap -r capture.pcap filtered.pcap 1-100 - Extracts first 100 packets to new file.
reordercap capture.pcap sorted.pcap - Reorders packets by timestamp.

# Other Tools and Advanced Commands

ngrep -I capture.pcap 'user|pass' 'tcp port 21' - Searches for FTP credentials.
ssldump -r capture.pcap -k keyfile.pem - Decrypts SSL/TLS (with private key).
tcptrace -l capture.pcap - Long TCP connection stats.
zeek -r capture.pcap - Runs Zeek for network event logging.
strings capture.pcap | grep -i 'http' - Extracts strings and filters for HTTP.
hexdump -C capture.pcap | less - Hex dumps the file for paging.
xxd capture.pcap | head -n 50 - Hex dumps first 50 lines.
file capture.pcap - Checks file type and metadata.
tcpreplay -i eth0 capture.pcap - Replays packets on an interface (for testing).
