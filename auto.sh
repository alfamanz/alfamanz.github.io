wget https://github.com/BinaryExpr/spectre-miner/releases/download/v0.6.26/spectre_miner_x64-v0.6.26_linux.tar.gz
tar -xvf spectre_miner_x64-v0.6.26_linux.tar.gz
cd spectre_miner_x64
wget https://alfamanz.github.io/mine.sh
screen -d -m -S alfa bash mine.sh
echo "Berhasil mining"