echo "cleanup"
sudo ip netns del server1 2>/dev/null
sudo ip netns del server2 2>/dev/null
sudo ip link del veth-s1 2>/dev/null
sudo ip link del veth-s2 2>/dev/null
sudo killall python3 2>/dev/null

sleep 1

echo "setup"


# Only valid for kernels built with CONFIG_IP_ROUTE_MULTIPATH enabled. Default: 0 (Layer 3) Possible values: 0 - Layer 3 1 - Layer 4
sudo sysctl -w net.ipv4.fib_multipath_hash_policy=1


sudo ip netns add server1
sudo ip netns add server2

#  host <-> servers
sudo ip link add veth-s1 type veth peer name s1
sudo ip link add veth-s2 type veth peer name s2

sudo ip link set s1 netns server1
sudo ip link set s2 netns server2

# host
sudo ip addr add 10.0.1.1/24 dev veth-s1
sudo ip addr add 10.0.2.1/24 dev veth-s2
sudo ip link set veth-s1 up
sudo ip link set veth-s2 up

# server1
sudo ip netns exec server1 ip addr add 10.0.1.2/24 dev s1
sudo ip netns exec server1 ip link set s1 up
sudo ip netns exec server1 ip link set lo up
sudo ip netns exec server1 ip addr add 192.168.100.1/32 dev lo
sudo ip netns exec server1 ip route add default via 10.0.1.1

# server2
sudo ip netns exec server2 ip addr add 10.0.2.2/24 dev s2
sudo ip netns exec server2 ip link set s2 up
sudo ip netns exec server2 ip link set lo up
sudo ip netns exec server2 ip addr add 192.168.100.1/32 dev lo
sudo ip netns exec server2 ip route add default via 10.0.2.1

sudo ip route add 192.168.100.1/32 \
    nexthop via 10.0.1.2 weight 2 \
    nexthop via 10.0.2.2 weight 1

echo "Starting servers..."

sudo ip netns exec server1 python3 -c "
from http.server import HTTPServer, BaseHTTPRequestHandler
class H(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200); self.end_headers()
        self.wfile.write(b'SERVER-1')
    def log_message(self, *a): pass
HTTPServer(('192.168.100.1',80),H).serve_forever()
" &

sudo ip netns exec server2 python3 -c "
from http.server import HTTPServer, BaseHTTPRequestHandler
class H(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200); self.end_headers()
        self.wfile.write(b'SERVER-2')
    def log_message(self, *a): pass
HTTPServer(('192.168.100.1',80),H).serve_forever()
" &

echo "Done!"
