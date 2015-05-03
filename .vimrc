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

" Color and syntax highlighting`
syntax enable
colorscheme badwolf
" badwolf options
let g:badwolf_darkgutter = 1 "gutter darker than background
" Make the tab line much lighter than the background.
let g:badwolf_tabline = 3

