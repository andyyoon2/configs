set nocompatible

" https://github.com/vscode-neovim/vscode-neovim/issues/415#issuecomment-715533865
function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'unblevable/quick-scope'
Plug 'ggandor/leap.nvim'
Plug 'ap/vim-buftabline'

" themes
Plug 'sainnhe/everforest'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'

call plug#end()
"Plug 'easymotion/vim-easymotion'
"Plug 'justinmk/vim-sneak'


" plugin inits
lua require('leap').add_default_mappings()


" defaults
" https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84

" indentation
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent

" settings
syntax on
set incsearch
set hlsearch
set showmatch
set ignorecase

" remaps
let mapleader = " "

" Auto-hybrid numbers https://jeffkreeftmeijer.com/vim-number/
:set number

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END


" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

let g:Lf_ShortcutF = "<leader>ff"

" easymotion
"map <Leader> <Plug>(easymotion-prefix)


" firenvim
let g:firenvim_config = {
      \ 'globalSettings': {},
      \ 'localSettings': {}
\ }
let fc = g:firenvim_config['localSettings']
let fc['.*'] = { 'selector': 'textarea' }
", input[type="text"]


" quickscope
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END


" everforest
"if has('termguicolors')
""  set termguicolors " doesn't work with Terminal.app
"endif
"set background=light
let g:everforest_better_performance = 1
let g:everforest_enable_italic = 1
let g:everforest_dim_inactive_windows = 1
colorscheme everforest

" onedark
"let g:onedark_terminal_italics = 1
"colorscheme onedark

" seoul
"colo seoul256
"set background=light

"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
