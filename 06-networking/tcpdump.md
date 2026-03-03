### Installation and Setup
1. Install tcpdump on Linux  
   sudo apt install tcpdump   *or*   sudo yum install tcpdump
2. On macOS, verify pre-installed version  
   tcpdump --version
3. For Windows, download and install WinDump  
   (download from winpcap.org)
4. Run with elevated privileges  
   sudo tcpdump   *or*   as root

### Basic Capturing
5. Capture on specific interface  
   sudo tcpdump -i eth0
6. Capture on all interfaces  
   sudo tcpdump -i any
7. Stop capture  
   Ctrl+C
8. Limit to specific packet count  
   sudo tcpdump -c 100 -i eth0
9. Rotate files by count and size  
   sudo tcpdump -W 5 -C 10 -w capture.pcap
10. Enable promiscuous mode  
    sudo tcpdump -p -i eth0

### Filters
11. Filter by host IP  
    sudo tcpdump host 192.168.1.1
12. Filter source host  
    sudo tcpdump src host 192.168.1.1
13. Filter destination host  
    sudo tcpdump dst host 192.168.1.1
14. Filter by network CIDR  
    sudo tcpdump net 192.168.1.0/24
15. Filter by protocol  
    sudo tcpdump tcp   *or*   sudo tcpdump udp
16. Filter by port  
    sudo tcpdump port 80
17. Combine filters with and/or  
    sudo tcpdump 'tcp port 80 and host 192.168.1.1'
18. Filter HTTP and HTTPS  
    sudo tcpdump 'tcp port 80 or tcp port 443'
19. Exclude specific traffic  
    sudo tcpdump 'not port 22'
20. Filter VLAN-tagged traffic  
    sudo tcpdump vlan 100

### Output and Saving
21. Save capture to PCAP file  
    sudo tcpdump -w capture.pcap -i eth0
22. Read from saved PCAP file  
    tcpdump -r capture.pcap
23. Increase output detail  
    sudo tcpdump -v   *or*   -vv   *or*   -vvv -i eth0
24. Human-readable timestamps  
    sudo tcpdump -tttt -i eth0
25. Show hex and ASCII packet data  
    sudo tcpdump -X -i eth0
26. Limit bytes captured per packet  
    sudo tcpdump -s 100 -i eth0
27. Disable name resolution  
    sudo tcpdump -n -i eth0
28. Reduce output noise  
    sudo tcpdump -q -i eth0
29. Output to file and screen  
    sudo tcpdump -i eth0 | tee output.txt
30. Rotate files by time  
    sudo tcpdump -G 3600 -w capture_%Y%m%d%H%M%S.pcap

### Advanced Filtering
31. Filter TCP SYN+ACK packets  
    sudo tcpdump 'tcp[tcpflags] & (tcp-syn|tcp-ack) != 0'
32. Filter HTTP GET in payload  
    sudo tcpdump 'tcp[20:4] == 0x47455420'
33. Filter ICMP echo (ping)  
    sudo tcpdump 'icmp[icmptype] == icmp-echo'
34. Filter by source MAC  
    sudo tcpdump 'ether src 00:11:22:33:44:55'
35. Filter packets larger than N bytes  
    sudo tcpdump 'greater 100'
36. Filter broadcast traffic  
    sudo tcpdump 'ether broadcast or ip broadcast'
37. Group filters with parentheses  
    sudo tcpdump '(tcp port 80) or (udp port 53)'
38. Filter IPv6 traffic  
    sudo tcpdump ip6
39. Capture only TCP SYN packets  
    sudo tcpdump 'tcp[tcpflags] & tcp-syn != 0'
40. Filter by direction (if supported)  
    sudo tcpdump inbound   *or*   outbound

### Analysis and Viewing
41. Search output live with grep  
    sudo tcpdump -i eth0 | grep "HTTP"
42. Show link-layer (MAC) headers  
    sudo tcpdump -e -i eth0
43. Verbose protocol decoding  
    sudo tcpdump -O -i eth0
44. Count packets without printing  
    sudo tcpdump -c 100 -i eth0
45. Print only ASCII payload  
    sudo tcpdump -A -i eth0
46. Show absolute TCP sequence numbers  
    sudo tcpdump -S -i eth0
47. Export to Wireshark for GUI analysis  
    sudo tcpdump -w capture.pcap;   *(open in Wireshark)*
48. Run capture for fixed duration  
    timeout 60 sudo tcpdump -i eth0 -w capture.pcap
49. Line-buffered real-time output  
    sudo tcpdump -l -i eth0
50. Load filter expressions from file  
    sudo tcpdump -F filter.txt -i eth0
