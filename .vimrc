" 基本設定
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set scrolloff=999

" Emacsキーバインド
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-h> <BS>
inoremap <silent> <C-k> <ESC>:EmacsKillCommand<CR>

" <C-k>自作コマンド
command! -nargs=0 EmacsKillCommand call EmacsKillCommand()
function! EmacsKillCommand()
    let s:currentLine = getline('.')
    let s:nextLine = getline(line('.')+1)
    let s:currentCol = col('.')
    let s:endCol = col('$')-1

    if s:currentLine == ""                  " 現在の行が空白か判定
        :normal dd
    else
        if s:currentCol == s:endCol         " カーソルが最終位置かどうか判定
            if s:nextLine == ""
                :normal J
            else
                :normal Jh
            endif
        elseif s:currentCol == 1            " 行の頭か判定
            normal D
        else
            :normal lD
        endif
    endif
endfunction

" 見た目系
set number
set cursorline
set virtualedit=onemore
set smartindent
" set laststatus=2
set wildmode=list:longest
syntax enable
set ruler
set statusline=\ %F%m%=%l/%L\ 

" Tab系
set expandtab
set tabstop=2
set shiftwidth=2

" 検索系
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
