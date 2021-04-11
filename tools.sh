#install chromium
sudo apt install chromium -y

#install winrm
gem install evil-winrm

sudo apt install python3-pip -y

#Install empire c2
sudo apt install powershell-empire starkiller -y


#install covenant
pip3 install --upgrade setuptools
pip3 install --upgrade sslyze

wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install -y dotnet-sdk-5.0
sudo apt-get install -y dotnet-sdk-3.1

#COvenant C2
cd ~/
mkdir pentest
cd pentest
mkdir c2
cd c2
git clone --recurse-submodules https://github.com/cobbr/Covenant

#install remina 
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt update -y
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y

#Install Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install sublime-text -y

#Install VSCODE
cd ~/
cd pentest
cd tools

wget https://az764295.vo.msecnd.net/stable/08a217c4d27a02a5bcde898fd7981bda5b49391b/code_1.55.1-1617808414_amd64.deb
sudo dpkg -i code_1.55.1-1617808414_amd64.deb
