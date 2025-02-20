#!/bin/bash

set -ouex pipefail

# enable copr-repos for fresher hyprland builds
dnf -y copr enable solopasha/hyprland
dnf -y copr enable azandure/clipse
dnf -y copr enable errornointernet/walker
dnf -y copr enable ublue-os/staging

# Add packages from solopasha here
dnf -y install hyprland
dnf -y install xdg-desktop-portal-hyprland
dnf -y install hyprpolkitagent # has to be started via exec-once
dnf -y install swww # wallpaper, with animation support
dnf -y install waypaper # GUI wallpaper manager for many backends
dnf -y install hyprpicker # don't think I'll need a color picker, but who knows
dnf -y install hyprlock # lockscreen
dnf -y install hypridle # idle daemon TODO find out how to use it
dnf -y install hyprsunset # TODO read docs and configure
# dnf -y install hyprcursor # TODO seems complicated and useless, but somewhat cool
dnf -y install hyprland-plugins # TODO there seems to be some nice stuff
dnf -y install hypernome # workspace switching like in my beloved gnome
dnf -y install uwsm # needed to start hyprland via systemd

# Add packages from azandure here
dnf -y install clipse # Clipboard-Manager - TODO see the clipse GitHub for hyprland instructions

# Add packages from errornointernet here
dnf -y install walker # cool application launcher

# Add packages from ublue-os here, unclear if this is necessary or if they are part of ublue-main
dnf -y install ublue-brew
dnf -y install ptyxis # my favorite terminal emu
dnf -y install nautilus-open-any-terminal
dnf -y install tlp
dnf -y install ublue-fastfetch

# Disable copr-repos again
dnf -y copr disable solopasha/hyprland
dnf -y copr disable azandure/clipse
dnf -y copr disable errornointernet/walker
dnf -y copr disable ublue-os/staging

# Add regular fedora packages here

# Must-Have according to hyprland docs
dnf -y install kitty # default terminal on hyprland
dnf -y install dunst # notification daemon
dnf -y install pipewire wireplumber # needed for screenshare
dnf -y install xdg-desktop-portal-gtk # needed for filepicker
dnf -y install qt5-qtwayland qt6-qtwayland # wayland support for QT

# Must-Have according to me (tm)
dnf -y install waybar # GTK status bar for wlroots with hyprland support
# can be started with exec-once, until uwsm is working. Then use waybar.service.
dnf -y install udiskie # automount usb, start with exec-once
dnf -y install hyprshot
# TODO Do I want a dock?

# File managers (Nautlius for life)
dnf -y install nautilus
# dnf -y install superfile # maybe I'm someday a terminal guy, superfile looks nice. No fedora package.

# TODO Maybe add and configure hyproled? Seems kinda unnecessary, idk. No package tho.
# TODO Add hot-corner support, maybe https://lib.rs/crates/hyprcorners or https://github.com/AndreasBackx/waycorner

# TODO find out how to install some software through brew in the user home

# TODO IMPORTANT: Find out how to deploy my default configs to the user
# I'd like them to be in /usr and be of lower prio than the one of the user.

# Software I want
dnf -y install mpv # can't get over the fact that I'm using mpv, but it's the only one with HDR support
# TODO Alias to start mpv in hdr-mode with less pain
dnf -y install distrobox

# TODO find out how bluefin installs vscode with devcontainers