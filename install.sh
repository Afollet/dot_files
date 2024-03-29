# DANGER DER BE DRAGONS HERE
# lots of | bash from urls in this script

set -x 

cd ~
#sudo apt update
sudo apt-get install fuse libfuse2 python3-pip ack-grep htop curl git -y 
sudo apt install tig neovim thunderbird python3-neovim kitty autojump feh ranger xclip pigz gnome-tweaks parallel moreutils batcat xdotools -y
sudo snap install slack chromium zoom

python3 -m pip install pyvenv

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 16.0.0

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
cd ~/pprojects && git clone https://github.com/Afollet/dot_files.git && cd ..
cp ~/pprojects/dot_files/.vimrc ~/.vimrc
ln -s ~/.vimrc ~/.config/nvim/init.vim
pip3 install --user neovim
git config --global core.editor "vim"
vim -c PlugInstall -c qall

cp ~/pprojects/dot_files/bashrc ~/.bashrc
source ~/.bashrc

cp ~/pprojects/dot_files/.bash_aliases ~/.bash_aliases
source ~/.bash_aliases

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install
source ~/.bashrc

mkdir -p ~/.config/kitty
cp ~/pprojects/dot_files/kitty.conf ~/.config/kitty/

cp ~/pprojects/dot_files/rc.conf ~/.config/ranger/rc.conf

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin



