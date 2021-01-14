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
# Developer experience stuff
brew install nvm
# better console
brew cask install iterm2
# my preferred IDE
brew cask install visual-studio-code
# browser for developing web applications
brew cask install google-chrome
# password manager app
brew install --cask keepassxc

# download the required vs code extensions
cat dev_workplace/extensions.txt | while read i; do code --install-extension $i; done

# installingbrew install helpers for zsh config
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

# Make nvim work
# Installing Vim Plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Install python support for nvim
/usr/local/bin/pip install neovim
/usr/local/bin/pip install --upgrade neovim
# Install config
stow nvim
# Install plugins
nvim +PlugInstall +qall

# generate SSH keys
# TODO prompt for hostname
# TODO: dynamic comment with username and host name
# ssh-keygen -t rsa -b 4096 -C "email@janlucaklees.de"

