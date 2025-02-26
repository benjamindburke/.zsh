# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="rkj-repos"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

export ZSH_CUSTOM=/opt/bin/zsh_custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(
    brew
    fzf
    git
    golang
    history
    jira
    mix
    mix-fast
    thefuck
    web-search
    z
    zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh

# Load asdf sofware version manager/installer software
source $( brew --prefix asdf )/libexec/asdf.sh

# Configure GPG for signing and verifying GitHub/GitLab commits
export GPG_TTY=$( tty )

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

export VISUAL="$EDITOR"

# Configure direnv
eval "$( direnv hook zsh )"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(`which brew` shellenv)"

# Configure golang to always use Go modules
export GO111MODULE=on

# Increase ulimit for running pytest from CLI
ulimit -n 50000

export PATH="$PATH:/opt/bin/scripts:/opt/bin/priv:$HOME/bin"

export CLICOLOR=1
export TERM=xterm-256color

# Used to privatize ticketing system
export JIRA_URL=

# Used to customize where git repos are for each system
export REPOS_ROOT=

# Used to generate Nvim colorschemes based on words or phrases
export OPENAI_API_KEY=

# pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
pyenv_current=$( basename `pyenv prefix` )
if [[ $pyenv_current =~ ^3(\.[0-9]+)+$ ]] then
    if [[ -d $PYENV_ROOT/versions/$pyenv_current/bin ]] then
        export PATH="$PYENV_ROOT/versions/$pyenv_current/bin:$PATH"
    fi
fi

# https://github.com/pyenv/pyenv/issues/1446
eval "$(pyenv init -)"

##################################
# DO NOT ADD ANYTHING AFTER THIS LINE
##################################

source $ZSH_CUSTOM/functions.zsh
source $ZSH_CUSTOM/aliases.zsh
source $ZSH_CUSTOM/completions.zsh
