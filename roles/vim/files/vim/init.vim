" keymappings
let mapleader=","

set path+=**
set wildmenu

" Bundle
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'sukima/xmledit'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'chriskempson/base16-vim'
Plug 'derekwyatt/vim-scala'
Plug 'andys8/vim-elm-syntax'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Lokaltog/vim-easymotion'
Plug 'lervag/vimtex'
call plug#end()

" coc - language server support
set updatetime=500
inoremap <silent><expr> <c-space> coc#refresh()
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-f> :FZF<CR>
nnoremap <leader><leader> <c-^>

" Navigating with guides
inoremap <Space><Tab> <Esc>/<<++>><Enter>"_c6l
vnoremap <Space><Tab> <Esc>/<<++>><Enter>"_c6l
map <Space><Tab> <Esc>/<<++>><Enter>"_c6l

" default settings
set nofoldenable
set hidden  "switch buffer without saving
set shell=bash
set nobackup
set nowritebackup
set noerrorbells

set nocompatible
set encoding=utf-8
set ffs=unix,dos,mac
set colorcolumn=0

" filetype settings
filetype on
filetype indent on
filetype plugin on

" look and feel
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let airline#extensions#coc#enabled = 1

set t_Co=256
set laststatus=2
syntax on
set nowrap

set ruler

set number relativenumber
set t_Co=256
colorscheme wombat256mod

" Clipboard
set clipboard=unnamedplus
vnoremap <C-c> "+y
map <C-p> "+P

"vnoremap <C-c> "*Y :let @+=@*<CR>
"map <C-p> "+P

" spaces
set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

" searching
set showmatch
set ignorecase
set smartcase
set hlsearch

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

autocmd FileType json syntax match Comment +\/\/.\+$+

"""LATEX
autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><<++>><Enter><Enter>\end{frame}<Enter><Enter><<++>><Esc>6kf}i
autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><<++>><Esc>3kA
autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><<++>><Esc>3kA
autocmd FileType tex inoremap ,em \emph{}<<++>><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<<++>><Esc>T{i
autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ,it \textit{}<<++>><Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{}<<++>><Esc>T{i
autocmd FileType tex inoremap ,cp \parencite{}<<++>><Esc>T{i
autocmd FileType tex inoremap ,glos {\gll<Space><<++>><Space>\\<Enter><<++>><Space>\\<Enter>\trans{``<<++>>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><<++>><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><<++>><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>
autocmd FileType tex inoremap ,ref \ref{}<Space><<++>><Esc>T{i
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><<++>><Enter>\end{tabular}<Enter><Enter><<++>><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<<++>>}<Tab>\const{<<++>>}<Tab><<++>><Enter><<++>><Enter>\end{tableau}<Enter><Enter><<++>><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ,can \cand{}<Tab><<++>><Esc>T{i
autocmd FileType tex inoremap ,con \const{}<Tab><<++>><Esc>T{i
autocmd FileType tex inoremap ,v \vio{}<Tab><<++>><Esc>T{i
autocmd FileType tex inoremap ,a \href{}{<<++>>}<Space><<++>><Esc>2T{i
autocmd FileType tex inoremap ,sc \textsc{}<Space><<++>><Esc>T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><<++>><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><<++>><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><<++>><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><<++>><Esc>2kf}i
autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><<++>><Enter>\end{DELRN}<Enter><Enter><<++>><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,tt \texttt{}<Space><<++>><Esc>T{i
autocmd FileType tex inoremap ,bt {\blindtext}
autocmd FileType tex inoremap ,nu $\varnothing$
autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><<++>><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ,rn (\ref{})<<++>><Esc>F}i
