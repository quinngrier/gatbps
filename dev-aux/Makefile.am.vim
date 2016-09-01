"
" This file was generated by GATBPS 0.0.0-3873-g81cf270, which was
" released on 2016-09-01. Before changing it, make sure
" you're doing the right thing. Depending on how GATBPS
" is being used, your changes may be automatically lost.
" A short description of this file follows.
"
" Special file: Makefile.am.vim
"
" For more information, see the GATBPS manual.
"

"
" The code is in a function only so that it does not affect the last
" used search pattern or the redo command. For more information, run
" :help function-search-undo in Vim.
"

function! s:FormatAutomakeFile()

  let s:original_window_view = winsaveview()

  let s:affected_search_history = 0

  let s:mark = '\m^## \%(begin\|end\)_'

  let s:s1 = '\m^## begin_includes$'
  let s:s2 = '\m^## end_includes$'
  call cursor(1, 1)
  let s:n1 = search(s:s1, 'cW')
  while s:n1 != 0
    call cursor(s:n1, 1)
    let s:n2 = search(s:s2, 'W')
    if s:n2 == 0
      break
    endif
    call cursor(s:n1, 1)
    if search(s:mark, 'W') == s:n2
      exec s:n1 . ',' . s:n2 . 'g/\m^$/d'
      exec s:n1 . 's/\m$/\r/'
      call cursor(s:n1, 1)
      let s:n2 = search(s:s2, 'W')
      exec s:n1 . '+1,' . s:n2 . '-1sort u'
      call cursor(s:n1, 1)
      let s:n2 = search(s:s2, 'W')
      exec s:n2 . 's/\m^/\r/'
      let s:affected_search_history = 1
    endif
    call cursor(s:n1, 1)
    let s:n1 = search(s:s1, 'W')
  endwhile

  let s:s1 = '\m^## begin_rules$'
  let s:s2 = '\m^## end_rules$'
  call cursor(1, 1)
  let s:n1 = search(s:s1, 'cW')
  while s:n1 != 0
    call cursor(s:n1, 1)
    let s:n2 = search(s:s2, 'W')
    if s:n2 == 0
      break
    endif
    call cursor(s:n1, 1)
    if search(s:mark, 'W') == s:n2
      call cursor(s:n1, 1)
      let s:n3 = search('\m\b', 'W')
      if s:n3 == 0 || s:n3 > s:n2
        exec s:n2 . 's/\m^/\r\r/'
        exec s:n1 . 's/\m$/\r/'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1g/\m\\$/s/\m$/\b/'
        exec s:n1 . '+1,' . s:n2 . '-1g/\m\\\b$/.,/\m\%(\\\b\)\@<!$/j!'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1g/\m\%(^[^\b#]*:.*\)\@<!\n[^\b#]*:/.+1,/\m\%(^[^\b#]*:.*\)\@<!$/-1sort u'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1g/\m./s/\m$/\b/'
        exec s:n1 . '+1,' . s:n2 . '-2g/\m^\n./.+1,/\m^$/-1j!'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1g/\m^$/d'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . 's/\m$/\r/'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1s/:/\b:/g'
        exec s:n1 . '+1,' . s:n2 . '-1sort u'
        exec s:n1 . '+1,' . s:n2 . '-1s/\b:/:/g'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1s/\m\b/\r/eg'
        let s:affected_search_history = 1
      endif
    endif
    call cursor(s:n1, 1)
    let s:n1 = search(s:s1, 'W')
  endwhile

  let s:s1 = '\m^## begin_variables$'
  let s:s2 = '\m^## end_variables$'
  call cursor(1, 1)
  let s:n1 = search(s:s1, 'cW')
  while s:n1 != 0
    call cursor(s:n1, 1)
    let s:n2 = search(s:s2, 'W')
    if s:n2 == 0
      break
    endif
    call cursor(s:n1, 1)
    if search(s:mark, 'W') == s:n2
      call cursor(s:n1, 1)
      let s:n3 = search('\m\b', 'W')
      if s:n3 == 0 || s:n3 > s:n2
        exec s:n2 . 's/\m^/\r\r/'
        exec s:n1 . 's/\m$/\r/'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1g/\m\\$/s/\m$/\b/'
        exec s:n1 . '+1,' . s:n2 . '-1g/\m\\\b$/.,/\m\%(\\\b\)\@<!$/j!'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1g/\m\%(^[^\b#=]*+=.*\)\@<!\n[^\b#=]*+=/.+1,/\m\%(^[^\b#=]*+=.*\)\@<!$/-1sort u'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1g/\m./s/\m$/\b/'
        exec s:n1 . '+1,' . s:n2 . '-2g/\m^\n./.+1,/\m^$/-1j!'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1g/\m^$/d'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . 's/\m$/\r/'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1s/=/\b=/g'
        exec s:n1 . '+1,' . s:n2 . '-1sort u'
        exec s:n1 . '+1,' . s:n2 . '-1s/\b=/=/g'
        call cursor(s:n1, 1)
        let s:n2 = search(s:s2, 'W')
        exec s:n1 . '+1,' . s:n2 . '-1s/\m\b/\r/eg'
        let s:affected_search_history = 1
      endif
    endif
    call cursor(s:n1, 1)
    let s:n1 = search(s:s1, 'W')
  endwhile

  if s:affected_search_history
    call histdel('search', -1)
  endif

  call winrestview(s:original_window_view)

endfunction

call s:FormatAutomakeFile()

"
" The authors of this file have waived all copyright and
" related or neighboring rights to the extent permitted by
" law as described by the CC0 1.0 Universal Public Domain
" Dedication. You should have received a copy of the full
" dedication along with this file, typically as a file
" named <CC0-1.0.txt>. If not, it may be available at
" <https://creativecommons.org/publicdomain/zero/1.0/>.
"
