set ttyfast
set ttymouse=xterm2
set ttyscroll=3
set autoread
set autowrite
set backspace=indent,eol,start
set incsearch
set hlsearch
set showcmd
set hidden
set ignorecase
set smartcase
set completeopt=menu,menuone
set pumheight=5 
set paste
set expandtab
set textwidth=0
set ruler
set wildmenu
set foldlevel=0
set nocursorcolumn
set nocursorline
set fileformats=unix,mac,dos
set splitright
set splitbelow
set noswapfile
set nobackup
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set fileencoding=utf-8
set encoding=utf-8
" colorscheme wombat256mod
colorscheme wombat
syntax on


" vundle start

set nocompatible              " be iMproved, required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" python-mode
Plugin 'python-mode/python-mode', { 'branch': 'develop' }
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_python = 'python3'
let g:pymode_syntax_space_errors = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_indent = 1
let g:pymode_options_colorcolumn = 0

let g:pymode_lint = 0
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_rope = 1
let g:pymode_rope_goto_definition_bind = '<leader>d'
let g:pymode_rope_regenerate_on_write = 1

"let g:pymode_rope_goto_definition_cmd = 'new'
"let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'

let g:pymode_motion = 1
"
augroup unset_folding_in_insert_mode
    autocmd!
    autocmd InsertEnter *.py setlocal foldmethod=marker
    autocmd InsertLeave *.py setlocal foldmethod=expr
augroup END
"
" vim-go
Plugin 'fatih/vim-go'
let g:go_test_timeout = '0s'
" let g:go_list_type = "quickfix"
" let g:go_fmt_autosave = 1
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
"
" tagbar
Plugin 'https://github.com/majutsushi/tagbar.git'
" let g:tagbar_ctags_bin='/home/user_name/Documents/linux/TAGS'
" let g:tagbar_width=30
" let g:tagbar_left=1
" lightline
set laststatus=2
if !has('gui_running')
	set t_Co=256
endif
set noshowmatch
set noshowmode
Plugin 'https://github.com/itchyny/lightline.vim.git'
"
" nerdtree
Plugin 'https://github.com/scrooloose/nerdtree.git'
"
" youcompleteme
" Plugin 'Valloric/YouCompleteMe'
" let g:ycm_server_python_interpreter = '/usr/bin/python2'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" vundule end
"

" global setting
let mapleader = ","

" cscope setting
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

" ctags setting
set tags=./tags,tags;

nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" key mapping
nmap <F6> :TagbarToggle<CR>
nmap <F5> :NERDTreeToggle<CR>
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
map <leader>n :cnext<CR>
map <leader>m :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" autocmd
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
" autocmd FileType go nmap <leader>b  <Plug>(go-build)
" autocmd FileType go nmap <leader>t  <Plug>(go-test)
" autocmd FileType go nmap <leader>r  <Plug>(go-run)
" autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
" autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
