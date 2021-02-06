let g:quotem#filetypeattrs = {}
let g:quotem#buftypeattrs = {
      \ 'terminal': 'console'
      \ }

function! quotem#attr()
  if &buftype !=# ''
    let l:attr = get(g:quotem#buftypeattrs, &buftype, v:null)
    if l:attr !=# v:null
      return l:attr
    endif
    return &buftype
  endif
  if &filetype !=# ''
    let l:attr = get(g:quotem#filetypeattrs, &filetype, v:null)
    if l:attr !=# v:null
      return l:attr
    endif
    return &filetype
  endif
  return ''
endfunction

function! quotem#_get_marked_text_lines(start_mark, end_mark)
  let [line_start, column_start] = getpos(a:start_mark)[1:2]
  let [line_end, column_end] = getpos(a:end_mark)[1:2]
  let l:marked = getline(line_start, line_end)
  if len(l:marked) == 0
    return []
  endif
  let l:marked[-1] = trim(l:marked[-1][: column_end - 1])
  if l:marked[-1] ==# ''
    if len(l:marked) == 1
      return []
    endif
    let l:marked = l:marked[:-2]
  endif

  let l:marked[0] = trim(l:marked[0][column_start - 1:])
  if l:marked[0] ==# ''
    if len(l:marked) == 1
      return []
    endif
    let l:marked = l:marked[1:]
  endif
  return l:marked
endfunction
