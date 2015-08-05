execute pathogen#infect()
set enc=utf-8
set number " show line number
set hlsearch " highlight matches
set incsearch " search as chars are entered
set showmatch "highlight matching [{()}]
set cursorline " highlights current line
set ruler       " show cursor position in status bar
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set textwidth=80 " wrap at 80 characters
set shiftwidth=79 " lines longer than 79 columns will be broken
set expandtab " tabs are spaces
set autoindent " align the new line indent with the prev line
set shiftround " round indent to multiple of 'shiftwidth'
set backspace=indent,eol,start
set scrolloff=10 " scroll the window so we can alyways see ten lines around cursor
set laststatus=2 " always show status line  
" autosave
autocmd BufLeave,CursorHold,CursorHoldI,FocusLost * silent! wa

" trim whitespace on save
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

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

"---------------Appearance
if has('gui_running')
    set background=light
else
    set background=dark
endif

set t_Co=256

if has('gui_gnome')
    set guifont=Ubuntu\ Mono 9.4
endif

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
