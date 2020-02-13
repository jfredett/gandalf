ip -o addr show dev vpn0 | grep -v inet6 | sed -n 's/^.*inet \(.*\)brd.*/\1/p'
