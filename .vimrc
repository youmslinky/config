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
if ! filereadable(expand('~/.vim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
Plug 'tpope/vim-obsession'

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
"Plug 'tkhren/vim-textobj-numeral'
Plug 'AndrewRadev/linediff.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug '~/.fzf'
Plug 'rickhowe/diffchar.vim'
Plug 'rust-lang/rust.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/tagbar'
"Plug 'stevearc/vim-arduino'
"Plug 'MattesGroeger/vim-bookmarks'

" ultisnips engine
"Plug 'SirVer/ultisnips'
" Snippets are separated from the engine.
"Plug 'honza/vim-snippets'

Plug 'andymass/vim-visput'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-h>"
"let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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
colo murphy

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
        set statusline+=%-10.3n\                             " buffer number
        set statusline+=%f\                                  " filename
        set statusline+=%h%m%r%w                             " status flags
        set statusline+=\[%{strlen(&ft)?&ft:'none'}]\        " file type
        set statusline+=%{tagbar#currenttag('%s\ ','','f')}  " current tag (provided by tagbar plugin)
        set statusline+=%=                                   " right align remainder
        set statusline+=0x%-8B                               " character value
        set statusline+=%-14(%l,%c%V%)                       " line, character
        set statusline+=%<%P                                 " file position
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
hi MatchParen cterm=none ctermbg=Green ctermfg=none

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

"Mon 12/14/20 11:41:35
" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

if &term =~ '^xterm'
	" normal mode
	let &t_EI .= "\<Esc>[0 q"
	" insert mode
	let &t_SI .= "\<Esc>[6 q"
endif

" enable local .vimrc and .exrc (in vim); .nvimrc and .exrc (in neovim?)
set exrc

" disable autocmnd, shell, and write commands in local .nvimrc, .exrc, .vimrc for security
set secure

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
nnoremap <silent> <C-/> :nohl<CR><C-L>
nnoremap <silent> <leader>/ :nohl<CR><C-L>

"------------------------------------------------------------

"jdk stuff 2018/9/5
"
"

if has("win32")
  "Windows only options here
  "source a windows only file
  "opens the directory of current file
  nnoremap <leader>x :!explorer %:h<cr><cr>
  noremap <silent> <leader>n :e ~/notes.txt <bar> norm G <CR>

else
  if has("unix")
    " Are we running in WSL?
    let s:uname = substitute(system('uname'),'\n','','')
    if s:uname == 'Linux'
        let s:lines = readfile("/proc/version")
        if s:lines[0] =~ "Microsoft"
          let s:wsl = 1
        endif
    endif
    noremap <silent> <leader>n :e /mnt/c/Users/Jonathan.kuhn/notes.txt <bar> norm G <CR>
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
"autocmd BufWritePost *vimrc :so $MYVIMRC

" Reloads vimrc after saving it but keep cursor position
if !exists('*ReloadVimrcFunction')
    function! ReloadVimrcFunction()
        let save_cursor = getcurpos()
        source $MYVIMRC | windo redraw
        call setpos('.', save_cursor)
        echom "Reloaded $MYVIMRC"
    endfunction
endif
command! -nargs=0 ReloadVimrc :call ReloadVimrcFunction()

"use an augroup so the autocomand isn't loaded multiple times
augroup Reload
    autocmd!
    autocmd BufWritePost *vimrc call ReloadVimrcFunction()
augroup END

"find something in .c and .h files
nnoremap <f5> :exec 'vimgrep /'.input('grep what? ').'/ ./**/*.ATL <bar> cw'<cr>
nnoremap <leader>ga :exec 'vimgrep /' . input('grep what? ') . '/ ./**/*.{c,h} <bar> cw' <cr>

"find something in .c and .h files gf =>grep find
nnoremap ,gf :exec 'vimgrep '.expand('<cword>').' ./**/*.{c,h,cpp,ino} <bar> copen'<cr>

"find something with ripgrep
nnoremap ,rg :Rg<cr>

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
nnoremap <silent> <leader>f :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

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
nnoremap <silent><leader>. /^[BE ][ 0-9]\{,6}\><cr>:noh<cr>
nnoremap <silent><leader>m ?^[BE ][ 0-9]\{,6}\><cr>:noh<cr>

"goes to next testid = ... statement
"uses search() to avoid polluting search history and not overwriting current search
"nnoremap <silent> <leader>. :call search("testid = ",'W')<cr>
"nnoremap <silent> <leader>m :call search("testid = ",'Wb')<cr>

"switch (y) option (o) fixed (turns on scrollbind)
nnoremap yof :set scrollbind!<cr>

"switch clipboard between "" and unnamedplus
nnoremap yoy :set clipboard=<c-r>=&clipboard == "" ? "unnamedplus" : ""<cr><cr>

" WSL yank support
if exists("s:wsl")
    let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup END
    endif
endif

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

autocmd VimLeave * call system('echo -n ' . shellescape(getreg('+')) .
            \ ' | xclip -selection clipboard')

"escape from terminal
tnoremap jk <c-\><c-n>

"insert full datetime
nnoremap <silent> <leader>d o<esc>:put =strftime('%a %x %X')<cr>o
"insert timestamp
nnoremap <silent> <leader>a o<esc>:put =strftime('%X')<cr>o


"stop running process and run last command in a vim terminal
" nnoremap <leader>j :call term_sendkeys(2,"\<c-c>\<up>\<cr>")<cr>
" nnoremap <leader>p :call term_sendkeys(2,"ll")<cr>

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
"nnoremap <leader>m :!make<cr>

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

"set search color to be better for regolith luke smith st
hi Search ctermbg=LightYellow
hi Search ctermfg=DarkBlue

"simple vim session managment
"https://dockyard.com/blog/2018/06/01/simple-vim-session-management-part-2
"I didn't use the tabline stuff because I don't normally have a tabline
let g:session_dir = '~/vim-sessions'
"session save ss
exec 'nnoremap <Leader>ss :Obsession ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
"session restore sr
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'
"session pause sp
nnoremap <Leader>sp :Obsession<CR>

"temporary testid highlighting
match CursorLineNr /\v(SetTestID.*\()@<=\d+/

"cancel and escape from command line with jk
cmap jk <c-u><esc>

abbr nasa NASA
" Search for selected text, forwards or backwards.
" taken from vim wiki
vnoremap <silent> * :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
            \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
            \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" make todos more visible (only uppercase)
match Todo /TODO/
match TODO /TODO/

nnoremap yot :set tabstop=<c-r>=&tabstop == "4" ? "8" : "4"<cr><cr>

" function for doing weekly status
function! WeeklyStatus()
    vnew
    let l:dayOfWeek = strftime("%w") "monday is 1, wednesday is 3
    let l:seconds = (l:dayOfWeek-1)*24*60*60 "convert to seconds, as localtime() gives unix epoch
    let l:subject = strftime("Status report for week starting %a %B %d, %Y", localtime() - l:seconds)
    put =l:subject
    norm kddo
    norm o
endfunction
nnoremap <silent> <leader>W :call WeeklyStatus()<CR>

if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif

let s:fontsize = 12
function! AdjustFontSize(amount)
let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

autocmd FileType c   setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction
