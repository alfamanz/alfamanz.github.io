ip=(curl ifconfig.me)
sudo apt update -y 
sudo apt upgrade -y
sudo apt install squid -y
sudo rm /etc/squid/squid.conf
wget 
sed -i "s/ipnyo/$ip/g" squid.conf
sudo mv squid.conf /etc/squid/squid.conf
sudo ufw allow 8080
sudo service squid reload
echo "Done install proxy http"
echo ""
echo "$ip:8080