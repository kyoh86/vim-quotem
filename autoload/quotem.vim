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

function! quotem#copy_with(label, contents)
  let l:lines = []
  if len(a:label) !=# ''
    call add(l:lines, a:label)
  endif
  call add(l:lines, '```' .. quotem#attr())
  call extend(l:lines, a:contents)
  call add(l:lines, '```')
  call add(l:lines, '')
  call setreg('+', join(l:lines, "\n"))
endfunction
