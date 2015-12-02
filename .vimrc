set nocompatible
let mapleader=","
set backspace=2
set fileencodings=utf-8,cp1251,latin1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase
set laststatus=2
set autowrite
set list listchars=tab:»·,trail:·,extends:>,precedes:<
set guioptions-=T
set smarttab
set number
set autoindent
set modeline
nnoremap <leader><leader> <c-^>
colorscheme my_railscasts
set cursorline

augroup vimrc_autocmds
au!
    autocmd BufRead * highlight ColorColumn ctermbg=235 guibg=#262626
    autocmd BufRead * let &colorcolumn=join(range(79,200),",")
"    autocmd BufRead * match Error /\%81v.*/
augroup END

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.emblem set filetype=slim
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" hi CursorLine   cterm=NONE ctermbg=black guibg=black
" set showmatch
" set nowrap
" autocmd FileType ruby,eruby,yaml,slim,haml set ai sw=2 sts=2 et
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Snippets are activated by Shift+Tab
" let g:snippetsEmu_key = "<S-Tab>"

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
" let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
" map <Leader>ct :!ctags -R .<CR>

" Cucumber navigation commands
"  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
"  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

" vim-rspec mappings
" nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
" nnoremap <Leader>s :call RunNearestSpec()<CR>
" nnoremap <Leader>l :call RunLastSpec()<CR>syntastic

if executable('ag')
" Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:airline_theme='light'
let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=0
" configure syntastic syntax checking to check on open as well as save
" let g:syntastic_check_on_open=1
let g:airline_enable_bufferline=1
let g:airline_enable_ctrlp=1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '◀'
let g:airline_linecolumn_prefix = '␤ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline#extensions#tabline#enabled = 1

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/rubycomplete.vim'
Bundle 'vim-scripts/sudo.vim'
Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
let g:tagbar_left = 1
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
Bundle 'danro/rename.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'slim-template/vim-slim'
Bundle 'vim-scripts/toggle_words.vim'
Bundle 'jelera/vim-javascript-syntax'
" Bundle 'digitaltoad/vim-jade'
" Bundle 'gorodinskiy/vim-coloresque'

nmap <leader>t :ToggleWord<CR>
let g:toggle_words_dict = {'ruby': [['if', 'unless'], ['else', 'elsif']]}
" Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
" Bundle 'kchmck/vim-coffee-script'
" Bundle 'thoughtbot/vim-rspec'
" Bundle 'tpope/vim-bundler'
" Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'

" easymotion
Bundle 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap <leader>s <Plug>(easymotion-s)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)




filetype plugin indent on
syntax enable

nmap <leader>l :nohls<CR>

fu! Amap(key, cmd, ...)
let l:cr="<CR>"
let l:p=":"
if (a:0 > 0) && (a:1 == 0)
let l:cr=""
let l:p=""
endif
exe "nmap <" . a:key . "> " . l:p . a:cmd . l:cr
exe "vmap <" . a:key . "> <ESC><" . a:key . ">gv"
exe "imap <" . a:key . "> <c-o><" . a:key . ">"
endf

call Amap("F3", "NERDTreeToggle")
call Amap("F7", "TagbarToggle")
call Amap("C-n", "tabnew")
call Amap("F4", "close")
call Amap("F5", "!ruby -c %")

" Navigat%e by tabs with Shift+Left/Right
call Amap("S-Left", "tabprev")
call Amap("S-Right", "tabnext")

" Navigate by windows with Ctrl+direction
call Amap("C-Left", "<C-W>h", 0)
call Amap("C-Down", "<C-W>j", 0)
call Amap("C-Up", "<C-W>k", 0)
call Amap("C-Right", "<C-W>l", 0)

" Map ctrl-movement keys to window switching
call Amap("C-k", "<C-w><Up>", 0)
call Amap("C-j", "<C-w><Down>", 0)
call Amap("C-l", "<C-w><Right>", 0)
call Amap("C-h", "<C-w><Left>", 0)

" Switch between buffers
call Amap("C-Tab", ":bnext<cr>", 0)
call Amap("C-S-Tab", ":bprevious<cr>", 0)

" Resize windows with Alt+direction
call Amap("M-Left", "vertical resize -1")
call Amap("M-Down", "resize +1")
call Amap("M-Up", "resize -1")
call Amap("M-Right", "vertical resize +1")

" Move windows with Ctrl+Shift+direction
call Amap("C-S-Left", "<C-W>H", 0)
call Amap("C-S-Down", "<C-W>J", 0)
call Amap("C-S-Up", "<C-W>K", 0)
call Amap("C-S-Right", "<C-W>L", 0)

" Working with system clipboard
" vmap zy "+y
" vmap zp "+p
" vmap zP "+P
" vmap zx "+x
"
" nmap zy "+y
" nmap zp "+p
" nmap zP "+P
" nmap zx "+x
"
" command WQ wq
" command Wq wq
" command W w
" command Q q
" command Qa qa
" command QA qa

" Split windows with Ctrl+Alt+Down/Right
" call Amap("C-M-Down", "split")
" call Amap("C-M-Right", "vsplit")

