" Use vim defalts instead of 100% vi compatibility
set nocompatible
" more powerfull backspacing
set backspace=indent,eol,start

" Now we set some defauls for the editor
set textwidth=0   " Don't wrap words by default
set nobackup      " Don't keep a backup file
set history=100   " Keep 100 lines ofcommand line history
set ruler         " Show the cusor position all the time

syntax on

" ○とかの幅への対応
set ambiwidth=double

"set t_Co=256
:colorscheme jellybeans

set nowrap

" 文字コードの設定
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

" タブ幅の設定
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set modelines=0

" ビジュアルエラーフラッシュとエラービープ音を無効にする
set visualbell t_vb=
" インデントはスマートインデント
set smartindent
" 検索文字列が小文字の場合は大文字小文字を区別な区検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" タブの左側にカーソルを表示しない
set nolist
" 入力中のコマンドをステータスに表示する
set showcmd
" 括弧入力時の対応する各個を表示
set showmatch
" 検索文字列のハイライトを有功にする
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" ツールバーを表示しない
set go-=T
" ステータスラインを常に表示
set laststatus=2

filetype on
filetype indent on
filetype plugin on

:noremap <C-left> :bprev<CR>
:noremap <C-right> :bnext<CR>

" 大文字Oで空行を挿入する
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

"**********
" vundle
"**********
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'scrooloose/nerdcommenter'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-ft-svn_diff'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'h1mesuke/vim-alignta'
Bundle 'nanotech/jellybeans.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'sudo.vim'
Bundle 'Align'

filetype plugin indent on

"**********
" quickrun
"**********
let g:quickrun_config = {}
"let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '-c'}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': "-c -l {line('.')}"}
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END


"**********
" matchit.vim
"**********
source $VIMRUNTIME/macros/matchit.vim

"**********
" neocomplcache
"**********
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"**********
" Unite.vim
"**********
" 起動時にインサートモード
let g:unite_enable_start_insert = 1
" 縦分割で開く
let g:unite_enable_split_vertically = 1
" ウィンドウを横分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" 横幅50で開く
"let g:unite_winwidth = 50

nnoremap <silent> <Leader>f :<C-u>Unite file<CR>
nnoremap <silent> <Leader>b :<C-u>Unite buffer<CR>

"**********
" vim-powerline
"**********
let g:Powerline_symbols = 'fancy'
