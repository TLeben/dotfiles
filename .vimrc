filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

set encoding=utf-8
set number " show line number
set hlsearch " highlight matches
set incsearch " search as chars are entered
set showmatch "highlight matching [{()}]
set cursorline " highlights current line
set ruler       " show cursor position in status bar
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set textwidth=80 " wrap at 80 characters
set shiftwidth=4 " lines longer than 79 columns will be broken
set expandtab " tabs are spaces
set autoindent " align the new line indent with the prev line
set shiftround " round indent to multiple of 'shiftwidth'
set backspace=indent,eol,start
set scrolloff=10 " scroll the window so we can alyways see ten lines around cursor
set laststatus=2 " always show status line  
set viminfo='100,f1
set clipboard=unnamed

" autosave
" autocmd BufLeave,CursorHold,CursorHoldI,FocusLost * silent! wa

" trim whitespace on save
" autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
autocmd BufWritePre *.(py|go) :%s/\s\+$//e

" convert tabs to spaces on save
" autocmd BufWritePre *.py retab!

" toggle relative & absolute lineno
function! LinenoToggle()
    if(&relativenumber == 'relativenumber')
        set relativenumber
    else
        set norelativenumber
    endif
endfunc


"<F2> toggle paste & nopaste
set pastetoggle=<F2>

"F5 key to toggle bg light/dark 
call togglebg#map("<F5>")

"escape from insert mode jk or jj 
imap jk <ESC>
imap jj <ESC>

" tmux-navigation
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" python-mode -----------------------------------------------------------------
" ...options
let g:pymode=1
let g:pymode_options=1
let g:pymode_indent=1
let g:pymode_folding=1
let g:pymode_motion=1
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=0
let g:pymode_syntax_slow_sync=1

let g:pymode_rope=0
let g:pymode_lint=0
let g:pymode_lint_on_write=0
let g:pymode_lint_checkers=['pyflakes', 'pep8']
let g:pymode_lint_ignore="E501"
" ...pymode key mapping
" nnoremap <silent><F6> :PymodeLint<CR> 
" nnoremap <silent><F7> :PymodeLintAuto<CR> 
" nnoremap <silent><F8> :PymodeLintToggle<CR>

" vim-go ----------------------------------------------------------------------
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_operators=1
let g:go_highlight_function_calls=1

" nerdTree --------------------------------------------------------------------
"open nerdtree if vim is started with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if nerdTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" powerline -------------------------------------------------------------------
"
let g:Powerline_symbols='fancy'

" easymotion -------------------------------------------------------------------
"
"map <leader>
let g:Powerline_symbols='fancy'


" ----------custom key mappings, leader = , ** comma
let mapleader=","
" ,c -- redraws scrren & removes search highlighting
nnoremap <leader>c :nohl<CR><C-l>
",ev --  split and edit .vimrc
nnoremap <leader>ev :split $MYVIMRC<CR>
" ,sv -- source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
" ,j -- format JSON
map <leader>j :%!python -m json.tool<CR>
" ;; -- open NERDTree explorer with ;;
nnoremap <silent>;; :NERDTreeToggle<CR>
" ,n -- toggle relative & absolute lineno
nnoremap <leader>n :call LinenoToggle()<cr>

"---------------Appearance
if has('gui_running')
    set background=light
else
    set background=dark
endif

set t_Co=256

set guifont=Monaco\ Pro\ for\ Powerline

" solarized tweeks, ignored if not using colorscheme
let g:solarized_termtrans=1
let g:solarized_termcolors=16

" Color and syntax highlighting
syntax enable
for scheme in [ 'solarized', 'molokai' ]
    try
        execute 'colorscheme '.scheme
        break
    catch
        continue
    endtry
endfor

" add columns at 80 
highlight ColorColumn ctermbg=235
if exists('+colorcolumn')
    let &colorcolumn="80,".join(range(120,500),",")
else "vim < 7.3
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

" badwolf options
"let g:badwolf_darkgutter = 1 "gutter darker than background
" Make the tab line much lighter than the background.

"indent lines
set ts=4 sw=4 et
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
