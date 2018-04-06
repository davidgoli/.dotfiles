export AWS_IAM_HOME=~/Development/IAMCli-1.2.0/
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home
export JAVA7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export JAVA_HOME=$JAVA8_HOME
#export ANDROID_HOME=/usr/local/Cellar/android-sdk/24.4.1_1/
export ANDROID_HOME=/Users/David/Library/Android/sdk
export ANDROID_SDK_ROOT=/Users/David/Library/Android/sdk/
export AWS_CREDENTIAL_FILE=~/Development/David_cred.txt
export SVN_EDITOR=/usr/bin/vim
export EDITOR=mvim

if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='-G'
    eval `gdircolors ~/.dir_colors`
fi

#bash
alias ls='ls $LS_OPTIONS -F'
alias ll='ls $LS_OPTIONS -lhF'
alias l='ls $LS_OPTIONS -lAhF'
alias cd..="cd .."
alias c="clear"
alias e="exit"
alias ssh="ssh -X"
alias ..="cd .."
alias lsusb='system_profiler SPUSBDataType'

#git
function current_git_branch {
  git branch | grep ^* | sed s/*\ //
}

alias gc="git checkout"
alias gs="git status"
alias gu="git remote update origin --prune"
alias gr="git rebase"
alias grox="git rebase origin/\`current_git_branch\`"
alias gpox="git push origin \`current_git_branch\`"
alias projroot="cd `pwd | sed -E s/api.*\|client.*\|common.*//`"
alias vtest="cd `pwd | sed s/app/test/`"
alias vapp="cd `pwd | sed s/test/app/`"

gmv() {
  git mv $1 __tmp
  git mv __tmp $2
}

#rails
alias be="bundle exec"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -f `brew --prefix`/etc/git-completion.bash ]; then
  . `brew --prefix`/etc/git-completion.bash
fi

export PS1='\h:\W$(__git_ps1 "(%s)") \$ '

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

if [[ -f "$HOME/.amazon_keys" ]]; then
  source "$HOME/.amazon_keys";
fi

alias vim=mvim

# export NVM_DIR="/Users/David/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 \
     -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None \
     -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off \
     -define png:compression-filter=5 -define png:compression-level=9 \
     -define png:compression-strategy=1 -define png:exclude-chunk=all \
     -interlace none -colorspace sRGB $1
}

optimize_image() {
  convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% $1 $2
}

ulimit -n 2560
eval "$(direnv hook bash)"

replace() {
  find . -type f -name "$1" -exec sed -i '' $2 {} +
}

export PATH="$HOME/.yarn/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

. /Users/David/.asdf/asdf.sh

. /Users/David/.asdf/completions/asdf.bash

export PATH=$HOME/.subscript/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$PATH:$JAVA_HOME/bin"

# nvm use default > /dev/null
