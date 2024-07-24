syntax on
scriptencoding utf-8

" C++ Highlight
let g:cpp_simple_highlight = 1

" Relative and absolute numbers
set number relativenumber
autocmd InsertEnter * :setlocal number norelativenumber
autocmd InsertLeave * :setlocal number relativenumber
"autocmd WinEnter * :setlocal number relativenumber
"autocmd WinLeave * :setlocal number norelativenumber

set ruler

" Onedark
let g:onedark_color_overrides = {
\ "comment_grey": {"gui": "#8690a3", "cterm":"243", "cterm16":"0"}
\}
let g:onedark_hide_endofbuffer = 1
"colorscheme onedark

" Error Bells
set noeb vb t_vb=
" Not Vi compatible
set nocompatible
" Tabs
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set smarttab
" Misc
set backspace=indent,eol,start
set nowrap
set smartcase
set incsearch
set hlsearch
set scrolloff=2
set ttimeout
let mapleader = "\<Space>"
set fillchars+=vert:│

" Fast Escape 
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=200
    au InsertEnter * set ttimeoutlen=200
    au InsertLeave * set timeoutlen=1000
    au InsertLeave * set ttimeoutlen=1000
augroup END

" Plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'dkarter/bullets.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'romainl/vim-cool'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'Yohannfra/Vim-Goto-Header'
Plug 'christoomey/vim-tmux-navigator'
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
Plug 'ryanoasis/vim-devicons'
Plug 'madox2/vim-ai', { 'do': './install.sh' }
Plug 'ap/vim-css-color'
call plug#end()


" Prettier Settings
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" NERDTree Settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeWinSize=35
let NERDTreeMinimalUI=1
let g:webdevicons_conceal_nerdtree_brackets=1

let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder glyph flag
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" Basically disable nerdtree markers
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '
let g:DevIconsDefaultFolderOpenSymbol = ' '

set conceallevel=3
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

" Terminal Debugger
set termwinsize=0x75
map <leader>t :rightb vert term<CR>

" Complete Braces
inoremap {<CR> {<CR>}<ESC>ko

" No autocomment
au FileType cpp setlocal comments-=:// comments+=f://

" Change bg to terminal bg
"highlight Normal guibg=none guifg=none ctermbg=none ctermfg=none
"highlight Normal guibg=none ctermbg=none 
"autocmd BufWinEnter * hi StatusLine ctermbg=none

" Markdown 
inoremap **<Space> <Tab>* 
autocmd VimEnter *.md let dontquit = "1"
autocmd BufWinEnter *.md setlocal conceallevel=3
autocmd BufWinEnter *.md setlocal spell spelllang=en_us
autocmd BufWinEnter *.md set fillchars+=vert:\ 
autocmd VimEnter *.md NERDTreeToggle
autocmd BufWinEnter *.md setlocal textwidth=90
autocmd BufWinEnter *.md setlocal tw=89
autocmd BufWinEnter *.md setlocal wrap linebreak
autocmd BufWinEnter *.md setlocal cc=91
autocmd BufWinEnter *.md setlocal scrolloff=10
autocmd BufWinEnter *.md setlocal nolist
"autocmd BufWinEnter *.md highlight ColorColumn ctermbg=240
"autocmd BufWinEnter *.md hi StatusLine ctermbg=none
"hi Visual ctermbg=238
"hi CursorLine ctermbg=238
"hi Terminal ctermbg=none ctermfg=none
"hi StatusLine ctermbg=none
"hi StatusLineTerm ctermbg=none
"hi StatusLineTermNC ctermbg=none
"hi ColorColumn ctermbg=67
"hi VertSplit ctermfg=238
set textwidth=90
set tw=89
set wrap linebreak
syn match markdownListMarker "\%(\t\| \{0,32\}\)[-*+]\%(\s\+\S\)\@=" contained
"autocmd BufWinEnter *.md setlocal ft=markdown
let g:markdown_fenced_languages = ['cpp','sql','vb','javascript','js=javascript','html', 'hs=haskell', 'java=java']

" HTML / Vue Indent
autocmd BufWinEnter *.vue setlocal tabstop=2 
autocmd BufWinEnter *.vue setlocal softtabstop=2
autocmd BufWinEnter *.vue setlocal shiftwidth=2
autocmd BufWinEnter *.html setlocal tabstop=2 
autocmd BufWinEnter *.html setlocal softtabstop=2
autocmd BufWinEnter *.html setlocal shiftwidth=2


" centers the current pane as the middle 2 of 4 imaginary columns
" should be called in a window with a single pane
 function CenterPane()
   lefta vnew
   wincmd w
   exec 'vertical resize '. string(&columns * 0.70)
 endfunction

" optionally map it to a key:
autocmd VimEnter *.md call CenterPane()
nnoremap <leader>x :call CenterPane()<cr>
autocmd bufenter * if (winnr("$") == 1 && (bufnr("[No Name]") > 0) && exists("dontquit") > 0 && (bufname("%") == "")) | q | endif

" Italics
set t_ZH=[3m
set t_ZR=[23m
highlight htmlItalic cterm=italic
highlight markdownItalic cterm=italic

" Highlight Line
highlight LineHighlight ctermbg=darkgray guibg=darkgray
nnoremap <leader>h :call matchadd('LineHighlight', '\%'.line('.').'l')<cr>
nnoremap <leader>H :call clearmatches()<cr>

" Cycle Buffers
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bN<cr>

" Cheat Sheet
command CheatSheet :tabedit ~/Desktop/Misc/Vim/cheatSheet.md

" Indent/Unindent Insert Mode
inoremap <C-h> <C-d>
inoremap <C-l> <C-t>

" Increment Letters
set nrformats+=alpha

" Silent Command
command! -nargs=+ Silent
\   execute 'silent ! <args>'
\ | redraw!

" LaTex
command Latex :Silent pdflatex % && open % -a Preview && open -a Terminal
autocmd VimEnter *.tex setlocal textwidth=0
autocmd VimEnter *.tex setlocal conceallevel=2

" Skeleton Files
autocmd BufNewFile *.cpp 0r ~/skeletons/skeleton.cpp
autocmd BufNewFile *.h 0r ~/skeletons/skeleton.h

set wildmenu
set showcmd

let g:nord_italic = 1
colorscheme nord

" Vertical resize
nnoremap <leader>1 : vertical resize 10<cr>
nnoremap <leader>4 : vertical resize 40<cr>

" GotoHeader
let g:goto_header_associate_cpp_h = 1
nnoremap gh :GotoHeaderSwitch <CR>
nnoremap <F12> :GotoHeader <CR>
imap <F12> <Esc>:GotoHeader <CR>

" Copy and Paste
noremap <leader>y "*y
noremap <leader>p "*p

" AI
let g:vim_ai_complete = {
\  "engine": "chat",
\  "options": {
\    "model": "gpt-4o-mini",
\    "endpoint_url": "https://api.openai.com/v1/chat/completions",
\    "max_tokens": 1000,
\    "temperature": 0.2,
\    "request_timeout": 20,
\    "enable_auth": 1,
\    "selection_boundary": "",
\  },
\  "ui": {
\    "code_syntax_enabled": 1,
\    "populate_options": 0,
\    "open_chat_command": "preset_below",
\    "scratch_buffer_keep_open": 0,
\    "paste_mode": 1,
\  },
\}
let g:vim_ai_token_file_path = '~/.config/openai.token'

" Indent Lines
"exe 'setlocal listchars=tab:\│\ ,multispace:\│' . repeat('\ ', &sw - 1)
set list
autocmd BufWinEnter * exe 'setlocal listchars=tab:\│\ ,multispace:\│' . repeat('\ ', &sw - 1)
