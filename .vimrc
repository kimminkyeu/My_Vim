" Waning!!! if you are using 42 Cluster Mac, unset line:256 option !!
"
" -----------------------------------------------------------
"
"	 nerdtree 에서  vertical split	 = [s]
"					horizontal split = [i]
"
"    ctrl + wf	: 사용하고 있는 헤더 파일 열기 
"    ctrl + ]	: 해당 함수 정의 파일로 이동 (ctags -R 로 생성이 되어있어야함)
"    ctrl + t   : 함수 정의 들어간 후 다시 돌아오기 
"
"   ,c<space>	: toggle NERDComment									  
"   ,cs		: NERDSexyComment									  
"
"	<F3>	: toggle paste mode											  
"
"	<,q>    : nerdtree + air-line -> open prev file						  
"	<,w>    : nerdtree + air-line -> open next file						  
"	
"	<F8>    : toggle Error messege window(syntatic)
"
"   <F9>	: toogle nerdtree (left window) 
"						# to represh nerdtree, press <r>
"
"   <F10>	: toggle tagbar (right window)
"
"   <F11>	: linux full screenmode										  
"																		  
"   <tab>   : youcompleteme auto complete selection						  
" -----------------------------------------------------------
"
set t_u7=
" set t_RV=
let mapleader = ","			 " changing default leader-key <\> to <,>
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
set mouse=a
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set autoindent " 자동 들여쓰기
set cindent " C언어 자동 들여쓰기
set smartindent "스마트한 들여쓰기

set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
set visualbell " 키 잘못 누르면 화면 프레시

set clipboard=unnamed " if LINUX, use unamedplus. (else use unamed) this sets default paste buffer to X's clipboard
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
set nocompatible				 " be iMproved, required
filetype off					 " required
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()



Plugin 'valloric/youcompleteme'  " A Code-completion engine
				" TODO: installation may require ycm. please check
				" [YouCompleteMe] github page for further information.

Plugin 'vim-syntastic/syntastic' " Error Checking Engine

Plugin 'sheerun/vim-polyglot'    " Syntax Highlite pack

Plugin 'preservim/nerdcommenter' " NERDComment plugin

Plugin 'gmarik/Vundle.vim'

" Plugin 'nanotech/jellybeans.vim' "color theme
" Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'

Plugin 'majutsushi/tagbar'       " for ctag view window

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin' " nerdtree installation

Plugin '42Paris/42header'			 " 42 header plugin

"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine' " 사용해보니 이게 더 나음

Plugin 'airblade/vim-gitgutter' " vim with git status(added, modified, and removed lines)

Plugin 'tpope/vim-fugitive' " vim with git command(e.g., Gdiff)

" air line 대신에 light line이 더 좋아보여서 이거 씀!
Plugin 'itchyny/lightline.vim'

" lightline에 더해서 상단에 연 페이지 목록 보여주는 플러그인
Plugin 'mengelbrecht/lightline-bufferline'

" Nerdtree 로고 표시용 플러그인
Plugin 'ryanoasis/vim-devicons'
Plugin 'bryanmylee/vim-colorscheme-icons'

Plugin 'blueyed/vim-diminactive'

Plugin 'tmsvg/pear-tree' " 괄호를 자동으로 닫아주는 플러그인

Plugin 'shirk/vim-gas'  "Assembly language syntax highlite Plugin

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

" ------------------------------------------
" 테마 설정은 여기서!

colorscheme onedark
if (has("termguicolors"))
  set termguicolors
endif
" autocmd vimenter * ++nested colorscheme onedark
" highlight clear SpellBad
" highlight SpellBad cterm=underline ctermfg=red ctermbg=NONE guifg=#ff0000 guibg=#ffff00

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
" ------------------------------------------

" Vim indentline
set list lcs=tab:\¦\ 

" for ctags
map <c-]> g<c-]>
set tags=tags;

" for NERDTree
nmap <F9> :NERDTreeToggle<CR>  
let g:NERDTreeWinSize=30 

" for taglist <F12>
nmap <F10> :TagbarToggle<CR>  
let g:tagbar_width=30  " 태그바 넓이 설정
set laststatus=2 " turn on bottom bar

nnoremap <leader>q :bp<CR>  	 
nnoremap <leader>w :bn<CR>

"+ 다른 플러그인에서 변경하기 때문에, 제일 하단에 아래 모드안보이기 세팅을 해줘야 한다.
set noshowmode "vim airline 플러그인에서 모드를 알려주기 때문에 해제합니다.

" for blueyed/vim-diminactive 이 플러그인은 현재 커서의 포커스가 있는 창을 표시합니다
let g:diminactive_enable_focus = 1

" pear-tree 자동 괄호 완성 플러그인
let g:pear_tree_repeatable_expand = 0 "오른쪽 제거 기능을 끔"

" NERDComment plugin setting
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"
" customize keymapping for NerdCommenter
map <Leader>c<space> 	<plug>NERDCommenterToggle
map <Leader>cs 		<plug>NERDCommenterSexy



" for Syntastic Error Checking Engine
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Werror"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Werror"
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 1
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap


" for YouCompleteMe Auto Completion 
set completeopt-=preview   " unset preview window
" YCM 과 syntastic 을 모두 사용할 경우 loc window 가 안켜지는 문제가 있다.
" 따라서 하단의 옵션을 넣어주면 둘다 잘 작동함. 
let g:ycm_show_diagnostics_ui = 0
" autocompletion 사용 시 tab키를 제외하기 위함
let g:ycm_key_list_select_completion = ['<S-Tab>' , '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

" vim lightline-bufferline 플러그인용 세팅 (상단 페이지 목록 표시)
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }


" ------------------------------ 
"  cursor diff in insert mode & normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


" ------------------------------ 
" solution to caplock problem
" ------------------------------ 
"
" ----- for macOS --------------------
"  https://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x
" -> use system preference -> turn of CAPSLOCK

" ----- for linux ---------------------
" https://vim.fandom.com/wiki/Insert-mode_only_Caps_Lock
"
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0
" ------------------------------ 


