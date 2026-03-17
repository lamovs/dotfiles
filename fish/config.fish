# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Mise (runtime manager)
mise activate fish | source

# Zoxide (smart cd)
zoxide init fish --cmd cd | source

# Direnv
direnv hook fish | source

# Starship prompt
starship init fish | source
