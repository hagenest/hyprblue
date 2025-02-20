#!/bin/bash

set -ouex pipefail

# enable copr-repos for fresher hyprland builds
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable azandure/clipse
dnf5 -y copr enable errornointernet/walker
dnf5 -y copr enable ublue-os/staging

# Add packages from solopasha here
dnf5 -y install hyprland
dnf5 -y install xdg-desktop-portal-hyprland
dnf5 -y install hyprpolkitagent # has to be started via exec-once
dnf5 -y install swww # wallpaper, with animation support
dnf5 -y install waypaper # GUI wallpaper manager for many backends
dnf5 -y install hyprpicker # don't think I'll need a color picker, but who knows
dnf5 -y install hyprlock # lockscreen
dnf5 -y install hypridle # idle daemon TODO find out how to use it
dnf5 -y install hyprsunset # TODO read docs and configure
# dnf5 -y install hyprcursor # TODO seems complicated and useless, but somewhat cool
dnf5 -y install hyprland-plugins # TODO there seems to be some nice stuff
dnf5 -y install hyprnome # workspace switching like in my beloved gnome
dnf5 -y install uwsm # needed to start hyprland via systemd

# Add packages from azandure here
dnf5 -y install clipse # Clipboard-Manager - TODO see the clipse GitHub for hyprland instructions

# Add packages from errornointernet here
dnf5 -y install walker # cool application launcher

# Add packages from ublue-os here, unclear if this is necessary or if they are part of ublue-main
dnf5 -y install ublue-brew
dnf5 -y install ptyxis # my favorite terminal emu
dnf5 -y install nautilus-open-any-terminal
dnf5 -y install tlp
dnf5 -y install ublue-fastfetch

# Disable copr-repos again
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable azandure/clipse
dnf5 -y copr disable errornointernet/walker
dnf5 -y copr disable ublue-os/staging

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
dnf -y install tealdeer

# TODO find out how bluefin installs vscode with devcontainers
