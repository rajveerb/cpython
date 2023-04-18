# !/bin/bash
sudo echo "deb-src http://archive.ubuntu.com/ubuntu/ $(lsb_release -cs) main" >> /etc/apt/sources.list &&
sudo apt-get update && sudo apt upgrade &&
sudo apt-get build-dep -y python3 &&
sudo apt-get install -y pkg-config &&
sudo apt-get install -y build-essential gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev &&
mkdir debug &&
cd debug &&
sudo ../configure --with-pydebug &&
sudo make -j$(nproc) &&
sudo make test &&
cd .. &&
sudo chmod 777 -R debug