changecom`'dnl
changequote(`{%|', `|%}'){%||%}dnl
include({%|src/tools/rules_code.m4|%}){%||%}dnl
rules_code({%|src/files/format.ac.vim.m4|%}){%||%}dnl
rules_code({%|src/tools/rules_code.m4|%}){%||%}dnl
include({%|src/tools/footer_comment.m4|%}){%||%}dnl
include({%|src/tools/header_comment.m4|%}){%||%}dnl
header_comment({%|"|%}, {%|"|%}){%|
"
" Special file: format.ac.vim
"
" For more information, see the GATBPS manual.
"

"
" The code is in a function only so that it does not affect the last
" used search pattern or the redo command. For more information, see
" :help function-search-undo in Vim.
"
" It is also convenient that a function automatically deletes its local
" variables when it ends. For more information, see :help :unlet in Vim.
"

function s:FormatAutoconfFile()

  let original_window_view = winsaveview()

  let affected_search_history = 0

  let section_marker = '\m^\]dnl \%(begin\|end\)_.*\n\[$'

  let s1 = '\m^\]dnl begin_includes\n\[$'
  let s2 = '\m^\]dnl end_includes\n\[$'
  call cursor(1, 1)
  let n1 = search(s1, 'cW')
  while n1 != 0
    call cursor(n1, 1)
    let n2 = search(s2, 'W')
    if n2 == 0
      break
    endif
    call cursor(n1, 1)
    if search(section_marker, 'W') == n2
      exec n1 . '+1,' . n2 . 'g/\m^$/d _'
      exec n1 . '+1s/\m$/\r/'
      call cursor(n1, 1)
      let n2 = search(s2, 'W')
      exec n1 . '+2,' . n2 . '-1s/\m\]/ ]/eg'
      exec n1 . '+2,' . n2 . '-1sort u'
      call cursor(n1, 1)
      let n2 = search(s2, 'W')
      exec n1 . '+2,' . n2 . '-1s/\m \]/]/eg'
      exec n2 . '-1s/\m.$/&\r/e'
      let affected_search_history = 1
    endif
    call cursor(n1, 1)
    let n1 = search(s1, 'W')
  endwhile

  let s1 = '\m^\]dnl begin_prerequisites\n\[$'
  let s2 = '\m^\]dnl end_prerequisites\n\[$'
  call cursor(1, 1)
  let n1 = search(s1, 'cW')
  while n1 != 0
    call cursor(n1, 1)
    let n2 = search(s2, 'W')
    if n2 == 0
      break
    endif
    call cursor(n1, 1)
    if search(section_marker, 'W') == n2
      exec n1 . '+1,' . n2 . 'g/\m^$/d _'
      exec n1 . '+1s/\m$/\r/'
      call cursor(n1, 1)
      let n2 = search(s2, 'W')
      exec n1 . '+2,' . n2 . '-1s/\m\]/ ]/eg'
      exec n1 . '+2,' . n2 . '-1sort u'
      call cursor(n1, 1)
      let n2 = search(s2, 'W')
      exec n1 . '+2,' . n2 . '-1s/\m \]/]/eg'
      exec n2 . '-1s/\m.$/&\r/e'
      let affected_search_history = 1
    endif
    call cursor(n1, 1)
    let n1 = search(s1, 'W')
  endwhile

  let s1 = '\m^\]dnl begin_targets\n\[$'
  let s2 = '\m^\]dnl end_targets\n\[$'
  call cursor(1, 1)
  let n1 = search(s1, 'cW')
  while n1 != 0
    call cursor(n1, 1)
    let n2 = search(s2, 'W')
    if n2 == 0
      break
    endif
    call cursor(n1, 1)
    if search(section_marker, 'W') == n2
      call cursor(n1, 1)
      let n3 = search('\m\b', 'W')
      if n3 == 0 || n3 > n2
        exec n2 . 's/\m^/\r\r/'
        exec n1 . '+1s/\m$/\r/'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+2,' . n2 . '-1g/\m./s/\m$/\b/'
        exec n1 . '+2,' . n2 . '-2g/\m^\n./.+1;/\m^$/-1j!'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+2,' . n2 . '-1g/\m^$/d _'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1s/\m$/\r/'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+2,' . n2 . '-1s/\m\]/\b]/eg'
        exec n1 . '+2,' . n2 . '-1sort u'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+2,' . n2 . '-1s/\m\b\]/]/eg'
        exec n1 . '+2,' . n2 . '-1s/\m\b/\r/eg'
        let affected_search_history = 1
      endif
    endif
    call cursor(n1, 1)
    let n1 = search(s1, 'W')
  endwhile

  if affected_search_history
    call histdel('search', -1)
  endif

  call winrestview(original_window_view)

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
