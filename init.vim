


" ███    ██ ███████  ██████  ██    ██ ██ ███    ███
" ████   ██ ██      ██    ██ ██    ██ ██ ████  ████
" ██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██
" ██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██
" ██   ████ ███████  ██████    ████   ██ ██      ██



" @(선택) Plug 를 init.vim 으로 연결하기
"------------------------------------------------------
"| :exe 'edit '.stdpath('config').'/init.vim'         |
"------------------------------------------------------

" @(중요) Todo Comment Lua 에러 발생은 ctrl+c 키맵 때문.
" 따라서 아래 코드가 필수다.
inoremap <C-c> <Esc> 


" NOTE: 
" TODO:
" WARNING: 
" FIXME:
" PERF: 
" HACK: 



" ---------------------------------
" |     General Key Settings      |
" --------------------------------- 

" (1) [shift+k]      : pop-up documentation on cursor
" (2) [gd]           : go to function definition
" (3) [:flutter.run] : run app --> https://github.com/iamcco/coc-flutter




" ---------------------------------
" |  Default Settings for NeoVim  |
" --------------------------------- 


set t_u7=
let mapleader = ","      " changing default leader-key <\> to <,>
set encoding=utf-8
set fileencodings=utf-8,cp949 "utf-8이 실패하면, cp949(en)로 인코딩
set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set mouse+=a
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
set t_Co=256 " 숫자 256의 color 표현 (8bit)

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" 구문 강조 사용
if has("syntax")
 syntax on
endif

"  cursor diff in insert mode & normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

nnoremap <leader>q :bp<CR>  	 
nnoremap <leader>w :bn<CR>


"  NOTE: Solution to caplock problem     
"------------------------------------

" For MacOS
" https://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x
" -> use system preference -> turn of CAPSLOCK

" For linux
" https://vim.fandom.com/wiki/Insert-mode_only_Caps_Lock         

" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0





"  NOTE: Plugin Settings for NeoVim      
"-------------------------------------
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes


" Advanced Syntax highlight with tree-sitter parser
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Error Checking Engine
Plug 'vim-syntastic/syntastic' 

" Auto Completion + Error checking (with LSP)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'airblade/vim-gitgutter'   " vim with git status(added, modified, and removed lines)
Plug 'tpope/vim-fugitive'       " vim with git command(e.g., Gdiff)
Plug 'tmsvg/pear-tree'          " 괄호를 자동으로 닫아주는 플러그인

" NerdTree + Tagbar
Plug 'majutsushi/tagbar'        " for ctag view window
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' " nerdtree installation
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Comments
Plug 'preservim/nerdcommenter'  " NERDComment plugin
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

" Information line
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
"Plug 'mengelbrecht/lightline-bufferline'
Plug 'romgrk/barbar.nvim'
Plug 'blueyed/vim-diminactive'

" Color Theme
Plug 'sainnhe/edge'

" Icon Plugins
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'bryanmylee/vim-colorscheme-icons'

" 42 Plugins
Plug '42Paris/42header'

" Flutter
Plug 'dart-lang/dart-vim-plugin'


" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"------------------------------------------------------------------


" NOTE: Theme setting
" ---------------------------------
let g:edge_style = 'aura'
let g:edge_better_performance = 1
colorscheme edge
if (has("termguicolors"))
  set termguicolors
endif


" NOTE: Todo comments setting
" ---------------------------------
lua << EOF
require("todo-comments").setup {
	}
EOF


" NOTE: NERDComment plugin setting
" ---------------------------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" customize keymapping for NerdCommenter
map <Leader>c<space> 	<plug>NERDCommenterToggle
map <Leader>cs 		<plug>NERDCommenterSexy

" Vim indentline
set list lcs=tab:\¦\ 

" for ctags
map <c-]> g<c-]>
set tags=tags;


" NOTE: for NERDTree <F9>
" ---------------------------------
nmap <F9> :NERDTreeToggle<CR>  
let g:NERDTreeWinSize=40
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


" NOTE: for tagbar <F12>
" ---------------------------------
nmap <F10> :TagbarToggle<CR>  
let g:tagbar_width=30  " 태그바 넓이 설정
set laststatus=2 " turn on bottom bar


" NOTE: for diminactive + pear_tree_repeatable_expand
" ---------------------------------
" for blueyed/vim-diminactive 이 플러그인은 현재 커서의 포커스가 있는 창을 표시합니다
let g:diminactive_enable_focus = 1
" pear-tree 자동 괄호 완성 플러그인
let g:pear_tree_repeatable_expand = 0 "오른쪽 제거 기능을 끔"



" NOTE: Airline Config
" ---------------------------------
set noshowmode "vim airline 플러그인에서 모드를 알려주기 때문에 해제합니다.
" vim lightline-bufferline 플러그인용 세팅 (상단 페이지 목록 표시)
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'edge',
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [[ 'exit' ]],
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }
let g:lightline.component_function = { 'lineinfo': 'LightlineLineinfo' }
function! LightlineLineinfo() abort
	if winwidth(0) < 86
		return ''
	endif

	let l:current_line = printf('%-3s', line('.'))
	let l:max_line = printf('%-3s', line('$'))
	let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
	return l:lineinfo
endfunction
let g:lightline.component_function = { 'mode': 'LightlineMode' }
function! LightlineMode() abort
    let ftmap = {
                \ 'coc-explorer': 'EXPLORER',
                \ 'fugitive': 'FUGITIVE'
                \ }
    return get(ftmap, &filetype, lightline#mode())
endfunction
let g:lightline#bufferline#enable_devicons = 1


" NOTE: for Syntastic Error Checking Engine
" ---------------------------------
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
let g:syntastic_c_compiler_options = "-std=gnu99 -Wall -Wextra -Werror"
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 1
let g:syntastic_warning_symbol = '⚠️'
highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap



" NOTE: CoC Autocompletion + explorer Setings.
" ---------------------------------

" If you have dart-vim-plugin install, put this in your vimrc
let g:dart_format_on_save = 1

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-git', 'coc-clangd', 'coc-flutter', 'coc-markdownlint']

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
" TODO: change here!
inoremap <silent><expr> <s-TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
	call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" NOTE:-Tree Sitter Syntax Highlight 
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "lua", "dart", "markdown" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
