# to be put in /etc/profile.d/

if uwsm check may-start; then
    exec uwsm start hyprland.desktop -c /etc/xdg/hyprland.conf
fi