# load zgen
source "${HOME}/.zgen/zgen.zsh"

#Autoupdate
zgen load unixorn/autoupdate-zgen

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # oh-my-zxh plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/nvm
    zgen oh-my-zsh plugins/yarn
    zgen oh-my-zsh plugins/ubuntu
    zgen oh-my-zsh plugins/web-search
    zgen oh-my-zsh plugins/extract
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/composer

    # other plugins
    zgen load zdharma/fast-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load MichaelAquilina/zsh-you-should-use
    zgen load arzzen/calc.plugin.zsh
    #  Opens your current repo on github, in your current branch.
    zgen load peterhurford/git-it-on.zsh
    # Adds a tool to generate ZSH completion functions for programs missing them by parsing their --help output. Note that this doesn't happen dynamically, you'll have to explicitly run it to create a completion for each command missing one.

    # completions
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-autosuggestions
    zgen load jessarcher/zsh-artisan
    zgen load changyuheng/zsh-interactive-cd
    zgen load RobSis/zsh-completion-generator 

    # theme
    zgen load denysdovhan/spaceship-prompt
    

    # save all to init script
    zgen save
fi

export YSU_HARDCORE=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
cd ~/kode