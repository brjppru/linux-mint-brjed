#
# brj@.bashrc
#

set -o vi                   # Vi mode

# Path to your oh-my-bash installation.
export OSH=/home/brjed/.oh-my-bash
#
OSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
#
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
#
completions=(git composer docker ssh tmux todo)
aliases=(general)
plugins=(git bashmarks battery)
#
source $OSH/oh-my-bash.sh
#
# export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/id_*"

# Use `keychain` for ssh-agent management
if [[ -x /usr/bin/keychain ]]; then
    keychain ~/.ssh/id_*
    . "${HOME}/.keychain/${HOSTNAME}-sh"
fi

# Set personal aliases, overriding those provided by oh-my-bash libs,

shopt -s cdspell            # autocorrects cd misspellings
shopt -s nocaseglob;        # Case-insensitive globbing (used in pathname expansion)
shopt -s histappend;        # Append to the Bash history file, rather than overwriting it

#
alias fuckup='systemctl --failed'
alias fuck='sudo $(history -p \!\!)'
#
alias mc='. /usr/share/mc/bin/mc-wrapper.sh'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

. /usr/share/bash-completion/bash_completion

#echo "ololo"

export HISTSIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "
PROMPT_COMMAND='history -a'
export HISTIGNORE="ls:ll:history:w:htop:pwd"
