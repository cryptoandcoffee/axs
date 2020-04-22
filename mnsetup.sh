#!/bin/bash


DAEMON_URL=https://github.com/axsgold/axs/releases/download/v2.0.0/axs-2.0.0-ubuntu-16.zip
DAEMON_FILE=axs-2.0.0-ubuntu-16.zip


function update_system() {
	apt-get -yqq update
}

function install_packages() {
apt-get -yqq install libdb5.3++ \
libboost-all-dev \
unzip \
mc \
pwgen \
libminiupnpc-dev

add-apt-repository -y ppa:bitcoin/bitcoin
apt-get -yqq update
apt-get -yqq install libdb4.8-dev libdb4.8++-dev

}

#***************************** main *********************************************************

cat << "AXS"

AXS

# Check for root


echo "Downloading updates and requires packages"
echo
update_system
install_packages

echo "Downloading precompiled binaries"
echo 

wget -q $DAEMON_URL
cd /root
unzip -qq $DAEMON_FILE
chmod ugo+x axsd
cp axsd /usr/local/bin

# Create config
rm -rf /root/.axs
mkdir .axs

