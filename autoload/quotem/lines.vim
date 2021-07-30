function! quotem#lines#bare(line1, line2)
  call s:copy_with(a:line1, a:line2, '')
endfunction

function! quotem#lines#named(range, line1, line2)
  call s:copy_with(a:line1, a:line2, expand('%') .. s:local_line(a:range, a:line1))
endfunction

function! quotem#lines#tailnamed(range, line1, line2)
  call s:copy_with(a:line1, a:line2, expand('%:t') .. s:local_line(a:range, a:line1))
endfunction

function! quotem#lines#fullnamed(range, line1, line2)
  call s:copy_with(a:line1, a:line2, expand('%:p') .. s:local_line(a:range, a:line1))
endfunction

function! quotem#lines#github(range, line1, line2)
  call s:copy_with(a:line1, a:line2, quotem#github#get_url() .. s:url_line(a:range, a:line1, a:line2))
endfunction

function! s:copy_with(line1, line2, label)
  let l:contents = getline(a:line1, a:line2)

  call quotem#copy_with(a:label, l:contents)
endfunction

function! s:local_line(range, line1)
  if a:range > 0
    return ':' .. a:line1
  endif
  return ''
endfunction

function! s:url_line(range, line1, line2)
  if a:range == 1 || a:line1 == a:line2
    return '#L' .. a:line1
  elseif a:range == 2 && a:line1 != a:line2
    return '#L' .. a:line1 .. '-L' .. a:line2
  endif
  return ''
endfunction

