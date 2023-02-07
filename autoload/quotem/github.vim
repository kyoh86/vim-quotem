function quotem#github#get_url()
    let l:proc = [
        \     'export DIRENV_LOG_FORMAT=""',
        \     '&&',
        \     'cd', shellescape(expand('%:p:h')),
        \     '&&',
        \     'gh', 'browse', '--no-browser', shellescape(expand('%:t')),
        \     '2>/dev/null',
        \ ]
  return trim(system(join(l:proc, ' ')))
endfunction
