# gnutils and the like
# alias ls='ls --group-directories-first --color=auto'
alias cp='cp -v'
alias clip='xclip -selection clipboard'

# systemd
alias sc='sudo systemctl'
alias scu='systemctl --user'
alias wifi='sudo systemctl restart netctl-auto@wlp4s0'
alias nspawn='sudo systemd-nspawn'
alias mctl='machinectl'
alias smctl='sudo machinectl'

# mbed
alias mi='mbed import'
alias mcompile='mbed compile -m CY8CPROTO_062_4343W -t GCC_ARM'
alias m2psoc='mbed compile -m CY8CPROTO_062_4343W -t GCC_ARM --flash'

# PSoC6
# CapSense configuration gets translated into C code 
alias capsense2ccode='/Applications/ModusToolbox/tools_2.3/capsense-configurator/capsense-configurator-cli -c mbed-os/targets/TARGET_Cypress/TARGET_PSOC6/TARGET_CY8CKIT_062_WIFI_BT/COMPONENT_BSP_DESIGN_MODUS/design.cycapsense -o `pwd` -g'


# pacman / yay
alias pac='pacman'
alias spac='sudo pacman'
alias updateall='yay -Syu && nvim +PlugUpdate +UpdateRemotePlugins +qall'

# neovim
alias vi='nvim'
# alias vim='nvim'
alias gvi='nvim $(git status --porcelain | cut -s -f 2 -d M)'
alias svi='sudo -E nvim'
alias svim='sudo -E nvim'

# git aliases
_git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
_git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
alias g='git'
alias gco='git checkout'
alias gls='git status'
alias gl='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'
alias glg='git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'
alias gap='git add --patch'
alias gif='git flow'

# cargo
alias clippy='rustup run nightly cargo clippy'
alias c='cargo'

# docker
alias dc='docker-compose'

# misc
alias newdir='eval $($HOME/prj/newdir/newdir.py)'
alias py='python'
alias weather='curl -s wttr.in/Berlin'
alias icat='kitty icat --align=left'
alias ipython='ipython --no-confirm-exit'
alias jl='exec "/Applications/Julia-1.5.app/Contents/Resources/julia/bin/julia"'
alias vsc='open -a "Visual Studio Code"'
alias jupy='jupyter notebook'