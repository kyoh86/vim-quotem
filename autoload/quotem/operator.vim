function! quotem#operator#bare(motion_wiseness)
  call s:copy_with('', {_1, _2 -> ''})
endfunction

function! quotem#operator#named(motion_wiseness)
  call s:copy_with(expand('%'), {line1, _ -> s:local_line(line1)})
endfunction

function! quotem#operator#tailnamed(motion_wiseness)
  call s:copy_with(expand('%:t'), {line1, _ -> s:local_line(line1)})
endfunction

function! quotem#operator#fullnamed(motion_wiseness)
  call s:copy_with(expand('%:p'), {line1, _ -> s:local_line(line1)})
endfunction

function! quotem#operator#github(motion_wiseness)
  call s:copy_with(quotem#github#get_url(), s:url_line)
endfunction

function! s:copy_with(label, marker)
  let [l:line_start, l:column_start] = getpos("'[")[1:2]
  let [l:line_end, l:column_end] = getpos("']")[1:2]
  let l:contents = s:get_lines(l:line_start, l:column_start, l:line_end, l:column_end)

  call quotem#copy_with(a:label .. a:marker(l:line_start, l:line_end), l:contents)
endfunction

function! s:get_lines(line_start, column_start, line_end, column_end)
  """ get operand lines
  let l:marked = getline(a:line_start, a:line_end)
  if len(l:marked) == 0
    return []
  endif
  let l:marked[-1] = trim(l:marked[-1][: a:column_end - 1])
  if l:marked[-1] ==# ''
    if len(l:marked) == 1
      return []
    endif
    let l:marked = l:marked[:-2]
  endif

  let l:marked[0] = trim(l:marked[0][a:column_start - 1:])
  if l:marked[0] ==# ''
    if len(l:marked) == 1
      return []
    endif
    let l:marked = l:marked[1:]
  endif
  return l:marked
endfunction

function! s:local_line(line1)
  return ':' .. a:line1
endfunction

function! s:url_line(line1, line2)
  if a:line1 == a:line2
    return '#L' .. a:line1
  endif
  return '#L' .. a:line1 .. '-L' .. a:line2
endfunction
