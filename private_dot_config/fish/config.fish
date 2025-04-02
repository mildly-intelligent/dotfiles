oh-my-posh init fish --config /usr/share/oh-my-posh/themes/blue-owl.omp.json | source
if not set -q VSCODE_CWD;   status --is-login; and status --is-interactive; and exec byobu-launcher;end

set -x TRASH $HOME/.local/share/Trash/files/
set -x EDITOR nvim
