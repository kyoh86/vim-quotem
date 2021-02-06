function! quotem#operand#bare(motion_wiseness)
  call s:copy_with([])
endfunction

function! quotem#operand#named(motion_wiseness)
  call s:copy_with([expand('%')])
endfunction

function! quotem#operand#tailnamed(motion_wiseness)
  call s:copy_with([expand('%:t')])
endfunction

function! quotem#operand#fullnamed(motion_wiseness)
  call s:copy_with([expand('%:p')])
endfunction

function! s:copy_with(lines)
  let l:marked = quotem#_get_marked_text_lines("'[", "']")

  let l:lines = a:lines
  call add(l:lines, '```' .. quotem#attr())
  call extend(l:lines, l:marked)
  call add(l:lines, '```')
  call add(l:lines, '')
  call setreg('+', join(l:lines, "\n"))
endfunction
