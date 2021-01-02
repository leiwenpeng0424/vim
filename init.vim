" plug-vim configurations
call plug#begin('~/.vim/plugged')
" -------------------------------------------------------------------------
" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } | 
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
" Vastly improved Javascript indentation and syntax support in Vim.
Plug 'pangloss/vim-javascript'
" React JSX syntax highlighting and indenting for vim.
Plug 'mxw/vim-jsx'
" Generate JSDoc to your JavaScript code.
Plug 'heavenshell/vim-jsdoc'
" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" Typescript syntax files for Vim
Plug 'leafgarland/typescript-vim'
" A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote conc
Plug 'elzr/vim-json'
" CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
Plug 'hail2u/vim-css3-syntax'
" Vim syntax file for scss (Sassy CSS)
Plug 'cakebaker/scss-syntax.vim'
" A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
Plug 'joshdick/onedark.vim'
" Improved nginx vim plug (incl. syntax highlighting)
Plug 'chr4/nginx.vim'
" 对括号们进行染色处理
Plug 'kien/rainbow_parentheses.vim'
" Seamless navigation between tmux panes and vim splits
Plug 'tyru/open-browser.vim'
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 代码补全功能
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" tagbar 你懂的, T-A-G
Plug 'majutsushi/tagbar'
" 多选, 使用方式就是按住 Ctrl 然后按上下来选.
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" rust 语言支持
Plug 'rust-lang/rust.vim'
" statusbar ,下面的那个
Plug 'vim-airline/vim-airline-themes'
" .editorconfig支持
Plug 'editorconfig/editorconfig-vim'
Plug 'yggdroot/indentline'
Plug 'craigemery/vim-autotag'
" 添加头部的注释
Plug 'ahonn/vim-fileheader'
" JsDoc
Plug 'heavenshell/vim-jsdoc'
" The Nerd Commenter
Plug 'scrooloose/nerdcommenter'
" A simple alignment operator for Vim text editor
Plug 'tommcdo/vim-lion'
" 主题们
Plug 'branwright1/salvation-vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
" -------------------------------------------------------------------------
" Initialize plug system

call plug#end()

let g:airline_theme='kolor'

" ========= NERDTree config start ===========
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=25
let g:NERDTreeDirArrowExpandable=''
let g:NERDTreeDirArrowCollapsible=''
let g:NERDTreeGitStatusUseNerdFonts=1

let NERDTreeIgnore=['node_modules','.vscode','.idea', '.git']  

autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree

map <C-b> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
map <S-A>f :Pre<CR>
" ========= NERDTree config end =============

let g:rustfmt_autosave=1

" ========= FZF config start start ==

noremap <C-p> :FZF<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-o': 'vsplit' }

" ========= FZF config start start =========

set number
set cursorline
set mouse=a
nnoremap ; :
colorscheme ayu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set cursorline
" 打开true color
set termguicolors
set nowrap
set nolinebreak

" 设置通过 快捷键来切换tab.
function! TabPos_ActivateBuffer(num)
     let  s:count = a:num
     exe  "tabfirst"
     exe  "tabnext"  s:count
endfunction
function! TabPos_Initialize()  
    for  i  in  range(1, 9)
        exe  "map <M-"  . i .  "> :call TabPos_ActivateBuffer(" . i .  ")<CR>"
    endfor
    exe  "map <M-0> :call TabPos_ActivateBuffer(10)<CR>"
endfunction
autocmd vimenter * call TabPos_Initialize()

" commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 JestCurrent :call CocAction('runCommand', 'jest.fileTest', ['%'])
command! JestInit :call CocAction('runCommand', 'jest.init')

noremap <F5> :JestCurrent<CR>
noremap <C-s> <Esc> :w<CR>
noremap <C-s-a> <Esc> :wa<CR>
noremap w <C-w>
