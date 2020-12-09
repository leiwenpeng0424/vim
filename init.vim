" Vim-plug Configurations
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
" THEME
Plug 'morhetz/gruvbox'
Plug 'kien/rainbow_parentheses.vim'
" Seamless navigation between tmux panes and vim splits
Plug 'tyru/open-browser.vim'
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 代码补全功能
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'rust-lang/rust.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
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

let NERDTreeIgnore=['node_modules','.vscode','.idea']  

autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree " 进入vim打开NerdTree

" nerdtree 的快捷键配置
map <C-b> :NERDTreeToggle<CR> 
map <F8> :TagbarToggle<CR>
map <S-A>f :Pre<CR>
" ========= NERDTree config end =============

" rust 保存自动格式化
let g:rustfmt_autosave=1

" ========= FZF config start start ==

" 快捷键 查找文件 fzf
noremap <C-p> :FZF --layout=reverse --ansi<CR>
" fzf 针对查找文件打开方式的快捷键配置
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-o': 'vsplit' }
" ========= FZF config start start =========

" 一些vim的基础配置
set number
set cursorline
set mouse=a
nnoremap ; :
colorscheme gruvbox
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

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
command! -nargs=0 Prettier :CocCommand prettier.formatFile " 格式化单个文件
command! -nargs=0 JestCurrent :call CocAction('runCommand', 'jest.fileTest', ['%']) " 执行当前激活的测试用例文件
command! JestInit :call CocAction('runCommand', 'jest.init') " Jest初始化
