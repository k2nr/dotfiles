autoload -Uz vcs_info
zstyle ':vcs_info:*' formats \
    '%{%F{yellow}%}(%b)%{%f%}'

pro_cur_dir="%{%F{yellow}%}[%~]"
pro_user="%{%F{cyan}%}%n@%m"
pro_time="%{%F{cyan}%}<%D{%Y/%m/%d %H:%M:%S}>"
update_prompt() {
    # バージョン管理システムの情報を取得する。
    LANG=C vcs_info >&/dev/null
    # バージョン管理システムの情報があったらプロンプトに表示する。
    if [ -n "$vcs_info_msg_0_" ]; then
        pro_vcs="${vcs_info_msg_0_}"
    else
        pro_vcs=""
    fi

    PROMPT="${pro_cur_dir}${pro_user} ${pro_time} ${pro_vcs}"$'\n'"%{%f%}🍣  "
}
#RPROMPT="${pro_vcs}"

precmd_functions=($precmd_functions update_prompt)
