#!/bin/sh

set -eu

tmux_bin="${TMUX_BIN:-tmux}"

# Catppuccin stores palette and derived theme options with `-o`, so they must be
# cleared before a reload if the flavor or window styling changes.
"$tmux_bin" show-options -g |
  awk '/^(@thm_|@catppuccin_|@_ctp_)/ { print $1 }' |
  while IFS= read -r option; do
    [ -n "$option" ] || continue
    "$tmux_bin" set-option -gu "$option"
  done
