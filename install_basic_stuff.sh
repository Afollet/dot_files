cd ~
sudo apt-get install fuse libfuse2 python3-pip ack-grep -y
sudo apt install neovim
sudo apt install tmux
sudo apt install thunderbird
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
touch ~/.vimrc
rm -rf dot_files
git clone git@github.com:Afollet/dot_files.git
mkdir -p ~/.config/nvim
cp dot_files/init.vim ~/.vimrc
ln -s ~/.vimrc ~/.config/nvim/init.vim
pip3 install --user neovim
git config --global core.editor "vim"
cp .bash_aliases ~/.bash_aliases
