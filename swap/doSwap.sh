sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=1M count=16384
sudo mkswap /swapfile
sudo swapon /swapfile
