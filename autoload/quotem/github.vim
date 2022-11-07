function quotem#github#get_url()
    let l:proc = [
        \     'cd', shellescape(expand('%:p:h')),
        \     '&&',
        \     'gh', 'browse', '--no-browser', shellescape(expand('%:t')),
        \ ]
  return trim(system(join(l:proc, ' ')))
endfunction
