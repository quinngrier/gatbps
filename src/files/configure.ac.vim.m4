changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/configure.ac.vim.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|"|%}, {%|"|%}){%|
"
" Special file: configure.ac.vim
"
" For more information, see the GATBPS manual.
"

"
" The code is in a function only so that it does not affect the last
" used search pattern or the redo command. For more information, see
" :help function-search-undo in Vim.
"

function s:FormatAutoconfFile()

endfunction

call s:FormatAutoconfFile()

delfunction s:FormatAutoconfFile

|%}footer_comment({%|"|%}, {%|"|%}, {%|"|%})
dnl
dnl The authors of this file have waived all copyright and
dnl related or neighboring rights to the extent permitted by
dnl law as described by the CC0 1.0 Universal Public Domain
dnl Dedication. You should have received a copy of the full
dnl dedication along with this file, typically as a file
dnl named <CC0-1.0.txt>. If not, it may be available at
dnl <https://creativecommons.org/publicdomain/zero/1.0/>.
dnl
