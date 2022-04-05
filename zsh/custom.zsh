ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4e4e4e"
_bb_tasks() {
    local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}
compdef _bb_tasks bb
