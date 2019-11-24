set -x EDITOR vim
set -x TERMINAL st

set PATH /usr/local/bin /usr/bin /bin /usr/local/games /usr/games /usr/share/games /usr/local/sbin /usr/sbin /sbin ~/bin

abbr -a -U np firejail --noprofile
abbr -a -U pbcopy xclip -selection clipboard
abbr -a -U pbpaste xclip -selection clipboard -o
abbr -a -U scrclip "import png:- | xclip -selection c -t image/png"
abbr -a -U bsync browser-sync start -s src/ -f src -b "brave-browser" --no-notifiy

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
