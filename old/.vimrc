"woo's vimrc
set ai
set tabstop=2
set shiftwidth=2
set nu
set syntax=on
set hls
filetype on
set novisualbell    " 不闪烁  
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set cursorline              " 突出显示当前行"

hi CursorLine   cterm=NONE ctermbg=black ctermfg=lightgray guibg=black guifg=gray 
set noeb " 去掉输入错误的提示声音
filetype plugin indent on "打开文件类型检测, 加了这句才可以用智能补全

"光标颜色
au InsertEnter * hi Cursor guibg=green 
set gcr=a:block-blinkon0

"折叠行
hi Folded	ctermfg=darkblue ctermbg=NONE
hi FoldColumn	ctermfg=darkgrey ctermbg=NONE
set viewdir=$HOME/.vim/view 
set foldmethod=marker
set fcs=vert:\|
"set fcs=vert:\|,fold:_ "折叠字符

"
"加载matchit插件
set nocompatible
filetype plugin on
runtime macros/matchit.vim
"加载结束
set cindent
set ruler

call pathogen#infect()

"matchit
let b:match_words='\<begin\>:\<end\>' 
execute pathogen#infect()
	syntax on
	filetype plugin indent on
let g:winManagerWindowLayout='FileExplorer|TagList'
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1

"colorscheme set
syntax on
"set t_Co=256
"set background=dark
"colorscheme solarized
"colorschem end

"comment map
map \\h <ESC>I<!--<ESC>A --><ESC>:w<CR>
map \\c <ESC>I/*  <ESC>A  */<ESC>:w<CR>
map \\j <ESC>O/*<ESC>}o*/<ESC>:w<CR>
map \\\ <ESC>^xxxx<ESC>$xxxx<ESC>:w<CR>

"WinManager plugin
map \wm <ESC>:WMToggle<CR>

"windows size adjust
nmap w= :resize +3<CR>
nmap w- :resize -3<CR>
nmap w, :vertical resize -3<CR>
nmap w. :vertical resize +3<CR>
nmap w6 :vertical resize 60<CR>

"windows position adjust
nmap ww <C-W>w
nmap wx <C-W>x

nmap wh <C-W>h
nmap wl <C-W>l
nmap wj <C-W>j
nmap wk <C-W>k

nmap wH <C-W>H
nmap wL <C-W>L
nmap wJ <C-W>J
nmap wK <C-W>K

inoremap <C-K> <C-X><C-K>

inoremap jj <ESC>:w<CR>
inoremap $ $('')<ESC>hi
inoremap \{ <CR>{<CR>}<ESC>O
inoremap \F function ()<CR>{<CR>}<ESC>bbi
inoremap \f function()<CR>{<CR>}<ESC>O

"Emmet setting
"let g:user_emmet_expandabbr_key = '<Tab>'


"字典设置
set dictionary-=~/.vim/awoo.txt dictionary+=~/.vim/awoo.txt
set complete-=k complete+=k
"set iskeyword+=(,)
"set iskeyword+=.
"set iskeyword+=({})

inoremap <tab> <c-r>=Smart_TabComplete()<CR>
function! Smart_TabComplete()
	let line = getline('.')                         " current line

	let substr = strpart(line, -1, col('.')+1)      " from the start of the current
	" line to one character right
	" of the cursor
	let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
	if (strlen(substr)==0)                          " nothing to match on empty string
		return "\<tab>"
	endif
	let has_period = match(substr, '\.') != -1      " position of period, if any
	let has_slash = match(substr, '\/') != -1       " position of slash, if any
	if (!has_period && !has_slash)
		return "\<C-X>\<C-P>"                         " existing text matching
	elseif ( has_slash )
		return "\<C-X>\<C-F>"                         " file matching
	else
		return "\<C-X>\<C-O>"                         " plugin matching
	endif
endfunction

