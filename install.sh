#!/usr/bin/env bash
set -e
do_install() {
    echo "=== 1. Обновление базы и установка базовых утилит ==="
    sudo pacman -Syu --noconfirm --needed base-devel git
    echo "=== 2. Проверка и установка AUR-помощника (yay) ==="
    if ! command -v yay &> /dev/null;
        then git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si --noconfirm && cd - && rm -rf /tmp/yay
    fi
    echo "=== 3. Установка официальных пакетов pacman ==="
    [ -f pkglist.txt ] && sudo pacman -S --needed --noconfirm - < pkglist.txt || true
    echo "=== 4. Установка пакетов из AUR ==="
    [ -f aur_pkglist.txt ] && yay -S --needed --noconfirm --mflags "--skippgpcheck" - < aur_pkglist.txt || true
    echo "=== 5. Копирование конфигов и обоев ==="
    mkdir -p ~/.config ~/Pictures/Wallpapers
    [ -d config ] && cp -rf config/* ~/.config/
    [ -d wallpapers ] && cp -rf wallpapers/* ~/Pictures/Wallpapers/ 2>/dev/null || true
    [ -d etc_system ] && sudo cp -rf etc_system/* /etc/ 2>/dev/null || true
    echo "=== 6. Фикс для запуска Hyprland в ВМ ==="
    if systemd-detect-virt | grep -q -v 'none'; then
        mkdir -p ~/.config/hypr
        touch ~/.config/hypr/hyprland.conf
        grep -qF 'env = WLR_RENDERER,pixman' ~/.config/hypr/hyprland.conf || echo 'env = WLR_RENDERER,pixman' >> ~/.config/hypr/hyprland.conf
        grep -qF 'env = WLR_NO_HARDWARE_CURSORS,1' ~/.config/hypr/hyprland.conf || echo 'env = WLR_NO_HARDWARE_CURSORS,1' >> ~/.config/hypr/hyprland.conf
        grep -qF 'env = LIBGL_ALWAYS_SOFTWARE,1' ~/.config/hypr/hyprland.conf || echo 'env = LIBGL_ALWAYS_SOFTWARE,1' >> ~/.config/hypr/hyprland.conf
    fi
    echo "=== 7. Создание глобальной команды Caelestia-save ==="
    sudo rm -rf /opt/Caelestia-save
    sudo cp -r "$(pwd)" /opt/Caelestia-save
    sudo ln -sf /opt/Caelestia-save/install.sh /usr/local/bin/Caelestia-save
    sudo chmod +x /usr/local/bin/Caelestia-save
    echo "=== ГОТОВО! ==="
}
do_install
