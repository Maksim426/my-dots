[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    # Очищаем терминал и глушим весь вывод Hyprland в /dev/null
    clear
    exec Hyprland >/dev/null 2>&1
fi
