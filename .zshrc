# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias dev="cd ~/projects/nodeone-dev/platforms; cd $1"
alias srv-www="cd /srv/www"
alias hosts="emacs /etc/hosts"
alias hosts-append="echo \"\n$1\t$2\" >> sudo /etc/hosts"
alias hosts-dev="echo \"\n33.33.33.10\t$2\" >> sudo /etc/hosts"
alias hosts-olddev="echo \"\n192.168.56.10\t$2\" >> sudo /etc/hosts"
alias makedistro="drush make --no-core --contrib-destination=. --working-copy"
alias hosts="emacs /etc/hosts"
alias gitdrupal="echo /test/${1}.git"
alias drupalcs="phpcs --standard=DrupalCodingStandard --extensions=php,module,inc,install,test,profile,theme,css"
alias emacsclient="emacsclient -n -a /usr/bin/emacs"
alias emacs="emacsclient"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [ -f ~/bin/z/z.sh ]; then
    source ~/bin/z/z.sh
fi

function drupal-write {
    if [ ! $1 ]; then
	echo "You must specify the project name"
    fi
    git remote add write "fabsor@git.drupal.org:project/$1.git"
}

function drupal-clone {
    if [ ! $1 ]; then
        echo "You must specify the project name"
    fi
    git clone --branch $2 "fabsor@git.drupal.org:project/$1.git"
}

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games