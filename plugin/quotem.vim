command! -range QuotemBare      :call quotem#lines#bare()
command! -range QuotemNamed     :call quotem#lines#named()
command! -range QuotemTailnamed :call quotem#lines#tailnamed()
command! -range QuotemFullnamed :call quotem#lines#fullnamed()

nnoremap <silent> <Plug>(quotem-bare)       :     QuotemBare<CR>
vnoremap <silent> <Plug>(quotem-bare)       :'<,'>QuotemBare<CR>
nnoremap <silent> <Plug>(quotem-named)      :     QuotemNamed<CR>
vnoremap <silent> <Plug>(quotem-named)      :'<,'>QuotemNamed<CR>
nnoremap <silent> <Plug>(quotem-tailnamed)  :     QuotemTailnamed<CR>
vnoremap <silent> <Plug>(quotem-tailnamed)  :'<,'>QuotemTailnamed<CR>
nnoremap <silent> <Plug>(quotem-fullnamed)  :     QuotemFullnamed<CR>
vnoremap <silent> <Plug>(quotem-fullnamed)  :'<,'>QuotemFullnamed<CR>

call operator#user#define('quotem-bare',      'quotem#operand#bare')
call operator#user#define('quotem-named',     'quotem#operand#named')
call operator#user#define('quotem-tailnamed', 'quotem#operand#tailnamed')
call operator#user#define('quotem-fullnamed', 'quotem#operand#fullnamed')
