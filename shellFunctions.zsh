# Colorised man pages
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# open a repl and loan in the deps you want as args e.g.
# rebl 'clj-time {:mvn/version "_"}'
rebl() {
  clojure -Sdeps "{:deps {com.bhauman/rebel-readline {:mvn/version \"0.1.4\"} $@}}" -m rebel-readline.main
}

# Use fo to search and preview files with fzf and bat then use ctrl-o to run 'open' or Enter/ctrl-e to open in editor
fo() {
  local out file key
  IFS=$'\n' out=($(ag -l | fzf-tmux --preview "bat --color 'always' {}" --preview-window=right:60% --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

fuz() (
  main() {
    previous_file="$1"
    file_to_edit=`select_file $previous_file`
    if [ -n "$file_to_edit" ]; then
      "$EDITOR" "$file_to_edit"
      main "file_to_edit"
    fi
  }

  select_file() {
    given_file="$1"
    fzf --preview="bat --color 'always' {}" --preview-window=right:60% --query="$given_file"
  }

main ""
)

# Like normal z but displays fzf search when used without arguments
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}
# Easily add previous command to pet snippets
prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

# User CTRL-S to easily back search through pet commands
pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select

