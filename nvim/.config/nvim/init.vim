set nocompatible

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set termguicolors

call plug#begin(stdpath('data') . '/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'preservim/tagbar'
" Always load the vim-devicons at the very last one
Plug 'ryanoasis/vim-devicons'
" Initialize plugin system
call plug#end()
 
syntax enable
set backspace=indent,eol,start
let mapleader=','
set number
set noerrorbells visualbell t_vb=

"----------Theme----------
let g:airline_theme='dracula'
let g:dracula_colorterm = 0
let g:dracula_italic = 0
colorscheme dracula 

set hlsearch
set incsearch

"-------------Split Management--------------"
set splitbelow
set splitright

" Permet de bascules entre plusieurs panneau
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

nmap <silent> <C-S-Left> :vertical resize -1<CR>
nmap <silent> <C-S-Right> :vertical resize +1<CR>
nmap <silent> <C-S-Up> :resize +1<CR>
nmap <silent> <C-S-Down> :resize -1<CR>

" Permet de changer d'onglet
map <C-t><Up> :tabr<cr>
map <C-t><Down> :tabl<cr>
map <C-t><Left> :tabp<cr>
map <C-T><Right> :tabn<cr>

" Déplace le curseur en fin de ligne
nmap m $

"----------Coc Explorer----------
nmap <F3> :CocCommand explorer<CR>

"----------tagbar----------
nmap <F8> :TagbarToggle<CR>

"---------CtrlP-----------
set wildignore+=*/tmp/*,*/vendor/*,*.so,*.swp,*.zip

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()


"Add simple highlight removal.
" Supprime le highlight
nmap <Leader><space> :nohlsearch<cr>

"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>

"We want to use Ag for the search.
set grepprg=ag

"----------Language----------
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Ouvre le fichier de configuration .nvimrc
nmap <Leader>ev :tabedit ~/.config/nvim/init.vim<CR>

augroup autosourcing
  autocmd!
  autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END
