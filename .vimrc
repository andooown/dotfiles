" ------------------------------
" Plugins
" ------------------------------
call plug#begin('~/.vim/plugged')
  " vim-airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

" ------------------------------
" Config
" ------------------------------

set fenc=utf-8
" バックアップ/スワップを作らない
set nobackup
set noswapfile
" 編集中のファイルが変更されたら自動で再読み込み
set autoread
" バッファが編集中でも他のファイルを開けるように
set hidden
" コマンドをステータスに表示
set showcmd

set number
" 現在の行/列を強調
set cursorline
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" オートインデント
set autoindent
set smartindent
" タブを半角スペースに
set expandtab
" インデントの量
set tabstop=2
set shiftwidth=2
" 不可視文字の可視化
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
" 対応するカッコを表示
set showmatch
" ステータスを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動
nnoremap j gj
nnoremap k gk
" シンタックスハイライト
syntax on

" 検索文字列が小文字の場合は大文字小文字区別なく検索
set ignorecase
" 検索文字列に大文字が含まれる場合は区別して検索
set smartcase
" インクリメンタルサーチ
set incsearch
" 最後まで検索したら最初に戻る
set wrapscan
" ハイライト
set hlsearch
" ESC 連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

