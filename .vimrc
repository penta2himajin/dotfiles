"#####表示設定#####
set number "行番号を表示
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け


"#####インデント設定#####
set tabstop=4 "画面上でタブが占める幅
set shiftwidth=4 "自動インデントでずれる幅
set autoindent "改行時に前行のインデントの継続


"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索
set smartcase "検索文字列に大文字が含まれている場合は区別して検索
set wrapscan "検索時に最後まで行ったら最初に戻る


"#####キーマッピング#####
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><Tab><S-o>
inoremap ( ()<Left>
inoremap < <><Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap <silent><C-n> <ESC>
inoremap <silent><C-c> <ESC>:w<CR>i<Right>
inoremap <silent><C-u> <ESC>ui<Right>
inoremap <silent><C-r> <ESC><C-r>i<Right>
nnoremap <silent>w :w<CR>
nnoremap <silent><C-i> i
nnoremap r <C-r>
nnoremap <silent><C-v> <ESC>:vsplit<CR>
nnoremap <silent><C-b> <ESC>:split<CR>
nnoremap <silent><C-w> <C-w><C-w>
nnoremap <silent><C-k> <C-w>+
nnoremap <silent><C-j> <C-w>-
nnoremap <silent><C-l> <C-w>>
nnoremap <silent><C-h> <C-w><
nnoremap <silent><S-k> <C-w>K
nnoremap <silent><S-j> <C-w>J
nnoremap <silent><S-l> <C-w>L
nnoremap <silent><S-h> <C-w>H
nnoremap <silent>s :ter ++close<CR>
nnoremap <silent><S-r> :source ~/.vimrc<CR>
nnoremap <silent><S-v> :o ~/.vimrc<CR>
nnoremap <silent><C-t> :tabnew<CR>
nnoremap <silent><C-Left> gt
nnoremap <silent><C-Right> gT
nnoremap <silent>q :q<CR>


"#####実行設定#####
command! Run call s:Run()
nmap <F5> :Run<CR><CR>
function! s:Run()
	let e = expand("%:e")
	if e == "c"
		:Gcc
	endif
	if e == "cpp"
		:Gpp
	endif
	if e == "rs"
		:Rustc
	endif
	if e == "py"
		:Python
	endif
endfunction

command! Python call s:Python()
function! s:Python()
	:!python %
endfunction

command! Gcc call s:Gcc()
function! s:Gcc()
	if has("win32") || has("win64")
		:!gcc % -o %:r.exe
		:!%.\:r.exe
	else
		:!gcc % -o %:r
		:!./%:r
	endif
endfunction

command! Gpp call s:Gpp()
function! s:Gpp()
	if has("win32") || has("win64")
		:!g++ % -o %:r.exe
		:!.\%:r.exe
	else
		:!g++ % -o %:r
		:!./%:r
	endif
endfunction

command! Rustc call s:Rustc()
function! s:Rustc()
	:!rustc %
	if has("win32") || has("win64")
		:!.\%:r.exe
	else
		:!./%:r
	endif
endfunction
