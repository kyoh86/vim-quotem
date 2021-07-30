command! -range=% QuotemBare      :call quotem#lines#bare(<line1>, <line2>)
command! -range=% QuotemNamed     :call quotem#lines#named(<range>, <line1>, <line2>)
command! -range=% QuotemTailnamed :call quotem#lines#tailnamed(<range>, <line1>, <line2>)
command! -range=% QuotemFullnamed :call quotem#lines#fullnamed(<range>, <line1>, <line2>)
command! -range=% QuotemGithub    :call quotem#lines#github(<range>, <line1>, <line2>)

nnoremap <silent> <Plug>(quotem-bare)       :     QuotemBare<CR>
vnoremap <silent> <Plug>(quotem-bare)       :'<,'>QuotemBare<CR>
nnoremap <silent> <Plug>(quotem-named)      :     QuotemNamed<CR>
vnoremap <silent> <Plug>(quotem-named)      :'<,'>QuotemNamed<CR>
nnoremap <silent> <Plug>(quotem-tailnamed)  :     QuotemTailnamed<CR>
vnoremap <silent> <Plug>(quotem-tailnamed)  :'<,'>QuotemTailnamed<CR>
nnoremap <silent> <Plug>(quotem-fullnamed)  :     QuotemFullnamed<CR>
vnoremap <silent> <Plug>(quotem-fullnamed)  :'<,'>QuotemFullnamed<CR>
nnoremap <silent> <Plug>(quotem-github)     :     QuotemGithub<CR>
vnoremap <silent> <Plug>(quotem-github)     :'<,'>QuotemGithub<CR>

call operator#user#define('quotem-bare',      'quotem#operator#bare')
call operator#user#define('quotem-named',     'quotem#operator#named')
call operator#user#define('quotem-tailnamed', 'quotem#operator#tailnamed')
call operator#user#define('quotem-fullnamed', 'quotem#operator#fullnamed')
call operator#user#define('quotem-github',    'quotem#operator#github')
