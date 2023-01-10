########### DOCS ###########
  # zi snippet <URL>        # Raw syntax with URL
  # zi snippet OMZ::<PATH>  # Shorthand OMZ::         (http://github.com/ohmyzsh/ohmyzsh/raw/master/)
  # zi snippet OMZL::<PATH> # Shorthand OMZ::lib      (http://github.com/ohmyzsh/ohmyzsh/raw/master/lib)
  # zi snippet OMZT::<PATH> # Shorthand OMZ::themes   (http://github.com/ohmyzsh/ohmyzsh/raw/master/themes)
  # zi snippet OMZP::<PATH> # Shorthand OMZ::plugins  (http://github.com/ohmyzsh/ohmyzsh/raw/master/plugins)
source "$HOME/.zi/bin/zi.zsh"
zi snippet OMZT::agnoster
zi snippet OMZP::git
zi snippet OMZP::vi-mode
zi snippet OMZP::pip
zi snippet OMZP::golang
zi snippet OMZP::command-not-found
zi snippet OMZP::colored-man-pages
zi light zsh-users/zsh-syntax-highlighting
zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-completions

export AGNOSTER_DISABLE_CONTEXT=1
prompt_context() {
  if [[ ! -z "$DEFAULT_USER" && "$USER" -ne "$DEFAULT_USER" ]] || [[ -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# fix for prompt_git:14: command not found: parse_git_dirty
parse_git_dirty(){}

# fix $(prompt_agnoster_main)
setopt promptsubst