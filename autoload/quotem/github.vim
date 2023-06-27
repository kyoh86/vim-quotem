function quotem#github#get_url(reftype, filename)
  if get(g:, "gitname_loaded", 0)
    return gitname#hub_url_of(a:reftype, a:filename)
  else
    let l:commit_opt = ""
    if a:reftype ==# "head"
      let l:commit_opt = "--commit"
    endif
    let l:proc = [
        \     "cd", shellescape(fnamemodify(a:filename, ":p:h")),
        \     "gh", "browse", "--no-browser", l:commit_opt, shellescape(fnamemodify(a:filename, ':p:t')),
        \     "2>/dev/null",
        \ ]
    return trim(system(join(l:proc, ' ')))
  endif
endfunction
