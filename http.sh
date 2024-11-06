ip=(curl ifconfig.me)
sudo apt update -y 
sudo apt upgrade -y
sudo apt install squid -y
sudo rm /etc/squid/squid.conf
wget https://raw.githubusercontent.com/alfamanz/alfamanz.github.io/refs/heads/main/squid.conf
sed -i "s/ipnyo/$ip/g" squid.conf
sudo mv squid.conf /etc/squid/squid.conf
sudo ufw allow 8080
sudo service squid reload
echo "Done install proxy http"
echo ""
echo "$ip:8080
curl -v -x http://$ip:8080 http://www.google.com/
