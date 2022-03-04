cd ~
sudo apt-get install fuse libfuse2 python3-pip ack-grep -y
sudo apt install neovim
sudo apt install tmux
sudo apt install thunderbird
sudo apt-get install python-neovim
sudo apt-get install python3-neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
cp dot_files/init.vim ~/.vimrc
ln -s ~/.vimrc ~/.config/nvim/init.vim
pip3 install --user neovim
git config --global core.editor "vim"
cp dot_files/.bash_aliases ~/.bash_aliases
