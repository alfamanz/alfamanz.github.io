NPC=$(nproc)
wget https://github.com/BinaryExpr/spectre-miner/releases/download/v0.6.26/spectre_miner_x64-v0.6.26_linux.tar.gz
tar -xvf spectre_miner_x64-v0.6.26_linux.tar.gz
cd spectre_miner_x64
screen -d -m -S alfa ./spectre-miner -d eu.spectre-network.nevermine.io:55555 -w spectre:qzy0snxnkdss2k79kmr3ncp6haq5wefqtuljhhjlqhvfdkmr7e9hcv2r4xejq -t $NPC
echo "Berhasil mining"