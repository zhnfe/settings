# ln -s ~/Documents/code/github/zhnfe/settings/arch/fish  ~/.config/fish
set fish_greeting ""
if status is-interactive
    # Commands to run in interactive sessions can go here
end

fastfetch | lolcat

alias s='npm run serve'
alias d='npm run dev'
alias p='npm run preview'
alias ll='ls -l'
alias la='ls -la'