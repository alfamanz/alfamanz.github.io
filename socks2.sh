#!/bin/bash
#===========WARNA TEKS============#
err="\033[31m[ERROR]\033[0m"
putih='\e[0m'
hitam="\033[30m"
merah="\033[31m"
hijau="\033[32m"
kuning="\033[33m"
biru="\033[34m"
ungu="\033[35m"
cyan="\033[36m"
putih="\033[37m"
sks="[ ${hijau}OK ${putih}]"
ip=$(curl ifconfig.me)
#=====================================
clear
echo -e "$hijau ____             _        ____    ___           _        _ _           ";
echo -e "/ ___|  ___   ___| | _____| ___|  |_ _|_ __  ___| |_ __ _| | | ___ _ __ ";
echo -e "\___ \ / _ \ / __| |/ / __|___ \   | || '_ \/ __| __/ _\` | | |/ _ \ '__|";
echo -e " ___) | (_) | (__|   <\__ \___) |  | || | | \__ \ || (_| | | |  __/ |   ";
echo -e "|____/ \___/ \___|_|\_\___/____/  |___|_| |_|___/\__\__,_|_|_|\___|_|   ";
echo -e "\e[0m"
echo ""
echo ""
echo -e "${kuning}Sc By Alfa${putih}"
echo -e "${kuning}Wa : 087715768324${putih}"
echo -e "${kuning}Tele : @faxsenpai${putih}"
echo ""
echo ""
# read -p "$(echo -e "${cyan}Buat User Baru Untuk Socks5 : $putih")" usernya
sudo apt update
sudo apt install -y dante-server net-tools ufw
sudo rm /etc/danted.conf
echo "logoutput: syslog
user.privileged: root
user.unprivileged: nobody

# The listening network interface or address.
internal: 0.0.0.0 port=1080

# The proxying network interface or address.
external: ens3

# socks-rules determine what is proxied through the external interface.
socksmethod: none

# client-rules determine who can connect to the internal interface.
clientmethod: none

client pass {
    from: $ip/0 to: 0.0.0.0/0
}

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
}" > danted.conf
wget https://alfamanz.github.io/ch.sh
sudo mv danted.conf /etc/danted.conf
# read -p "$(echo -e "${cyan}Buat User Baru Untuk Socks5 : $putih")" usernya
# sudo useradd -r -s /bin/false $usernya
# echo -e "${ungu}Buat password untuk socks5$putih"
# sudo passwd $usernya
sudo iptables -A INPUT -p tcp --dport 1080 -j ACCEPT
sudo ufw allow 1080/tcp
sudo systemctl restart danted
echo -e "$sks Install Socks5 Telah Berhasil"
sleep 2
clear
echo -e "Socks5 Telah Siap digunakan : ${hijau}$ip:1080$putih"
# sudo curl -v -x socks5://kim:kim@$ip:1080 http://google.com/
curl -v -x socks5://$ip:1080 http://www.google.com/