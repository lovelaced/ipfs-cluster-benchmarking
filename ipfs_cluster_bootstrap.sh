./ipfs init > init_data.txt
IPFS_CONFIG=~/.ipfs/config
peerid=$(grep identity init_data.txt | cut -d ":" -f 1)
rm init_data.txt
ip=$(ip addr | grep "[0-9]+\.[0-9]\.[0-9]\.[0-9]" | cut -d " " -f 2)
echo "Your IP is: $ip"
echo "Your peer ID is: $id"
sed -i "s/BOOTSTRAP_PEERID/$peerid" $IPFS_CONFIG
sed -i "s/BOOTSTRAP_IP/$ip" $IPFS_CONFIG
