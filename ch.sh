#
ip=(curl ifconfig.me)

echo "logoutput: syslog
user.privileged: root
user.unprivileged: nobody

# The listening network interface or address.
internal: 0.0.0.0 port=1080

# The proxying network interface or address.
external: ens3

# socks-rules determine what is proxied through the external interface.
socksmethod: username

# client-rules determine who can connect to the internal interface.
clientmethod: none

client pass {
    from: $ip/0 to: 0.0.0.0/0
}

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
}" > danted.conf
sudo mv danted.conf /etc/danted.conf
service danted reload
clear
echo "SUKSES CHANGE IP"
curl -v -x socks5://kim:kim@$ip:1080 http://www.google.com/
