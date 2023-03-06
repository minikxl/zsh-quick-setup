# !/bin/bash

# instalation
sudo apt-get install zsh git -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# setup zsh as global shell
chsh -s $(which zsh)

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="gnzh"/' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# enable home and end key
echo "bindkey '^[[H' beginning-of-line\nbindkey '^[[F' end-of-lin" >> ~/.zshrc

# autosuggestions and highlighting
echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555,bold"" >> ~/.zshrc
echo "ZSH_AUTOSUGGEST_STRATEGY=(history completion)" >> ~/.zshrc

# setup language
echo "export LC_ALL=en_US.UTF-8" >> ~/.zshrc
echo "export LANG=en_US.UTF-8" >> ~/.zshrc
