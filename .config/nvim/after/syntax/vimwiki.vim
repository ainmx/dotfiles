syntax match todoCheckbox '\v.*\[\ \]'hs=e-2 conceal cchar=󰄱
syntax match todoCheckbox '\v.*\[X\]'hs=e-2 conceal cchar=󰄲
syntax match todoCheckbox '\v.*\[[.o]\]'hs=e-2 conceal cchar=󰄗
syntax match todoCheckbox '\v.*\[O\]'hs=e-2 conceal cchar=󰡖
syntax match VimwikiListTodo '^\v[^|#-]*[-+]'hs=e conceal cchar=•
syntax match VimwikiCellSeparator '|'hs=e conceal cchar=│
syntax match VimwikiHeader2 '\v-'hs=e conceal cchar=─
syntax match VimwikiHeader2 '\v\>'hs=e conceal cchar=┃
setlocal conceallevel=2
hi Conceal guibg=NONE
