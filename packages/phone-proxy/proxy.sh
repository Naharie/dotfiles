if [ "${1:-}" = "setup" ]; then
	ip tuntap add mode tun dev tun0
    ip addr add 198.18.0.1/15 dev tun0
fi

echo Phase 1

sysctl net.ipv4.conf.wlp5s0.rp_filter=0
nmcli con mod "tun0" ipv4.dns "1.1.1.1 1.1.1.2 8.8.8.8 8.8.4.4"

echo Phase 2

nmcli con down "tun0" || true
nmcli con up "tun0"

echo Phase 3

ip link set dev tun0 up

echo Phase 4

ip route del default
ip route add default via 198.18.0.1 dev tun0 metric 1
ip route add default via 192.168.49.1 dev wlp5s0 metric 10

echo Phase 5

tun2socks -device tun0 -proxy socks5://192.168.49.1:8282 -interface wlp5s0