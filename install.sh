# Define helper function
install_cask() {
  brew install --cask "$@"
}

install_brew() {
  brew install "$@"
}

# Install xcode command line tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to path
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Install packages
packages=(
  stow rust wget python cmake zsh zsh-syntax-highlighting autojump fzf 
  ripgrep git-flow-avh neovim node libomp
)
install_brew "${packages[@]}"

# Tap literate
brew tap zyedidia/literate
install_brew --HEAD literate

# Install cask apps
casks=(
  julia docker google-chrome iterm2 keepassxc visual-studio-code blender 
  fiji libreoffice mactex-no-gui zotero skype webex utm multipass
)
install_cask "${casks[@]}"

# Install fonts
brew tap homebrew/cask-fonts
install_cask font-quicksand

# Install vscode extensions
while read -r extension; do
  code --install-extension "$extension"
done < dev_workplace/extensions.txt

# Install zsh helpers
repos=(
  git-prompt-helper dir-prompt-helper
)
for repo in "${repos[@]}"; do
  git clone "https://github.com/tronje/$repo.git"
  cargo install --path="$repo"
  rm -rf "$repo"
done

# Install zsh grml theme
wget -O ~/.zshrc.grml https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc

# Set zsh as default shell
chsh -s "$(which zsh)"
stow zsh

# Install python packages
pip3 install notebook ipywidgets

# Enable Jupyter extensions
jupyter nbextension enable --py widgetsnbextension

# Install Mbed tools and dependencies
brew install --cask mbed-studio
pip3 install pyocd mbed-tools mbed-cli
install_brew ninja

# Install neovim support
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --upgrade neovim
stow nvim
nvim +PlugInstall +qall
