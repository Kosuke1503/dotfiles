" leader key setting
let mapleader = "\<space>"

set number
set guifont=DroidSansMono\ Nerd\ Font\ 13
set guifontwide=DroidSansMono\ Nerd\ Font\ 13
set hlsearch
set laststatus=2
set wildmenu
set ruler
set history=1000 
set encoding=utf8
" mouse setting
set mouse-=a
" yank clipboad
set clipboard=unnamed
syntax enable

" indent setting https://qiita.com/locona_0810/items/5644af52da2469adce1a
set autoindent          "改行時に前の行のインデントを計測
set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する 
set cindent             "Cプログラムファイルの自動インデントを始める
set smarttab            "新しい行を作った時に高度な自動インデントを行う
set expandtab           "タブ入力を複数の空白に置き換える 

set tabstop=2           "タブを含むファイルを開いた際, タブを何文字の空白に変換するか
set shiftwidth=2        "自動インデントで入る空白数
set softtabstop=0       "キーボードから入るタブの数
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtabの略
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vim         setlocal sw=2 sts=2 ts=2 et
endif

" PLUGIN SETTINGS
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline' " バーをかっこよくする
Plug 'vim-airline/vim-airline-themes' " airlineの設定のために必要
Plug 'tpope/vim-commentary' " gccコマンドでコメントアウト
Plug 'neoclide/coc.nvim', {'branch': 'release'} " vim/neovimをvscode風にする
Plug 'preservim/nerdtree' " vim内からファルダやファイルを開ける
Plug 'ryanoasis/vim-devicons' " アイコンを追加してかっこよくする
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' } " pythonのシンタクスハイライト
Plug 'tomasr/molokai' " カラースキーム
Plug 'cocopon/iceberg.vim'
Plug 'cohama/lexima.vim'
Plug 'gkeep/iceberg-dark'
call plug#end()

" NERDTree SETTINGS
nmap <C-f> :NERDTreeToggle<CR>
" can see dotfile 
let NERDTreeShowHidden=1
let g:airline#extensions#tabline#enabled = 1
" airlineにicebergのテーマを適応する
let g:airline_theme='tomorrow'
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab


" Airline SETTINGS
let g:airline_powerline_fonts = 1

" Esc SETTINGS
nnoremap L $
nnoremap H ^
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap gl gt
nnoremap gh gT
nnoremap J 10<Down>
nnoremap K 10<Up>
nnoremap U <C-r>
inoremap jj <Esc>

" /// Enable Netrw (default file browser)
" filetype plugin on
" /// Netrw SETTINGS
" let g:netwr_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_winsize = 30
" let g:netrw_sizestyle = "H"
" let g:netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
" let g:netrw_preview = 1

" lexima.vim setting
let g:lexima_enable_newline_rules=1

"/// SPLIT BORDER SETTINGS
hi VertSplit cterm=none

" setting python PATH
let g:python3_host_prog='/Users/tamashirokousuke/miniconda3/envs/pynvim/bin/python'

" molokai setting
syntax enable
autocmd ColorScheme * highlight lineNr ctermfg=244
colorscheme iceberg
set background=dark
set t_Co=256


"" coc.nvim
""" <Tab>で候補をナビゲート
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
""" <Tab>で次、<S+Tab>で前
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" 折返しを無くす
set nowrap
