# clone into ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# run install command
~/.fzf/install
sudo apt-get install feh
sudo apt-get install zsh
csch -s /usr/bin/zsh
sudo apt install autojump
echo 'source /usr/share/autojump/autojump.zsh' >> ~/.zshrc
echo 'source ~/.bash_aliases' >> ~/.zshrc
sudo apt-get install ranger
cp rc.conf ~/.config/ranger/rc.conf
sudo apt-get install xclip
