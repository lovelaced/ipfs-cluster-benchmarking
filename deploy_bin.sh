echo "username: "
read username
echo "full hostname (URL): "
read hostname
echo "Once the SSH connection completes, please run ./ipfs_cluster_bootstrap.sh"
scp ipfs $username@$hostname:~
scp ipfs_cluster_bootstrap.sh $username@$hostname:~
ssh $username@$hostname
echo "thank you for shopping"
