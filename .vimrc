execute pathogen#infect()
set number " show line number
set hlsearch " highlight matches
set incsearch " search as chars are entered
set showmatch "highlight matching [{()}]
set cursorline " highlights current line
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=79 " lines longer than 79 columns will be broken
set expandtab " tabs are spaces
set autoindent " align the new line indent with the prev line
set shiftround " round indent to multiple of 'shiftwidth'

"escape from insert mode jk or ii
imap jk <ESC>
imap ii <ESC>

let mapleader=","
" <leader> c redraws scrren & removes search highlighting
nnoremap <leader>c :nohl<CR><C-l>
"open explorer with ;;
nnoremap <silent>;; :Ex<CR>
"split and edit .vimrc
nnoremap <leader>ev :split $MYVIMRC<CR>
"source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
"swap curr char w/ next one without changing cursor position
nnoremap <silent> gc xph
"swap current word w/ next(push word right) cursor stays '*works across \n
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
"push word left, cursor stays on word
nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><C-l>
"push word right, cursor stays on word
nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><C-l>
" add columns at 80 
let &colorcolumn=join(range(81,999),",")
" column at 80 and 120
" let &colorcolumn="80,".join(range(120,999),",")
" highlight ColorColumn ctermbg=235 guibg=#909090
" Color and syntax highlighting`
syntax enable
set background=dark
colorscheme badwolf
" badwolf options
let g:badwolf_darkgutter = 1 "gutter darker than background
" Make the tab line much lighter than the background.

"indent lines
set ts=4 sw=4 et
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
