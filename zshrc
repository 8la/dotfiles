# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# Set this to use case-sensitive completion
CASE_SENSITIVE="true"


# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
	git
        git-flow
        knife
        sudo
        thor
        knife_ssh
        tmux
        docker
        vagrant
        helm
	zsh-autosuggestions
        zsh-history-substring-search
        #kube-ps1
)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Dont share history between sessions
unsetopt share_history
# Dont save history realtime
unsetopt inc_append_history

export EDITOR=vim
alias xterm="xterm -bg black -fg white"

### Spaceship prompt
SPACESHIP_PROMPT_ORDER=(
  time           # Time stamps section
  user           # Username section
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status)
# hg             # Mercurial section (hg_branch  + hg_status)
  package        # Package version
  node           # Node.js section
#  bun            # Bun section
#  deno           # Deno section
  ruby           # Ruby section
  python         # Python section
#  elm            # Elm section
#  elixir         # Elixir section
#  xcode          # Xcode section
#  xcenv          # xcenv section
#  swift          # Swift section
#  swiftenv       # swiftenv section
#  golang         # Go section
#  perl           # Perl section
#  php            # PHP section
#  rust           # Rust section
#  haskell        # Haskell Stack section
#  scala          # Scala section
#  kotlin         # Kotlin section
  java           # Java section
#  lua            # Lua section
#  dart           # Dart section
#  julia          # Julia section
#  crystal        # Crystal section
  docker         # Docker section
  docker_compose # Docker section
#  aws            # Amazon Web Services section
#  gcloud         # Google Cloud Platform section
#  azure          # Azure section
  venv           # virtualenv section
#  conda          # conda virtualenv section
  uv             # uv section
#  dotnet         # .NET section
#  ocaml          # OCaml section
#  vlang          # V section
#  zig            # Zig section
  purescript     # PureScript section
#  erlang         # Erlang section
#  gleam          # Gleam section
  kubectl        # Kubectl context section
#  ansible        # Ansible section
#  terraform      # Terraform workspace section
#  pulumi         # Pulumi stack section
#  ibmcloud       # IBM Cloud section
#  nix_shell      # Nix shell
#  gnu_screen     # GNU Screen section
  exec_time      # Execution time
  async          # Async jobs indicator
  line_sep       # Line break
  battery        # Battery level and status
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

### SSH Keychain
keychain  ~/.ssh/id_ed25519
source ~/.keychain/$HOST-sh

# Function to extend PATH if directory not already included
_extend_path() {
  [[ -d "$1" ]] || return

  if ! echo "$PATH" | tr ":" "\n" | grep -qx "$1" ; then
    export PATH="$1:$PATH"
  fi
}

### Added by the Heroku Toolbelt
_extend_path "/usr/local/heroku/bin"
_extend_path "$HOME/git/chef-repo/bin" # Scripts stic para chef

### User bins
_extend_path "$HOME/bin"
_extend_path "$HOME/.local/bin" # Local bins

### Go Lang
export GOPATH="$HOME/gocode"
_extend_path "$GOPATH/bin" # Go scripts

alias k="kitchen"
alias k8s="kubectl"

### Pyenv (Python version manager)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && _extend_path "$PYENV_ROOT/bin"
eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"

### Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Kubernetes (Kubectl/helm) autocompletado
source <(kubectl completion zsh)
source <(helm completion zsh)

# kube-ps1 (prompt con config)
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kube-ps1
# PROMPT='$(kube_ps1) '$PROMPT


