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

# install jupyter notebook
/usr/local/bin/pip3 install notebook

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