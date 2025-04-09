if [ "$(env | grep TERM)" != "TERM=linux" ]
    oh-my-posh init fish --config /usr/share/oh-my-posh/themes/blue-owl.omp.json | source
end

if not set -q VSCODE_CWD
    status --is-login; and status --is-interactive

end

set -x TRASH $HOME/.local/share/Trash/files/
set -x EDITOR nvim
