changecom`'dnl
changequote(`{%|', `|%}')dnl
include({%|src/tools/footer_comment.m4|%})dnl
include({%|src/tools/header_comment.m4|%})dnl
header_comment({%|"|%}, {%|"|%}){%|
"
" Special file: Makefile.am.vim
"
" For more information, see the GATBPS manual.
"

let s:view = winsaveview()

let s:s1 = '\m^## begin_variables$'
let s:s2 = '\m^## end_variables$'

call cursor(1, 1)
let s:n1 = search(s:s1, 'cW')
if s:n1 != 0 && search(s:s1, 'W') != 0
  echoerr '''' . s:s1 . ''' appears twice'
  call winrestview(s:view)
  finish
endif

call cursor(1, 1)
let s:n2 = search(s:s2, 'cW')
if s:n2 != 0 && search(s:s2, 'W') != 0
  echoerr '''' . s:s2 . ''' appears twice'
  call winrestview(s:view)
  finish
endif

if s:n1 != 0 && s:n2 == 0
  echoerr '''' . s:s1 . ''' appears without ''' . s:s2 . ''''
  call winrestview(s:view)
  finish
endif

if s:n1 == 0 && s:n2 != 0
  echoerr '''' . s:s2 . ''' appears without ''' . s:s1 . ''''
  call winrestview(s:view)
  finish
endif

if s:n1 != 0 && s:n2 != 0 && s:n1 > s:n2
  echoerr '''' . s:s1 . ''' appears after ''' . s:s2 . ''''
  call winrestview(s:view)
  finish
endif

if s:n1 != 0 && s:n2 != 0
  %s/\m^## begin_variables$/&\r/
  %s/\m^## end_variables$/\r&/
  /\m^## begin_variables$/+1,/\m^## end_variables$/-1g/\m+=/.,/\m^$/-1sort u
  /\m^## begin_variables$/+1,/\m^## end_variables$/-1g/\m./s/\m$/\b/
  /\m^## begin_variables$/+1,/\m^## end_variables$/-2g/\m^\n./.+1,/\m^$/-1j!
  /\m^## begin_variables$/+1,/\m^## end_variables$/-1g/\m^$/d
  %s/\m^## begin_variables$/&\r/
  /\m^## begin_variables$/+1,/\m^## end_variables$/-1sort
  /\m^## begin_variables$/+1,/\m^## end_variables$/-1s/\m\b/\r/eg
endif

let s:s1 = '\m^## begin_rules$'
let s:s2 = '\m^## end_rules$'

call cursor(1, 1)
let s:n1 = search(s:s1, 'cW')
if s:n1 != 0 && search(s:s1, 'W') != 0
  echoerr '''' . s:s1 . ''' appears twice'
  call winrestview(s:view)
  finish
endif

call cursor(1, 1)
let s:n2 = search(s:s2, 'cW')
if s:n2 != 0 && search(s:s2, 'W') != 0
  echoerr '''' . s:s2 . ''' appears twice'
  call winrestview(s:view)
  finish
endif

if s:n1 != 0 && s:n2 == 0
  echoerr '''' . s:s1 . ''' appears without ''' . s:s2 . ''''
  call winrestview(s:view)
  finish
endif

if s:n1 == 0 && s:n2 != 0
  echoerr '''' . s:s2 . ''' appears without ''' . s:s1 . ''''
  call winrestview(s:view)
  finish
endif

if s:n1 != 0 && s:n2 != 0 && s:n1 > s:n2
  echoerr '''' . s:s1 . ''' appears after ''' . s:s2 . ''''
  call winrestview(s:view)
  finish
endif

if s:n1 != 0 && s:n2 != 0
  %s/\m^## begin_rules$/&\r/
  %s/\m^## end_rules$/\r&/
  /\m^## begin_rules$/,/\m^## end_rules$/-2g/\m^\n./.+1,/\m^\($\|\t\)/-1sort u
  /\m^## begin_rules$/+1,/\m^## end_rules$/-1g/\m./s/\m$/\b/
  /\m^## begin_rules$/+1,/\m^## end_rules$/-2g/\m^\n./.+1,/\m^$/-1j!
  /\m^## begin_rules$/+1,/\m^## end_rules$/-1g/\m^$/d
  %s/\m^## begin_rules$/&\r/
  /\m^## begin_rules$/+1,/\m^## end_rules$/-1sort
  /\m^## begin_rules$/+1,/\m^## end_rules$/-1s/\m\b/\r/eg
endif

call winrestview(s:view)

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
