##########
# load zgen
source "${HOME}/.zgen/zgen.zsh"


if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# alias code=code-insiders

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
    zgen oh-my-zsh plugins/taskwarrior
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/composer
    zgen oh-my-zsh plugins/jump
    zgen oh-my-zsh plugins/vi-mode
    # Makes sure NVM is installed
    zgen load lukechilds/zsh-nvm
    # Install Yarn if not already installed
    type yarn  >/dev/null 2>&1 || { echo >&2 "Installing yarn"; brew install yarn;  }

    # other plugins
    zgen load zdharma/fast-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load MichaelAquilina/zsh-you-should-use
    zgen load arzzen/calc.plugin.zsh

    #  Opens your current repo on github, in your current branch.
    zgen load peterhurford/git-it-on.zsh

    # completions
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-autosuggestions
    zgen load jessarcher/zsh-artisan
    zgen load changyuheng/zsh-interactive-cd
    # Adds a tool to generate ZSH completion functions for programs missing them by parsing their --help output. Note that this doesn't happen dynamically, you'll have to explicitly run it to create a completion for each command missing one.
    zgen load RobSis/zsh-completion-generator 
    # theme
    zgen load denysdovhan/spaceship-prompt

    #Autoupdate
    zgen load unixorn/autoupdate-zgen
    
    # save all to init script
    zgen save
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Hardcore mode for aliases
# export YSU_HARDCORE=1

system_type=$(uname -s)
# If System Is Linux
if [ "$system_type" = "Linux" ]; then
    # Adds Linuxbrew paths
    export PATH="${HOME}/.linuxbrew/bin:${PATH}"
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
    export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
    export MANPATH="${HOME}/.linuxbrew/share/man:${MANPATH}"
    export INFOPATH="${HOME}/.linuxbrew/share/info:${INFOPATH}"
fi

# If System Is Mac
if [ "$system_type" = "Darwin" ]; then
    # Adds Homebrew path
    export PATH="/Users/lillo/.emacs.d/bin:$PATH"
    if [ -e /Users/lillo/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/lillo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
fi

# Enable GPG
export GPG_TTY=$(tty)

echo "########################################################"
echo "#                      kodeFant                        #"
echo "########################################################"
echo "Jump Marks:"
marks
echo "########################################################"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lillo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lillo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lillo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lillo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export MOB_NEXT_STAY=true

