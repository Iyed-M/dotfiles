#!/bin/bash

use_mako=false

# config dirs
cf=$HOME/.config
hypr=$cf/hypr

themes_dir=$hypr/themes
modules=$hypr/modules

rofi=$modules/rofi
alacritty=$modules/alacritty
waybar=$modules/waybar

fish=$cf/fish
mako=$cf/mako

current_theme_path() {
	echo "$hypr/themes/$1"
}

set_wallaper() {
	wall="$hypr/wallpapers/$1.png"
	ln -sf "$wall" "$hypr/background.png"
	hyprctl hyprpaper wallpaper ", $wall"
}

set_alacritty() {
	ctp=$(current_theme_path "$1")
	file=$ctp/alacritty.toml
	target=$alacritty/current_theme.toml
	ln -sf "$file" "$target"
}
set_fish() {
	sed -i "s/set -x theme .*$/set -x theme $1/" "$fish/current_theme.fish"
}
set_mako() {
	ctp=$(current_theme_path "$1")
	file=$ctp/mako
	config=$mako/config
	default=$mako/default
	cp "$default" "$config"
	cat "$file" >>"$config"
}
set_swaync() {
	swaync_style=$cf/swaync/style.css
	sed -i "s/hypr\/theme.*/hypr\/themes\/$1\/waybar.css\";/" "$swaync_style"
}

set_rofi() {
	ctp=$(current_theme_path "$1")
	file=$ctp/rofi.rasi
	ln -sf "$file" "$rofi/theme.rasi"
	ln -sf "$file" "$HOME/.config/rofi/theme.rasi"
}
set_waybar() {
	ctp=$(current_theme_path "$1")
	file=$ctp/waybar.css
	ln -sf "$file" "$waybar/theme.css"
	pkill waybar
	waybar -c "$waybar/config.jsonc" -s "$waybar/style.css" &
}
set_hypr() {
	sed -i "s/theme =.*/theme = $1/" "$hypr/hyprlock.conf"
	sed -i "s/theme =.*/theme = $1/" "$hypr/hyprland.conf"
}

set_theme() {
	set_swaync "$1"
	set_alacritty "$1"
	set_fish "$1"
	set_mako "$1"
	set_rofi "$1"
	set_waybar "$1"
	set_hypr "$1"
	set_wallaper "$1"
	if $use_mako; then
		makoctl reload
	else
		pkill swaync && swaync &
	fi
	notify-send -t 3000 "Theme" "Set to $1"
}

check_themes_exist() {
	if [ ! -d "$themes_dir" ]; then
		echo "Themes dir not found"
		exit 1
	fi

	if [ ! -d "$themes_dir/$1" ]; then
		echo
		echo "Theme not found"
		echo
		echo -e "current themes:"
		for dir in "$themes_dir"/*; do
			if [ -d "$dir" ]; then
				echo -e "  \033[35m$(basename "$dir")"
			fi
		done
		exit 1
	fi

	# checks the necessary files
	checks=("$themes_dir/$1/alacritty.toml" "$themes_dir/$1/fish.theme" "$themes_dir/$1/mako" "$themes_dir/$1/rofi.rasi" "$themes_dir/$1/waybar.css")
	for check in "${checks[@]}"; do
		if [ ! -f "$check" ]; then
			echo "Theme missing files"
			exit 1
		fi
	done

}

echo_help() {
	echo
	echo -e "\033[0;34mUsage: set_theme.sh < [theme] | rofi | tui >\033[0m"
	echo
	echo -e "current themes:"
	for dir in "$themes_dir"/*; do
		if [ -d "$dir" ]; then
			echo -e "  \033[35m$(basename "$dir")"
		fi
	done
}

# main

echo_dirs() {
	parent=$themes_dir
	for dir in "$parent"/*; do
		if [ -d "$dir" ]; then
			echo -e "$(basename "$dir")"
		fi
	done
}

if [ -z "$1" ]; then
	echo_help
fi

if [ "$1" == "rofi" ]; then
	themes=$(echo_dirs)
	theme=$(echo -e "$themes" | rofi -dmenu -i -config "$rofi"/config.rasi)
elif [ "$1" == "tui" ]; then
	themes=$(echo_dirs | cat | tr '\n' ' ')
	theme=$(gum filter $themes)
else
	theme=$1
fi

check_themes_exist "$theme"
set_theme "$theme"
