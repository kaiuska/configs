
call plug#begin('~/.vim/plugged')

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-clangx'           " c/cpp completion
Plug 'landaire/deoplete-d'              " dlang completion
Plug 'deoplete-plugins/deoplete-jedi'   " python completion

" User interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'      " highlight color codes (ex. #ff0f0f)
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'             " syntax highlighting for everything
Plug 'preservim/tagbar'
Plug 'editorconfig/editorconfig-vim'

" Colorschemes
Plug 'severij/vadelma'
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()


"""""""""""""""""""""""""""" PLUGIN SETTINGS """"""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Deoplete Settings
let g:deoplete#sources#d#dcd_client_binary = '/usr/bin/dcd-client'
let g:deoplete#sources#d#dcd_server_binary = '/usr/bin/dcd-server'
let g:deoplete#sources#d#dcd_server_autostart = 1
let g:deoplete#enable_at_startup = 1


" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_theme='ayu_mirage'
let g:airline#extensions#tabline#enabled = 1


""""""""""""""""""""""""""""""" SETTINGS """"""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors
" setup autocmds to highlight every filetype
lua require'colorizer'.setup()

" numbered lines relative to cursor
set number relativenumber " nu rnu for short
" show position inside file
set ruler 

set noerrorbells
set visualbell
set t_vb=

" allow wildcards in menu
set wildmenu
" ignore case when searching
set ignorecase
" highlight matching braces, quotes, etc.
set showmatch

"set nowrap
"set linebreak
"set breakindent
"set textwidth=80

" set tab and indentation behavior
set tabstop=4           " number of spaces per tab
set softtabstop=4       " how far to move curser on tab press
set shiftwidth=4        " how far to indent new lines

set expandtab           " turn tabs into spaces
set nosmarttab
set smartindent
set autoindent

set list

" automatically update files that have been changed by another application
set autoread

" highlight line containing cursor
set cursorline

colorscheme vadelma

set background=dark

filetype plugin indent on 
syntax on

" Allow transparent background
hi Normal ctermbg=NONE guibg=NONE

" Show comments in italics
hi Comment cterm=italic




""""""""""""""""""""""""""""" KEYBINDINGS  """""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" switch number from relative to normal
nnoremap <A-n> <Cmd>call ToggleNumber()<CR>

" Tagbar
nnoremap <c-T> <Cmd>TagbarToggle<CR>

"auto close brackets, parenthesis, quotes etc.
inoremap (<CR> ()
inoremap [<CR> []
inoremap "<CR> ""
inoremap '<CR> ''
inoremap {<CR> {<CR>}<ESC>O


" hotkeys for manipulating tabs
nnoremap tn :tabnew<Space>
nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>


" hotkeys for scrolling horizontally
nnoremap zl 20zl
nnoremap zh 20zh

"FORMATTING NOTE: the command 'gq' applies formatting to the selected text.
"'gqip' formats the inner paragraph. 'gwip' is better because it keeps the
"cursor in the same place

" this causes vim to automatically apply formatting when the paragraph is
" changed. Equivalent to calling gwip 

" TODO: lines that begin with '\' in latex files should not trigger automatic
" formatting


"""""""""""""""""""""""""""""" FUNCTIONS  """""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! g:ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
