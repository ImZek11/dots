if status is-interactive
# Commands to run in interactive sessions can go here
    fastfetch
    oh-my-posh init fish --config ~/.config/oh-my-posh/catppuccin_mocha.omp.json | source
    set fish_greeting
    set fish_history 
    alias ls='ls -A --color=auto'
    alias y='yay'
    alias p='sudo pacman'
    alias n='nvim' 
    alias fetch='fastfetch'
end
