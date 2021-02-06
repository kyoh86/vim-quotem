function! quotem#lines#bare()
  call s:copy_with([])
endfunction

function! quotem#lines#named()
  call s:copy_with([expand('%')])
endfunction

function! quotem#lines#tailnamed()
  call s:copy_with([expand('%:t')])
endfunction

function! quotem#lines#fullnamed()
  call s:copy_with([expand('%:p')])
endfunction

function! s:copy_with(lines)
  let l:lines = a:lines
  call add(l:lines, '```' .. quotem#attr())
  call extend(l:lines, quotem#_get_marked_text_lines("'<", "'>"))
  call add(l:lines, '```')
  call add(l:lines, '')
  call setreg('+', join(l:lines, "\n"))
endfunction
