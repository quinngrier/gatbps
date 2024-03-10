"
" This file was generated by GATBPS 0.2.0-alpha.91+ga52a09f, which was
" released on 2024-03-10. Before changing it, make sure
" you're doing the right thing. Depending on how GATBPS
" is being used, your changes may be automatically lost.
" A short description of this file follows.
"
" Special file: format.am.vim
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

function s:FormatAutomakeFile()

  let original_window_view = winsaveview()

  let affected_search_history = 0

  let section_marker = '\m^## \%(begin\|end\)_'

  let s1 = '\m^## begin_includes$'
  let s2 = '\m^## end_includes$'
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
      exec n1 . ',' . n2 . 'g/\m^$/d _'
      exec n1 . 's/\m$/\r/'
      call cursor(n1, 1)
      let n2 = search(s2, 'W')
      exec n1 . '+1,' . n2 . '-1sort u'
      call cursor(n1, 1)
      let n2 = search(s2, 'W')
      exec n2 . '-1s/\m.$/&\r/e'
      let affected_search_history = 1
    endif
    call cursor(n1, 1)
    let n1 = search(s1, 'W')
  endwhile

  let s1 = '\m^## begin_rules$'
  let s2 = '\m^## end_rules$'
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
        exec n1 . 's/\m$/\r/'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1g/\m\\$/s/\m$/\b/'
        exec n1 . '+1,' . n2 . '-1g/\m\\\b$/.;/\m\%(\\\b\)\@<!$/j!'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1g/\m\%(^[^\t][^\b#]*:.*\)\@<!\n[^\t][^\b#]*:/.+1;/\m\%(^[^\t][^\b#]*:.*\)\@<!$/-1sort u'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1g/\m./s/\m$/\b/'
        exec n1 . '+1,' . n2 . '-2g/\m^\n./.+1;/\m^$/-1j!'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1g/\m^$/d _'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . 's/\m$/\r/'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1s/\m:/ :/eg'
        exec n1 . '+1,' . n2 . '-1sort u'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1s/\m :/:/eg'
        exec n1 . '+1,' . n2 . '-1s/\m\b/\r/eg'
        let affected_search_history = 1
      endif
    endif
    call cursor(n1, 1)
    let n1 = search(s1, 'W')
  endwhile

  let s1 = '\m^## begin_variables$'
  let s2 = '\m^## end_variables$'
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
        exec n1 . 's/\m$/\r/'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1g/\m\\$/s/\m$/\b/'
        exec n1 . '+1,' . n2 . '-1g/\m\\\b$/.;/\m\%(\\\b\)\@<!$/j!'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1g/\m\%(^[^\b#=]*+=.*\)\@<!\n[^\b#=]*+=/.+1;/\m\%(^[^\b#=]*+=.*\)\@<!$/-1sort u'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1g/\m./s/\m$/\b/'
        exec n1 . '+1,' . n2 . '-2g/\m^\n./.+1;/\m^$/-1j!'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1g/\m^$/d _'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . 's/\m$/\r/'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1s/\m=/ =/eg'
        exec n1 . '+1,' . n2 . '-1sort u'
        call cursor(n1, 1)
        let n2 = search(s2, 'W')
        exec n1 . '+1,' . n2 . '-1s/\m =/=/eg'
        exec n1 . '+1,' . n2 . '-1s/\m\b/\r/eg'
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

call s:FormatAutomakeFile()

delfunction s:FormatAutomakeFile

"
" The authors of this file have waived all copyright and
" related or neighboring rights to the extent permitted by
" law as described by the CC0 1.0 Universal Public Domain
" Dedication. You should have received a copy of the full
" dedication along with this file, typically as a file
" named <CC0-1.0.txt>. If not, it may be available at
" <https://creativecommons.org/publicdomain/zero/1.0/>.
"
