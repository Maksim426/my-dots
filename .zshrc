# История команд
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# Цветные подсказки автодополнения (серый цвет)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555555'

# Подгрузка автодополнения и подсветки (если установлены через pacman)
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Стильный монохромный промпт с Caelestia и Fastfetch
autoload -U colors && colors

# Вывод баннера Caelestia при запуске терминала
if [[ -o interactive ]]; then
    echo -e "\033[1;37m"
    echo "   ______            __          __  _          "
    echo "  / ____/___ _____  / /__  _____/ /_(_)___ _    "
    echo " / /   / __ \`/ _ \/ / _ \/ ___/ __/ / __ \`"
    echo "/ /___/ /_/ /  __/ /  __(__  ) /_/ / /_/ /     "
    echo "\____/\__,_/\___/_/\___/____/\__/_/\__,_/      "
    echo -e "\033[0m"
fi

# Внешний вид строки ввода (Prompt)
PROMPT='%F{#ffffff}╭─ %F{#888888}Caelestia %F{#ffffff}in %F{#aaaaaa}%~%f
%F{#ffffff}╰─❯%f '
# Чёрно-белая подсветка команд
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='bold,fg=white'
ZSH_HIGHLIGHT_STYLES[builtin]='bold,fg=white'
ZSH_HIGHLIGHT_STYLES[alias]='bold,fg=white'
ZSH_HIGHLIGHT_STYLES[function]='bold,fg=white'
ZSH_HIGHLIGHT_STYLES[default]='fg=white'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=white,underline'
ZSH_HIGHLIGHT_STYLES[reserved-word]='bold,fg=white'
ZSH_HIGHLIGHT_STYLES[precommand]='bold,fg=white'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=white'
ZSH_HIGHLIGHT_STYLES[path]='fg=white'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=white'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=white'
ZSH_HIGHLIGHT_STYLES[arg0]='bold,fg=white'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=white'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=white'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=white'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=white'
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:\(HOME/.local/bin:\)PATH"
