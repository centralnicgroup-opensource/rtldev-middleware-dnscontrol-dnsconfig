###### Executes only on a local machine ###### 
if [[ "$GITHUB_CLI" != true ]]; then
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#zsh-configurations
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

## php xdebug configuration
export XDEBUG_CONFIG="client_host=host.docker.internal client_port=9003"
# enable terminal commands history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fi