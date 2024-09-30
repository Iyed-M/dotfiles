#!/bin/bash
pkill mako
swaync &

# echo_color "Setting up wallpaper..." "cyan"
# swww init
# swww img --transition-type grow ~/.config/hypr/background.png
# echo_color "Wallpaper set!" "green"

ln -s "$XDG_RUNTIME_DIR/hypr" /tmp/hypr
waybar &

tmux new -s init &

hyprctl dispatch exec [workspace 3 silent] "wezterm start   ~/scripts/tmuxDev.sh --cwd ~/projects/ican/backend/"
hyprctl dispatch exec [workspace special silent] "alacritty -e ~/scripts/tmuxMain.sh"

hyprctl dispatch exec [workspace 2 silent] "$HOME/scripts/launch.fish" browser
# hyprctl dispatch exec [workspace 5 silent] webcord
# hyprctl dispatch exec [workspace 5 silent] betterbird
birdtray &
hyprctl dispatch exec [workspace 5 silent] "$HOME/scripts/launch.fish" spotify
# hyprctl dispatch exec [workspace special:third silent] bitwarden-desktop
