#!/bin/bash
# Ждем появления сокета Hyprland
while [ ! -S "$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket.sock" ]; do
    sleep 0.1
done

# Ждем еще 1.5 секунды, пока Quickshell (Caelestia) инициализирует локскрин
sleep 1.5

# Вызываем блокировку
hyprctl dispatch 'hl.dsp.global("caelestia:lock")'
