
"  8b       d8  88  88,dPYba,,adPYba,     8b,dPPYba,   ,adPPYba, 
"  `8b     d8'  88  88P'   '88"    '8a    88P'   'Y8  a8"     '" 
"   `8b   d8'   88  88      88      88    88          8b         
"    `8b,d8'    88  88      88      88    88          "8a,   ,aa 
"      '8"      88  88      88      88    88           `"Ybbd8"' 

"                        slick's x220 vimrc

set t_Co=8
set clipboard+=unnamed

" general
set nocompatible
set encoding=utf-8

" syntax
filetype indent plugin on
syntax enable

" swap & sessions
set hidden
set noswapfile

" case insensitive search
set ignorecase
set smartcase
set infercase

" better search
set hlsearch
set incsearch

" backspace
set backspace=2

" tab indent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" indent
set autoindent
set wrap
set linebreak
set breakindent

" ui
set noruler
set number
set relativenumber
set background=dark
hi LineNr ctermfg=DarkGrey
hi CursorLineNr ctermfg=yellow

" keybinds
map <C-P> :set nonumber norelativenumber<CR>
map <C-O> :set number relativenumber<CR>
function! StatuslineToggle()
    if &laststatus == 0
        set laststatus=2
    else
        set laststatus=0
    endif
endfunction
map <C-B> :call StatuslineToggle()<CR>

" statusline
function! ActiveStatus()
  let statusline=""
  let statusline.="%1* file "
  let statusline.="%2* %f "
  let statusline.="%3*"
  let statusline.="%{&modified?'\ \+':''}"
  let statusline.="%{&readonly?'\ \-':''}"
  let statusline.="%="
  let statusline.="%2* %l of %L "
  let statusline.="%1* line "
  return statusline
endfunction

function! InactiveStatus()
  let statusline=""
  let statusline.="%1* file "
  let statusline.="%2* %f "
  let statusline.="%3*"
  let statusline.="%{&modified?'\ \+':''}"
  let statusline.="%{&readonly?'\ \-':''}"
  let statusline.="%="
  let statusline.="%2* %l of %L "
  let statusline.="%1* line "
  return statusline
endfunction

set laststatus=2
set statusline=%!ActiveStatus()
hi User1 ctermbg=6 ctermfg=0
hi User2 ctermbg=3 ctermfg=0
hi User3 ctermbg=0 ctermfg=7

set shortmess=F
