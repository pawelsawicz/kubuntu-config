set number

syntax on
filetype on
filetype plugin indent on

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/idris-hackers/idris-vim.git', { 'for': 'idris' }

Plug 'https://github.com/machakann/vim-swap.git'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
"Plug 'https://github.com/Shougo/deol.nvim'

Plug 'Shougo/vimshell.vim'
Plug 'vim-syntastic/syntastic'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'stephpy/vim-yaml'

" NERD Tree settings
autocmd StdinReadPre * let s:std_in=1

" Save session on quitting Vim
autocmd VimLeave * NERDTreeClose
" autocmd VimLeave * call SaveSess()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
" " Restore session on starting Vim
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" saving session
function SaveSess()
	execute 'mksession!' . getcwd() . '/session.vim'
endfunction

let g:idris_indent_let = 4
let g:idris_indent_where = 6
let g:idris_indent_do = 3
let g:idris_indent_rewrite = 8
let g:idris_conceal = 1

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_idris_checkers = ['idris']

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
