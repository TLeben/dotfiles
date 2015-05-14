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

let mapleader=","
" <leader> c redraws scrren & removes search highlighting
nnoremap <leader>c :nohl<CR><C-l>

" add columns at 80 
let &colorcolumn=join(range(81,999),",")
" column at 80 and 120
" let &colorcolumn="80,".join(range(120,999),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27
" Color and syntax highlighting`
syntax enable
set background=dark
colorscheme badwolf
" badwolf options
let g:badwolf_darkgutter = 1 "gutter darker than background
" Make the tab line much lighter than the background.

"indent lines
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
