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
# echo ""
sudo apt update
sudo apt install -y dante-server net-tools ufw
sudo rm /etc/danted.conf
echo "logoutput: /var/log/socks.log
internal: ens3 port=1080
external: ens3
clientmethod: none
socksmethod: none
user.privileged: root
user.notprivileged: nobody

client pass {
        from: $ip/0 to: 0.0.0.0/0
        log: error connect disconnect
}
client block {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: connect error
}
socks pass {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: error connect disconnect
}
socks block {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: connect error
}" > danted.conf
sudo mv danted.conf /etc/danted.conf
# sudo useradd -r -s /bin/false $usernya
# echo -e "${ungu}Buat password untuk socks5$putih"
# sudo passwd $usernya
sudo iptables -A INPUT -p tcp --dport 1080 -j ACCEPT
sudo ufw allow 1080/tcp
sudo systemctl restart danted
sleep 2
clear

OUTPUT=$(curl -v -x socks5://$ip:1080 http://www.google.com/)

if echo "$OUTPUT" | grep -q "200 OK"; then
  echo "SOCKS5 $ip:1080 ONLINE"
else
  echo "SOCKS5 $ip:1080 OFFLINE"
fi
