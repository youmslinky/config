"###################################################################
"################ youmslinky custom vimrc ##########################
"###################################################################

"set leader to ','
"this is set early so all commands follow it
let mapleader=","

"###################################################################
"######################### plugins #################################
"###################################################################

"Install vim-plug if not already installed
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins will be downloaded under the specified directory.
call plug#begin()

" Declare the list of plugins.
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-dirvish'
Plug 'simnalamburt/vim-mundo'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale'
Plug 'vim-python/python-syntax'
Plug 'reedes/vim-pencil'
Plug 'kana/vim-textobj-user'
"numeral textobjects 2.2 3e6 etc
Plug 'tkhren/vim-textobj-numeral'
Plug 'dhruvasagar/vim-dotoo'
Plug 'AndrewRadev/linediff.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug '~/.fzf'
Plug 'rickhowe/diffchar.vim'
Plug 'roxma/vim-tmux-clipboard'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"enable all vim-python syntax highlighting
let g:python_highlight_all = 1

"overide unimpaired plugin next tag, prev tag
nnoremap ]t :tabnext<cr>
nnoremap [t :tabprevious<cr>

"enable sneak label mode
let g:sneak#label = 1

"vim sneak use smartcase
let g:sneak#use_ic_scs = 1

"map ,, to do default ',' behaviour (also fixes f behaviour)
map ,, <Plug>Sneak_,
"
"toggle mundo
nnoremap <leader>M :MundoToggle<cr>

"##################
"End plugin options
"##################

"set colorscheme
colo slate

" based on example vimrc from: http://vim.wikia.com/wiki/Example_vimrc
"
"-----------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

"ignore case with completion
set wildignorecase

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Move cursor and highlight matches while searching
set incsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Status Line (curly braces just denote all status line commands) {
        set laststatus=2                             " always show statusbar
        set statusline=
        set statusline+=%-10.3n\                     " buffer number
        set statusline+=%f\                          " filename
        set statusline+=%h%m%r%w                     " status flags
        set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
        set statusline+=%=                           " right align remainder
        set statusline+=0x%-8B                       " character value
        set statusline+=%-14(%l,%c%V%)               " line, character
        set statusline+=%<%P                         " file position
"}

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Set paranthenisis hightlight cursor
hi MatchParen cterm=none ctermbg=blue ctermfg=none

" Change the cursor color in xterm
" if &term =~ "xterm\\|rxvt"
"     "use an orange cursor in insert mode
"     let &t_SI = "\<Esc>]12;orange\x7"
"     " use a red cursor otherwise
"     let &t_EI = "\<Esc>]12;red\x7"
"     silent !echo -ne "\033]12;red\007"
"     " reset cursor when vim exits
"     autocmd VimLeave * silent !echo -ne "\033]112\007"
"     " use \003]12;gray\007 for gnome-terminal
"endif

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=4
"set softtabstop=4
"set expandtab
"
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=4
set tabstop=4
"
"
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
"
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-/> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-/> :nohl<CR><C-L>
nnoremap <leader>/ :nohl<CR><C-L>

"------------------------------------------------------------

"jdk stuff 2018/9/5
"
"

if has("win32")
  "Windows only options here
  "source a windows only file
  "opens the directory of current file
  nnoremap <leader>x :!explorer %:h<cr><cr>
else
  if has("unix")
    let s:uname = system("uname")
  endif
endif

"split like any other program
set splitright splitbelow

"navigate between window split panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
"conflicts with <C-L> for normal :noh shortcut
map <C-l> <C-W>l

"kludge fix for terminal split navigating
tnoremap <c-w>j <c-w>j

"use alt+hjkl to resize windows
nnoremap <M-j> <C-w>-
nnoremap <M-k> <C-w>+
nnoremap <M-h> <C-w><
nnoremap <M-l> <C-w>>

"esc from insert mode with jk
inoremap jk <Esc>

"automatically use relative line numbers when in command mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

"quick save file
nnoremap <leader>w :w<cr>

"quick quit file
nnoremap <leader>q :q<cr>

"edit vimrc
nnoremap <leader>ev :sp $MYVIMRC<cr>

"reload vimrc
nnoremap <leader>rv :so $MYVIMRC<cr>

"reload vimrc when writing
autocmd BufWritePost *vimrc :so $MYVIMRC

"find something in ATL files recursively in current directory
nnoremap <f5> :exec 'vimgrep /'.input('grep what? ').'/ ./**/*.ATL <bar> cw'<cr>
nnoremap <leader>ga :exec 'vimgrep /'.input('grep what? ').'/ ./**/*.ATL <bar> cw'<cr>

"yank entire word under cursor to clipboard
"map <C-C> "+yiW

"find what is on windows clipboard
"nnoremap <C-X> /<c-r>+<cr>

"change working directory to the one the open file is in
nnoremap <silent> <leader>cd :lcd %:p:h<cr>

"create folders if they don't exist when writing file
au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')

" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-
set listchars=eol:¶,tab:>-,trail:.,extends:>,precedes:<,nbsp:_

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
:nnoremap <silent> <leader>f :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"toggle locking cursor in middle of screen
nnoremap <silent> <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <silent> <Leader>hh :let &sidescrolloff=999-&sidescrolloff<CR>

"lock cursor in middle of screen by default
set scrolloff=999

"make horizontal scrolling offset more bearable
set sidescrolloff=30

"make vim not correct windows/dos eof ^Z character
set nofixendofline

"make it easier to enter ex commands
"nnoremap ; :
nnoremap <space> :
vnoremap <space> :

"goes to next id in atlas code
"pattern is taken from atlas.vim file for id number
"TODO put these in a file only sourced when .ATL is opened
nnoremap <leader>. /^[BE ][ 0-9]\{,6}\><cr>:noh<cr>
nnoremap <leader>m ?^[BE ][ 0-9]\{,6}\><cr>:noh<cr>

"goes to next testid = ... statement
"uses search() to avoid polluting search history and not overwriting current search
nnoremap <silent> <leader>. :call search("testid = ",'W')<cr>
nnoremap <silent> <leader>m :call search("testid = ",'Wb')<cr>

"switch (y) option (o) fixed (turns on scrollbind)
nnoremap <silent> yof :set scrollbind!<cr>

"close buffer without closing window
nnoremap <silent> Q :bp<bar>bd #<cr>

" Displays buffer list, prompts for buffer numbers and ranges and deletes
" associated buffers. Example input: 2 5,9 12
" Hit Enter alone to exit.
function! InteractiveBufDelete()
    let l:prompt = "Specify buffers to delete: "

    ls | let bufnums = input(l:prompt)
    while strlen(bufnums)
        echo "\n"
        let buflist = split(bufnums)
        for bufitem in buflist
            if match(bufitem, '^\d\+,\d\+$') >= 0
                exec ':' . bufitem . 'bd'
            elseif match(bufitem, '^\d\+$') >= 0
                exec ':bd ' . bufitem
            else
                echohl ErrorMsg | echo 'Not a number or range: ' . bufitem | echohl None
            endif
        endfor
        ls | let bufnums = input(l:prompt)
    endwhile

endfunction

"map above function
nnoremap <silent> <leader>bd :call InteractiveBufDelete()<CR>

"select buffer to switch to
nnoremap <leader>l :ls<cr>:b<space>

"copy and paste to system clipboard
"nnoremap <c-c> "+y
"disabled because ^c needed to interupt long running commands
"nnoremap <c-p> "+P

"escape from terminal
tnoremap jk <c-\><c-n>

"insert date in format: 'Feb 7, 2019'
nnoremap <silent> <leader>d :put =strftime('%b %d, %Y')<cr>kJ
"insert full datetime
nnoremap <silent> <leader>d :put =strftime('%a %x %X')<cr>


"stop running process and run last command in a vim terminal
nnoremap <leader>j :call term_sendkeys(2,"\<c-c>\<up>\<cr>")<cr>
nnoremap <leader>p :call term_sendkeys(2,"ll")<cr>

"retart report-bot in terminal window above
nmap <leader>rb <c-k><c-c>python report-bot.py<c-m><c-w>j

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
" put undo files in .vim folder
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" make command
nnoremap <leader>m :!make<cr>

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

function! s:DiffWithSVNCheckedOut()
  let filetype=&ft
  diffthis
  vnew | exe "%!svn cat " . expand("#:p")
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSVN call s:DiffWithSVNCheckedOut()
