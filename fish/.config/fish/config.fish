
# Remove the greeting message
set -g fish_greeting ""

# Alias for eza
alias ll "eza -l --icons"
alias lla "ll -a"

# We searched fzf's documentation for 'fd' and 'bat' to find these lines.
# It sets up fzf to use fd to traverse the file system while respecting .gitignore, and sets ctrl+t to use that as well.
# We also create an alias which uses bat for previews.
# We also setup fzf key bindings for macOS (for Linux this is handled in setup.sh)
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias lls "fzf --preview 'bat --color=always {}' --preview-window '~3'"
if test (uname) = "Darwin"
    fzf --fish | source
end

# pyenv
pyenv init - | source

# starship
starship init fish | source
