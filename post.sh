#!/bin/bash
read -p "Enter Username: " username
#regen ssh keys for root - you can disable root access later
cd /etc/ssh/
mkdir default_kali_keys
mv ssh_host_* default_kali_keys/
dpkg-reconfigure openssh-server
md5sum ssh_host_*
cd default_kali_keys/
md5sum *

#configure apt for HTTPS
cp /etc/apt/sources.list sources.bak
apt install apt-transport-https
sed -i ‘s/http:\/\//https:\/\//g’ /etc/apt/sources.list
cat /etc/apt/sources.list


#if you are updating an old version rememeber to update the repo key
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add
apt update && apt full-upgrade -y

#disable suspend on AC power
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
#set screen timer to 30 minutes
gsettings set org.gnome.desktop.session idle-delay 1800
#set the system to lock on screen blank
gsettings set org.gnome.desktop.screensaver lock-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled true

apt-get install libc6-dev-i386 -y

adduser $username
# you will be prompted for a password
#now make them a member of sudo
#thanks for the shout @7hunderSon :P
usermod -aG sudo $username
#configure ssh to now allow passwords or root logins – manual task
#set ssh to start automatically
systemctl enable ssh.service

apt-get -y install openvpn
apt-get -y install network-manager-l2tp network-manager-fortisslvpn-gnome network-manager-fortisslvpn network-manager-l2tp-gnome network-manager-ssh network-manager-ssh-gnome network-manager-pptp network-manager-pptp-gnome

apt-get -y install terminator tmux

gem install -r winrm

apt-get -y install ufw
#check status
systemctl status ufw
#start the firewall
#allow SSH
ufw allow ssh
systemctl start ufw
systemctl enable ufw

gzip -d /usr/share/wordlists/rockyou.txt.gz


#download and install powershell (MICROSOFT VERSION)
# Download & Install prerequisites
wget http://ftp.us.debian.org/debian/pool/main/i/icu/libicu57_57.1-6+deb9u2_amd64.deb
dpkg -i libicu57_57.1-6+deb9u2_amd64.deb
apt-get update && apt-get install -y curl gnupg apt-transport-https

# Add Microsoft public repository key to APT
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

# Add Microsoft package repository to the source list
echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" | tee /etc/apt/sources.list.d/powershell.list
# Set Layout 
setxkbmap -layout gb
# Set Timezone
sudo dpkg-reconfigure tzdata






# Install PowerShell package
apt-get update && apt-get install -y powershell
