execute pathogen#infect()
let g:solarized_termcolors=512
syntax on
syntax enable
set background=dark
colorscheme solarized
set number
au BufRead,BufNewFile *.tex set expandtab
au BufRead,BufNewFile *.tex set tabstop=4
au BufRead,BufNewFile *.lhs set shiftwidth=2
au BufRead,BufNewFile *.lhs set expandtab
au BufRead,BufNewFile *.lhs set tabstop =2
au BufRead,BufNewFile *.tex set spell


au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.py set tabstop=2
au BufRead,BufNewFile *.py set shiftwidth=2
au BufRead,BufNewFile *.py set softtabstop=2

au BufRead,BufNewFile *.c set expandtab
au BufRead,BufNewFile *.c set tabstop=2
au BufRead,BufNewFile *.c set shiftwidth=2
ab bbb /*
ab eee */
" ab stdio #include <stdio.h>
" ab stdlib #include <stdlib.h>
" ab sth #include <string.h>
" ab vvv (void)
" ab prf printf("
" ___________________________________________

" Enable features that may not be on by default
set nocompatible
set ruler
set ai
set hls
set mouse=a
set wildmenu

" Tabbing preferences
set tabstop=2 " How many spaces to render tabs as
set softtabstop=2 " How many spaces to insert/delete when pressing tab/backspc
set shiftwidth=2 " Automatic indentation width
set expandtab " Always write tabs as spaces
set cinoptions=(0 " Indent to last unclosed parenthesis in previous line
au FileType make setl noexpandtab " Use real tab characters in Makefile

" Enable filetype plugins
syntax on
au BufNewFile,BufRead * syn sync fromstart
filetype plugin on
filetype indent on

" POSIX shell scripts
aug sh
    let g:is_posix = 1
aug END

" TeX files
aug tex
    au FileType tex if ! filereadable('Makefile') | setl makeprg=pdflatex\ -file-line-error\ -interaction=nonstopmode\ % | endif
    au FileType tex if ! filereadable('Makefile') | setl efm=%f:%l:\ %m,%-G%.%# | endif
aug END
aug scheme
    au FileType scheme setl lispwords+=define-macro
    au FileType scheme setl lispwords-=if
    au FileType scheme nn <Tab> ==
    au FileType scheme vn <Tab> =
    au FileType scheme setl inde=lispindent(v:lnum)
    au FileType scheme setl indk+=!<Tab>
    au FileType scheme let &l:makeprg = 'mzscheme -i -l defmacro.ss -e \(load\ \"' . shellescape(escape(expand('%'), '"\')) . '\"\)'
    au FileType scheme setl efm=%C%.%#:%*\\d:%*\\d:%.%#,%E%f:%l:%c:\ %m,%Z>%.%#,%-G%.%#
aug END
aug haskell
    au FileType haskell setl makeprg=ghci\ %
aug END


