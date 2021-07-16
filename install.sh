# Installing xcode in order for brew to work
xcode-select --install

# Install package manager
echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# installing all kinds of stuff
echo "Installing packages..."
brew install stow rust wget python cmake
# Console experience pack
brew install zsh zsh-syntax-highlighting autojump fzf ripgrep git-flow-avh neovim
# install npm
brew install node
# literate programming
brew tap zyedidia/literate
brew install --HEAD literate
# GitHub from the terminal
brew install gh
# XGBoost in Jupyter Notebook
brew install libomp

# install julia
brew install --cask julia
# install docker
brew install --cask docker
# browser for developing web applications
brew install --cask google-chrome
# a better console
brew install --cask iterm2
# password manager app
brew install --cask keepassxc
# my preferred IDE
brew install --cask visual-studio-code
# install the LaTeX core
brew install --cask mactex-no-gui
# install reference management software
brew install --cask jabref
# install Skype
brew install --cask skype

# for system engineering
# scilab requires Java 8
# Java 11 is for papyrus which gets installed inside the eclipse IDE
brew install openjdk@11
brew install --cask homebrew/cask-versions/adoptopenjdk8
brew install --cask eclipse-java
brew install --cask scilab

# install some fonts
brew tap homebrew/cask-fonts
brew install --cask font-quicksand

# download the required vs code extensions
cat dev_workplace/extensions.txt | while read i; do code --install-extension $i; done

# installing brew install helpers for zsh config
echo "Installing Tronjes zsh helpers..."
git clone https://github.com/tronje/git-prompt-helper.git
cargo install --path=git-prompt-helper
rm -rf git-prompt-helper
git clone https://github.com/tronje/dir-prompt-helper.git
cargo install --path=dir-prompt-helper
rm -rf dir-prompt-helper

# install zsh grml theme
echo "Installing zsh grml theme..."
wget -O ~/.zshrc.grml https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc

# set the default shell to zsh
echo "Make zsh default shell..."
chsh -s $(which zsh)
stow zsh

# jupyter notebook
/usr/local/bin/pip3 install notebook
pip3 install ipywidgets
jupyter nbextension enable --py widgetsnbextension

# ARM cortex-m microcontroller using mbed os 
# pyOCD is an open source Python package for programming and debugging Arm Cortex-M microcontrollers
# mbed-cli = Mbed CLI 1
# mbed-tools = Mbed CLI 2 (requires 'ninja')
# only 'mbed-tools' is required. Has the toolchains 'ARM' and 'GCC_ARM' available
#? pip3 install mbed-ls
brew install --cask mbed-studio
pip3 install pyocd
pip3 install mbed-tools mbed-cli
brew install ninja

# Make nvim work
# Installing Vim Plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install python support for nvim
/usr/local/bin/pip3 install neovim 
/usr/local/bin/pip3 install --upgrade neovim
# Install config
stow nvim
# Install plugins
nvim +PlugInstall +qall