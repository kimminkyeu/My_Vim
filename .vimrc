"
"
" -------------------------------------------------------------------------
"	MY KEYMAP SETTING 
"
"	<F3>	: toggle paste mode
"   <F10>	: toggle NERDTRee
"   <F11>	: linux full screenmode
"   <F12>	: toggle Tagbar
"   
"
" -------------------------------------------------------------------------
"
"한글 세팅"
set encoding=utf-8
set fileencodings=utf-8,cp949 "utf-8이 실패하면, cp949(en)로 인코딩

set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비

set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set autoindent " 자동 들여쓰기
set cindent " C언어 자동 들여쓰기
set smartindent "스마트한 들여쓰기

set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
set visualbell " 키 잘못 누르면 화면 프레시

set clipboard=unnamed " this sets default paste buffer to X's clipboard
set pastetoggle=<F3>  " 복사 붙여넣기 모드 Toogle = <F3> --> 복붙시 계단현상 방지

set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set softtabstop=4
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch " 점진적 검색
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" 구문 강조 사용
if has("syntax")
 syntax on
endif

" Vundle Plugin Setting starts here
" ----------------------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin' " nerdtree installation
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter' " vim with git status(added, modified, and removed lines)
Plugin 'tpope/vim-fugitive' " vim with git command(e.g., Gdiff)
Plugin 'vim-airline/vim-airline' " vim status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'blueyed/vim-diminactive'

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
" ---------------------------------------------------------------------------------------------

set t_Co=256 " 숫자 256의 color 표현 (8bit)

" for jellybeans
colorscheme jellybeans

" for ctags
map <c-]> g<c-]>
set tags=tags;

" for NERDTree
nmap <F10> :NERDTreeToggle<CR>  
let g:NERDTreeWinSize=30 

" for taglist <F12>
nmap <F12> :TagbarToggle<CR>  
let g:tagbar_width=30  " 태그바 넓이 설정

" for indent guide 이 플러그인은 들여쓰기 세로줄을 만들어줍니다.
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" for vim-airline 이 플러그인은 창 상단과 하단에 정보들을 표시해줍니다
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

" for blueyed/vim-diminactive 이 플러그인은 현재 커서의 포커스가 있는 창을
" 표시합니다
let g:diminactive_enable_focus = 1













