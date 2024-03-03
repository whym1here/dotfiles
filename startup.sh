# Basic Requirements
sudo apt update && sudo apt upgrade
sudo apt-get install build-essential
sudo apt install gdb
sudo apt install htop neofetch

# Setting up Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash # may change as per nvm site
source ~/.bashrc
nvm install v20.9.0 # change as per the LTS on node site

# Setting up Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Setting up Python 
sudo apt install -y python3-pip
sudo apt install -y python3-venv # python3 -m venv my_env
sudo apt install libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc

# Setting up Github 
git config --global user.name "xxx"
git config --global user.email "xxx@gmail.com"
ssh-keygen -t ed25519 -C "xxx@gmail.com"
cat ~/.ssh/id_ed25519.pub

# Setting up Oh-My-Zsh + Starship
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh Plugins (ref: https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df)
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
# Follow the steps in link

# install neovim (ref: https://linux.how2shout.com/3-ways-to-install-neovim-on-ubuntu-22-04-or-20-04/)
# download a stable neovim version
