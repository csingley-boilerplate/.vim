" BASIC CONFIGS
set nocompatible " Don't bother being backwards-compatible with vi
set modelines=0 " Avoids some security exploits
set encoding=utf-8
" set mouse=a     " We generally work in X session
set history=100 " Store this much command line history
set clipboard=unnamedplus " Use the X clipboard as a cut/paste register
set backspace=indent,eol,start " backspace over everything in insert mode
set autochdir " Working directory is always the same as buffer being edited
filetype plugin on " Load filetype plugins


" BACKUP / SWAP / UNDO
" Don't clutter working directory with backup files
set nobackup
set nowritebackup
set noswapfile


" TEXT WRAPPING
set wrap " Word wrap
set colorcolumn=80 " Visual indicator of standard 80-col max width
set formatoptions=q
set formatoptions+=r
set formatoptions+=n
set formatoptions+=1


" TABS AND INDENTATION
filetype indent on " Load filetype indentation rules
set autoindent " Have indentation level of new lines match previous indent

set tabstop=8       " Number of columns that a <Tab> in the file counts for.

set softtabstop=4   " Replace <Tab> with this number of spaces
 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.

" KEYMAPPING
" Make j & k (up & down) work as you expect, 
" i.e. move relative to screen not file
nnoremap j gj
nnoremap k gk

" Use semicolon for command mode (no need to press Shift key)
map ; :

" Use , instead of \ for leader commands
let mapleader=","

" vim bootcamp - disable arrow keys to force habit of using hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" SEARCH & REPLACE
" Always use 'very magic' (i.e Python/Perl-like) regexes
nnoremap / /\v
vnoremap / /\v

set ignorecase " Ignore case in searches
set smartcase  " Override 'ignorecase' if search pattern contains uppercase
set incsearch  " Immediately highlight matching patterns as they're typed
set hlsearch   " Also switch on highlighting the last used search pattern.
set gdefault   " Make substitutions global by default


" INSERT COMPLETION
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

set wildmenu " Show menu of possible file/command completions
set wildmode=list:longest " Autocomplete up to point of ambiguity
"set completeopt=menuone,longest,preview

" UI
colorscheme zenburn
"set guifont=Terminus\ 9
"set guifont=Source\ Sans\ 12
set guifont=Inconsolata\ 11
set guioptions-=tT " Don't want toolbar or tearoff menus
set guioptions-=r " Don't want right scrollbar
set shortmess+=I " Don't show intro splash screen
set ruler		" show the cursor position all the time
set relativenumber " Line number column displays relative distance
set showmode  " Show mode (INSERT, VISUAL, etc.) in status bar
set showcmd		" Display incomplete commands
set cursorline " Highlight the line the cursor's on
set visualbell " Flash invert screen colors instead of beeping
set scrolloff=3 " Min # lines context to show above/below cursor
set ttyfast

" PROGRAMMING
syntax on " Switch syntax highlighting on.
set showmatch " Show matching brackets (),{},[]
set mat=5 " Show matching brackets for 0.5 seconds
set foldmethod=indent " Code folding
set foldlevel=99 " Code folding

" Show trailing characters and undesirable spaces
set list
set listchars=tab:▸\ ,trail:·,nbsp:~

" Remove trailing spaces when save buffer
autocmd BufWritePre * :%s/\s\+$//e

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" PLUGINS
" Pathogen helps manage plugins
call pathogen#infect()

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" NERDTree - file system browser
"map <F2> :NERDTreeToggle<CR>

" TagList - source code browser
"map <F3> :TlistToggle<CR>
"let g:Tlist_Use_Right_Window = 1 " Open taglist on right (NERDTree opens  left)
"let g:Tlist_GainFocus_On_ToggleOpen = 1 " Focus on the taglist when it's toggled
"let g:Tlist_Exit_OnlyWindow = 1 " Exit Vim if only the taglist is open
"let g:Tlist_Use_SingleClick = 1 " Accept single mouse click to select

" ViM Trinity - combines NERDTree, TagList, and srcexpl to make an IDE
nmap <F8> :TrinityToggleAll<CR>

" Plugins installed that don't need config
" NERDCommenter - manage comments in source code
" Markdown
" VIM Color Sampler Pack - zenburn beeyotch
" SnipMate - tab-completed code templates
