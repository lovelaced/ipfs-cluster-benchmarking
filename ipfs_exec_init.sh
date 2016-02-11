#!/bin/bash

IPFS_CONFIG=~/.ipfs/config

sed -i '/104.236.176.52/d' $IPFS_CONFIG
sed -i '/104.236.179.241/d' $IPFS_CONFIG
sed -i '/162.243.248.213/d' $IPFS_CONFIG
sed -i '/128.199.219.111/d' $IPFS_CONFIG
sed -i '/104.236.76.40/d' $IPFS_CONFIG
sed -i '/178.62.158.247/d' $IPFS_CONFIG
sed -i '/178.62.61.185/d' $IPFS_CONFIG
sed -i '/104.236.151.122/d' $IPFS_CONFIG

cat ~/.ipfs/config

# conceivable that we start at the same time as another job, try to sleep a bit
# to check for other ipfs daemons (blah)

sleep $((RANDOM%10+10))

# IPFS daemon runs on 4001 by default. If someone is already running there
# lets just bail out. Could have false positives but that's OK.
lsof -i :4001
if [ $? -eq '0' ]; then
  echo "Found another daemon running, exiting"
  exit 1
fi

# otherwise run the daemon indefinitely.
./ipfs daemon &

# take another small nap
sleep $((RANDOM%10+10))

date
./ipfs get QmYKfrjduXm6LiZmiYGZUism3PtkF2iJ4ghxvnqKZsCpVE

killall ipfs

exit 0
