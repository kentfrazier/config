set nocompatible    " Disables vi-compatible mode

" Set up environment variables to allow vim files to live in the config dir
let $VIMHOME = $CONFIGHOME . '/vim'

filetype off " toggle for vundle

set runtimepath=$VIMHOME,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$VIMHOME/after,$VIMHOME/bundle/vundle

call vundle#rc('$VIMHOME/bundle')

" --- Vundle --- "
"  - Required -  "
" Bundle 'gmarik/vundle' " handled by git submodule

"  - Optional -  "
Bundle 'kevinw/pyflakes'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'msanders/snipmate.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

Bundle 'django.vim'
Bundle 'FuzzyFinder'
Bundle 'html-improved-indentation'
Bundle 'indentpython.vim'
Bundle 'javascript.vim'
Bundle 'L9'
Bundle 'LargeFile'
Bundle 'matchit.zip'
Bundle 'python.vim--Vasiliev'
Bundle 'pythoncomplete'
Bundle 'sessionman.vim'
Bundle 'taglist.vim'
Bundle 'ZoomWin'

Bundle 'git://repo.or.cz/vcscommand'
" -------------- "

filetype on
filetype plugin on
filetype indent on

set notitle         " Prevents annoying title message

let g:ragtag_global_maps = 1

let g:sessionman_sessions_path = $CONFIG_STORAGE . '/vim/sessions'

set background=dark
if has("gui_running")
    gui
    colorscheme xoria256
    set guioptions-=T   " Remove button toolbar
    set cursorline      " Highlights current line

    if has("unix")
        set guifont=DejaVu\ Sans\ Mono\ 12
    elseif has("win32")
        set guifont=Consolas:h12:cANSI
    endif
endif

syntax on           " Turn on syntax highlighting

set printoptions=paper:letter,number:y,left:2pc,right:2px,top:2pc,bottom:2pc

let mapleader = ',' " use , as personal leader sequence

set nofoldenable    " Turn off code folding
set hidden          " Allow modified buffers to run in the background
set number          " Turn on line numbers
set nohls           " Turn off highlight search
set expandtab       " Expand tabs into spaces
set shiftwidth=4    " Set width of soft tabs to 4 spaces
set tabstop=4
set textwidth=0     " no predefined limit
set history=1000    " Remember the last 1000 commands issued
set wildmenu        " Show all possible matches for filename completion
set wildmode=list:longest " Autocomplete up to point of ambiguity
set completeopt=menu,longest,preview " same for CTRL-N completion
set ignorecase      " Ignore case while searching
set smartcase       " Ignore case unless letter is capital
set title           " Show the filename as title
set autoindent      " Automatically line up new lines with previous line
set backspace=indent,eol,start " Allows backspace to delete these
set cmdheight=1     " Sets height of command line to 1
set incsearch       " Highlight search matches as they are typed
set ruler           " Location information
set foldenable      " Enable folding
set autoread        " Automatically updates updated files
set laststatus=2    " Always turns status bar on
set visualbell t_vb= " Disables beep and screen flash on error
set wrapscan        " Wrap around on searches
set nowrap          " Don't wrap long lines
set gdefault        " Use global flag by default on substitutions
set pastetoggle=<F3> " Used to autoindent pasted text
set wildignore=*.swp,*.bak,*.pyc,*.class
" allow the cursor to enter virtual cols in block visual mode
set virtualedit=block
set mouse=a         " allow the mouse to work in terminal version
set clipboard=unnamed " make the * register point at the " register
set tildeop         " make ~ behave like an operator

set iskeyword+=_ " most languages allow underscores as identifier chars

" Search for a tags file up the path until one is found
" see `:help file-searching`
set tags=./ctags;/,./tags;/

" --- Backup Handling --- "
set nobackup                     " Turn off persistent backup
set writebackup                  " Turn on temporary backups
set backupdir=$CONFIG_STORAGE/vim/backup,. " Backup directories
set directory=$CONFIG_STORAGE/vim/backup,. " Backup directories

" --- Undo Handling --- "
if has("persistent_undo")
    set undofile                 " Turn on persistent undo
    set undodir=$CONFIG_STORAGE/vim/undo,. " Set directory for persistent undo files
endif
set undolevels=1000          " Keep the last 1000 changes

" Improve list characters for types of whitespace
"if has("unix") " These chars don't seem to be supported in Windows Vim
"    set listchars=tab:▸\ ,eol:¬
"elseif has("win32")
    set listchars=tab:>\ ,eol:�
"endif

" Format for status line
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>

" Toggles highlight search
map <LEADER>hl :set hls!<CR>
map <F4> <LEADER>hl
" Toggles display of hidden characters
map <LEADER>l :set list!<CR>
map <F5> <LEADER>l
" Trims all trailing whitespace
map <LEADER>tr :Trim<CR>
" Copy all text to the system clipboard
map <LEADER>ac ggVG"*y<ESC>`'
" Wrap line at 80 characters
map <LEADER>w 80\|EBi<CR><ESC>

" --- location list bindings --- "
"  These bindings are also relevant for :lvimgrep
" List matches
map <F11> :llist<CR>
" List matches in a window split, or close if open
map <C-F11> :lwindow<CR>
" Previous match
map <S-Left> :lprevious<CR>
" Last match of previous file
map <S-Up> :lpfile<CR>
" Next match
map <S-Right> :lnext<CR>
" First match of next file
map <S-Down> :lnfile<CR>


" --- quickfix bindings --- "
" These bindings are also relevant for :vimgrep
" List errors
map <F12> :clist<CR>
" List errors in a window split, or close if open
map <C-F12> :cwindow<CR>
" Previous error
map <C-S-Left> :cprevious<CR>
" Last error of previous file
map <C-S-Up> :cpfile<CR>
" Next error
map <C-S-Right> :cnext<CR>
" First error of next file
map <C-S-Down> :cnfile<CR>

" --- tag bindings --- "
" Show all matching tags
map <F10> :tselect<CR>
" Next tag
map <C-Left> :tprev<CR>
" Previous tag
map <C-Right> :tnext<CR>

" --- .vimrc --- "
" Edit .vimrc
map <LEADER>ev :e $CONFIGHOME/dotfiles/.vimrc<CR>
" Reload .vimrc
map <LEADER>rv :source $CONFIGHOME/dotfiles/.vimrc<CR>

" --- Session Management --- "
map <LEADER>ss :SessionSave<CR>
map <LEADER>sl :SessionList<CR>

" --- FuzzyFinder Bindings --- "
map <LEADER>ff :FufFile<CR>
map <LEADER>fb :FufBuffer<CR>

" --- Undo History Bindings --- "
" map <LEADER>h :UB<CR>
map <LEADER>h :GundoToggle<CR>

" --- Toggle Spellcheck --- "
map <LEADER>sp :setlocal spell! spelllang=en_us<CR>

" --- Buffer Navigation --- "
map <A-LEFT> :bprevious<CR>
map <A-RIGHT> :bnext<CR>

" --- Arguments Navigation --- "
map <C-PageUp> :previous<CR>
map <C-PageDown> :next<CR>
map <C-Home> :first<CR>
map <C-End> :last<CR>

if exists('+colorcolumn')
    set colorcolumn=81
else
    autocmd BufWinEnter *.py let b:m1=matchadd('ColorColumn', '\%80v.', -1)
endif

if !exists("s:autocmd_loaded")
    let s:autocmd_loaded = 1

    " treat all html files in pype projects as htmldjango
    autocmd BufWinEnter */pype/*.html set filetype=htmldjango
    autocmd BufWinEnter */pype/*.html setlocal iskeyword+=_
    autocmd BufWinEnter */pype/* setlocal path+=templates

    " treat webAgent2 scripts as natural
    autocmd BufWinEnter *.{wbs,WBS,wbt,WBT,wbh,WBH,wbc,WBC} set filetype=natural
endif

" --- Write File With Sudo --- "
function! SudoWrite(filename)
    echo expand(filename)
    " does this work?
    exec '!tee > ~/footest'
    for line in getbufline(a:filename, 1, '$')
        exec '!echo -E ' . line
    endfor
endfunction

command! -nargs=1 BW call WipeMatchingBuffers('<args>')
command! BWE call WipeNonDescendentBuffers()

command! -range=% Hardcopy call Hardcopy(<line1>, <line2>)

command! -range=% Trim call TrimTrailingWhitespace(<line1>, <line2>)

" Bind :W to :w, since I do this all the friggin' time
command! -range=% -bang -nargs=* -complete=file W <line1>,<line2>w<bang> <args>

" Change directory to the one containing the current file
command! CDHere cd %:p:h
" Change local directory as above
command! LCDHere lcd %:p:h

function! GetBufferList()
    return filter(range(1,bufnr('$')), 'buflisted(v:val)')
endfunction

function! GetMatchingBuffers(pattern)
    return filter(GetBufferList(), 'bufname(v:val) =~ a:pattern')
endfunction

function! WipeMatchingBuffers(pattern)
    let l:matchList = GetMatchingBuffers(a:pattern)

    let l:count = len(l:matchList)
    if l:count < 1
        echo 'No buffers found matching pattern ' . a:pattern
        return
    endif

    if l:count == 1
        let l:suffix = ''
    else
        let l:suffix = 's'
    endif

    exec 'bw ' . join(l:matchList, ' ')

    echo 'Wiped ' . l:count . ' buffer' . l:suffix . '.'
endfunction

function! WipeNonDescendentBuffers()
    call WipeMatchingBuffers('^\/\|^\\')
endfunction

function! Hardcopy(startLine, endLine)
    let prevColor = g:colors_name
    colorscheme monoprint
    exec a:startLine . ',' . a:endLine . 'hardcopy'
    exec 'colorscheme ' . prevColor
endfunction

function! TrimTrailingWhitespace(startLine, endLine)
    for lnum in range(a:startLine, a:endLine)
        let text = getline(lnum)
        let newText = substitute(text, '\s\+$', '', '')
        if newText != text
            call setline(lnum, newText)
        endif
    endfor
endfunction

function! JoinSpaceless(startLine, endLine)
    if a:startLine == a:endLine
        let endLine = a:startLine + 1
    else
        let endLine = a:endLine
    endif

    let lines = []
    call add(lines, substitute(getline(a:startLine), '\s*$', '', ''))

    for lnum in range(a:startLine + 1, endLine)
        call add(lines, substitute(getline(lnum), '^\s*\|\s*$', '', ''))
    endfor

    let aRegisterSave = @a
    exec a:startLine + 1 . ',' . endLine . 'delete a'
    let @a = aRegisterSave

    call setline(a:startLine, join(lines, ''))
endfunction
command! -range Join call JoinSpaceless(<line1>, <line2>)
map <LEADER>J :Join<CR>

function! GetFuzzyMatches(fuzzyPattern)
    let files = split(expand('**'))
    let pattern = join(split(a:fuzzyPattern, '\zs'), '.*')
    let pattern = substitute(pattern, '[/\\]', '[/\\]', 'g')
    let filteredFiles = filter(files, 'v:val =~ "' . pattern . '"')
    return filteredFiles
endfunction

function! ListDirectoryContents(dir)
    return split(glob(a:dir . '/*'), '\n')
endfunction

function! ListUnqualifiedDirectoryContents(dir)
    return map(ListDirectoryContents(a:dir), 'fnamemodify(v:val, ":t")')
endfunction

function! OpenInCurrentFileDirectory(filename)
    let dir = expand('%:h')
    exec 'e %:h/' . a:filename
endfunction

" function! ListCurrentFileDirectoryContents(...)
"     return a:000
"     echo a:000
"     let relPath = ''
"     return ListUnqualifiedDirectoryContents(expand('%:p:h') . relPath)
" endfunction
"
" command! -nargs=1 -complete=customlist,ListCurrentFileDirectoryContents EC call OpenInCurrentFileDirectory('<args>')
" command! -nargs=1 -complete=file EC call OpenInCurrentFileDirectory('<args>')

map <LEADER>ec :e <C-R>=expand('%:h') . '/'<CR>

" TODO: check out :laddbuffer and think about making something that will
" use grep then parse it apart to build a list similar to what :lvimgrep
" produces
function! Grep(...)
    if a:0 < 2
        echo "Usage: MyGrep <options> <pattern> <dir>"
        echo 'Example: MyGrep -r "cow" ~/Desktop/*'
        return
    endif
    if a:0 == 2
        let options = '-rsinI'
        let pattern = a:1
        let dir = a:2
    else
        let options = a:1 . 'snI'
        let pattern = a:2
        let dir = a:3
    endif
    let exclude = 'grep -v "^[^:]*\.svn/.*:"'
    let cmd = 'grep '.options.' '.pattern.' '.dir. '| '.exclude
    let cmd_output = system(cmd)
    if cmd_output == ""
        echomsg "Pattern " . pattern . " not found"
        return
    endif

    let tmpfile = tempname()
    exe "redir! > " . tmpfile
    silent echon '[grep search for "'.pattern.'" with options "'.options.'"]'."\n"
    silent echon cmd_output
    redir END

    let old_efm = &efm
    set efm=%f:%\\s%#%l:%m

    execute "silent! lfile " . tmpfile
    let &efm = old_efm

    call delete(tmpfile)
endfunction
command! -nargs=* -complete=file Grep call Grep(<f-args>)
