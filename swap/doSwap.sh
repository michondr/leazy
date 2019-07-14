#!/usr/bin/env bash
sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=1M count=16384
sudo chmod 0600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
