# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim
set -g fish_greeting

# Hide macOS's "Last login" banner in interactive login shells.
if status is-interactive; and status is-login
    clear
end

# Mise (runtime manager)
mise activate fish | source

# Zoxide (smart cd)
zoxide init fish --cmd cd | source

# Direnv
direnv hook fish | source

# Starship prompt
starship init fish | source
