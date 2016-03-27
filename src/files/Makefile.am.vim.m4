changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|"|%}, {%|"|%}){%|
"
" Special file: Makefile.am.vim
"
" For more information, see the GATBPS manual.
"

let s:s1 = '\m^## begin_variables$'
let s:s2 = '\m^## end_variables$'

call cursor(1, 1)
let s:n1 = search(s:s1, 'cW')
if s:n1 != 0 && search(s:s1, 'W') != 0
  echoerr '''' . s:s1 . ''' appears twice'
  finish
endif

call cursor(1, 1)
let s:n2 = search(s:s2, 'cW')
if s:n2 != 0 && search(s:s2, 'W') != 0
  echoerr '''' . s:s2 . ''' appears twice'
  finish
endif

if s:n1 != 0 && s:n2 == 0
  echoerr '''' . s:s1 . ''' appears without ''' . s:s2 . ''''
  finish
endif

if s:n1 == 0 && s:n2 != 0
  echoerr '''' . s:s2 . ''' appears without ''' . s:s1 . ''''
  finish
endif

if s:n1 != 0 && s:n2 != 0

  if s:n1 > s:n2
    echoerr '''' . s:s1 . ''' appears after ''' . s:s2 . ''''
    finish
  endif

:%sm/\m^## begin_variables$/&\r/
:%sm/\m^## end_variables$/\r&/
:/\m^## begin_variables$/+1,/\m^## end_variables$/-1g/\m./s/\m$/\b/
:/\m^## begin_variables$/+1,/\m^## end_variables$/-2g/\m^\n./.+1,/\m^$/-1j!
:/\m^## begin_variables$/+1,/\m^## end_variables$/-1g/\m^$/d
:%sm/\m^## begin_variables$/&\r/
:/\m^## begin_variables$/+1,/\m^## end_variables$/-1sort
:/\m^## begin_variables$/+1,/\m^## end_variables$/-1s/\m\b/\r/eg
:/\m^## begin_variables$/+1,/\m^## end_variables$/-1g/\m+=/.,/\m^$/-1sort u

endif

let s:s1 = '\m^## begin_rules$'
let s:s2 = '\m^## end_rules$'

call cursor(1, 1)
let s:n1 = search(s:s1, 'cW')
if s:n1 != 0 && search(s:s1, 'W') != 0
  echoerr '''' . s:s1 . ''' appears twice'
  finish
endif

call cursor(1, 1)
let s:n2 = search(s:s2, 'cW')
if s:n2 != 0 && search(s:s2, 'W') != 0
  echoerr '''' . s:s2 . ''' appears twice'
  finish
endif

if s:n1 != 0 && s:n2 == 0
  echoerr '''' . s:s1 . ''' appears without ''' . s:s2 . ''''
  finish
endif

if s:n1 == 0 && s:n2 != 0
  echoerr '''' . s:s2 . ''' appears without ''' . s:s1 . ''''
  finish
endif

if s:n1 != 0 && s:n2 != 0

  if s:n1 > s:n2
    echoerr '''' . s:s1 . ''' appears after ''' . s:s2 . ''''
    finish
  endif

:%sm/\m^## begin_rules$/&\r/
:%sm/\m^## end_rules$/\r&/
:/\m^## begin_rules$/+1,/\m^## end_rules$/-1g/\m./s/\m$/\b/
:/\m^## begin_rules$/+1,/\m^## end_rules$/-2g/\m^\n./.+1,/\m^$/-1j!
:/\m^## begin_rules$/+1,/\m^## end_rules$/-1g/\m^$/d
:%sm/\m^## begin_rules$/&\r/
:/\m^## begin_rules$/+1,/\m^## end_rules$/-1sort
:/\m^## begin_rules$/+1,/\m^## end_rules$/-1s/\m\b/\r/eg
:/\m^## begin_rules$/,/\m^## end_rules$/-2g/\m^$/.+1,/\m^\($\|\t\)/-1sort u

endif

"
" The authors of this file have waived all copyright and
" related or neighboring rights to the extent permitted by
" law as described by the CC0 1.0 Universal Public Domain
" Dedication. You should have received a copy of the full
" dedication along with this file, typically as a file
" named <CC0-1.0.txt>. If not, it may be available at
" <https://creativecommons.org/publicdomain/zero/1.0/>.
"|%}
