sudo apt update -y
sudo apt upgrade -y
sudo apt install -y \
    zsh \
    vim \
    curl \
    zsh \
    git \
    ruby \
    bat

sudo /bin/sh starship/install.sh -y
chsh -s /usr/bin/zsh
