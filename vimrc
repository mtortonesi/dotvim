" ******************** VUNDLE ********************

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'



" ******************** PLUGIN LIST ********************

" Plugins on GitHub repositories
Bundle 'altercation/vim-colors-solarized'
Bundle 'astashov/vim-ruby-debugger', {'tag':'v1.0'}
Bundle 'bling/vim-airline'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'ervandew/screen'
Bundle 'godlygeek/tabular'
Bundle 'goldfeld/vim-seek'
" Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-function'
Bundle 'kana/vim-textobj-line'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'mattn/emmet-vim'
Bundle 'mhinz/vim-startify'
Bundle 'mileszs/ack.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'scrooloose/nerdcommenter'
" Bundle 'scrooloose/nerdtree'
" Bundle 'scrooloose/vim-space'
Bundle 'SirVer/ultisnips'
Bundle 'sjl/gundo.vim'
Bundle 't9md/vim-textobj-function-ruby'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-bundler'
" Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-vinegar'
Bundle 'vim-ruby/vim-ruby'
Bundle 'elixir-lang/vim-elixir'

" Plugins from vim-scripts repositories
Bundle 'file-line'
Bundle 'Parameter-Text-Objects'
Bundle 'Vim-R-plugin'

" Brief help:
"
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed!



" ******************** GENERAL SETTINGS ********************

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Keep a backup file
set backup

" Keep 50 lines of command line history
set history=50

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Enable incremental searching
set incsearch

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Enable local, i.e., per-project, .exrc configuration files.
set exrc



" ******************** VIMRC ********************

" Set 2-space indentation for .vimrc editing
setlocal ts=8 sw=2 sts=2 expandtab



" ******************** AUTOCOMMANDS ********************

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  augroup text
    " Make sure to clear any previous settings in this group
    autocmd!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text  setlocal textwidth=78
  augroup END


  augroup java
    " Make sure to clear any previous settings in this group
    autocmd!

    " Java source code: set 4-space indentation
    autocmd FileType java  setlocal ts=8 sw=4 sts=4 expandtab
  augroup END


  augroup ruby
    " Make sure to clear any previous settings in this group
    autocmd!

    " Ruby source code: set 2-space indentation
    autocmd FileType ruby  setlocal ts=8 sw=2 sts=2 expandtab
    autocmd FileType eruby setlocal ts=8 sw=2 sts=2 expandtab

    " Ruby source code: automatically add shabang to new files
    autocmd BufNewFile *.rb 0put ='#!/usr/bin/env ruby' | norm G
  augroup END

  augroup c
    " Make sure to clear any previous settings in this group
    autocmd!

    autocmd FileType c     setlocal ts=8 sw=8 sts=8 expandtab
  augroup END

  augroup r
    " Make sure to clear any previous settings in this group
    autocmd!

    " R source code: set 2-space indentation
    autocmd FileType r     setlocal ts=8 sw=2 sts=2 expandtab
  augroup END


  augroup html
    " Make sure to clear any previous settings in this group
    autocmd!

    " HTML source code: set 2-space indentation
    autocmd FileType html  setlocal ts=8 sw=2 sts=2 expandtab
    autocmd FileType xhtml setlocal ts=8 sw=2 sts=2 expandtab
  augroup END


  augroup shell
    " Make sure to clear any previous settings in this group
    autocmd!

    " Bourne shell source code: set 4-space indentation
    autocmd FileType sh    setlocal ts=8 sw=4 sts=4 expandtab
    autocmd FileType sh    setlocal makeprg=bash\ '%'

    " Bourne shell source code: automatically add shabang to new files
    autocmd BufNewFile *.sh 0put ='#!/bin/bash' | norm G
  augroup END


  augroup tools
    " Make sure to clear any previous settings in this group
    autocmd!

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make  setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml  setlocal ts=2 sts=2 sw=2 expandtab
  augroup END


  augroup vim
    " Make sure to clear any previous settings in this group
    autocmd!

    " Vimscript source code: set 2-space indentation
    autocmd FileType vim  setlocal ts=8 sw=2 sts=2 expandtab
  augroup END


  augroup editing
    " Make sure to clear any previous settings in this group
    autocmd!

    " Enable cursor line highlighting only in the current window
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END

else

  " TODO: check whether we should disable this for old versions of Vim
  " Highlight line where cursor is placed
  set cursorline

  " Always set autoindenting on
  set autoindent

endif " has("autocmd")



" ******************** EDITING ********************

" Use line numbers
set number

" Set minimum width of number field
set numberwidth=5

" Be more liberal with hidden buffers
set hidden

" Toggle paste mode with F9
set pastetoggle=<F9>

" C-A fixes text paste problems (seems to work with endwise)
" TODO: check if * is the undo register
inoremap <silent> <C-a> <ESC>u:set paste<CR>p="*:set nopaste<CR>gi

" Select previously pasted text
" (from: http://vim.wikia.com/wiki/Selecting_your_pasted_text)
nnoremap gp `[v`]

" Allow to override the following settings via modelines
let g:secure_modelines_allowed_items = [
            \ "syntax",      "syn",
            \ "textwidth",   "tw",
            \ "softtabstop", "sts",
            \ "tabstop",     "ts",
            \ "shiftwidth",  "sw",
            \ "expandtab",   "et",   "noexpandtab", "noet",
            \ "filetype",    "ft",
            \ "foldmethod",  "fdm",
            \ "readonly",    "ro",   "noreadonly", "noro",
            \ "rightleft",   "rl",   "norightleft", "norl"
            \ ]

" Disable arrow keys
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Use , as <Leader> special character
let mapleader=','

" Set default encoding
set encoding=utf-8
" set fileencoding=utf-8



" ******************** INVISIBLE CHARACTERS ********************

" This configuration was taken from vimcasts.org (episode 1)

" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Show invisible characters by default
set list



" ******************** WHITESPACE AND INDENTATION ********************

" This configuration is taken (in part) from vimcasts.org (episodes 4 and 5)

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Strip trailing spaces
nnoremap _$ :silent call Preserve("%s/\\s\\+$//e")<CR>

" Re-indent the whole file
nnoremap _= :silent call Preserve("normal gg=G")<CR>

" Remove blank lines
nnoremap __ :%g/^$/d<CR>



" ******************** COLORS ********************

" Set colors for dark blackground
set background=dark

" Solarized options
let g:solarized_termtrans=1

" Setup solarized color scheme
colorscheme solarized

" " Show syntax highlighting groups for word under cursor
" nnoremap <C-S-P> :silent call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo noremap(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc



" ******************** VIMDIFF ********************

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif



" ******************** POWERLINE ********************

let g:Powerline_symbols = 'fancy'
set laststatus=2



" ******************** ACK ********************

" Configure Ack.vim to use ag (AKA the silver searcher)
let g:ackprg = 'ag --nogroup --nocolor --column'



" ******************** CTRL-P ********************

" Set working directory to the nearest ancestor that contains one of these
" directories or files: .git/ .hg/ .svn/ .bzr/ _darcs/
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v(\.swp|\.so|\.zip|\~)$',
  \ }



" ******************** TAGBAR ********************

" F8 toggles the tagbar window
nnoremap <F8> :TagbarToggle<CR>



" ******************** VIM-R-PLUGIN2 ********************

" Disable '_' to ' -> ' completion in Vim-R-Plugin2
let g:vimrplugin_underscore = 1



" ******************** NERDTREE ********************

" " Toggle (open/close) NERDTree with F12
" inoremap <F12> <C-O>:NERDTreeToggle<CR>
" nnoremap <F12> :NERDTreeToggle<CR>
" vnoremap <F12> :NERDTreeToggle<CR>



" ******************** NERDCOMMENTER ********************

" Smart un/comment of whole lines in visual mode
let NERDCommentWholeLinesInVMode=2

" Insert an extra space after the left delimiter and before the right delimiter
let NERDSpaceDelims=1

" To comment:   ,cl
" To uncomment: ,cu



" ******************** BUFFERS, WINDOWS AND TABS ********************

" This configuration is taken (in part) from vimcasts.org (episodes 7 and 8)

" Window navigation shortcuts
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Commands to move windows around
" nnoremap <silent> <A-Up>    :wincmd k<CR>
" nnoremap <silent> <A-Down>  :wincmd j<CR>
" nnoremap <silent> <A-Left>  :wincmd h<CR>
" nnoremap <silent> <A-Right> :wincmd l<CR>

" Tab navigation shortcuts
" noremap <C-1> 1gt
" noremap <C-2> 2gt
" noremap <C-3> 3gt
" noremap <C-4> 4gt
" noremap <C-5> 5gt
" noremap <C-6> 6gt
" noremap <C-7> 7gt
" noremap <C-8> 8gt
" noremap <C-9> 9gt
" noremap <C-0> :tablast<CR>
" By default:
" noremap <C-PgUp>   gt
" noremap <C-PgDown> gT

" Other interesting tab management commands
" :tabc[lose]	Close the current tab page and all its windows
" :tabo[nly]	Close all tabs apart from the current one
" :tabmove	Move current tab to the end
" :tabmove 0	Move current tab to the beginning
" :tabmove 1	Move current tab to become the 2nd tab



" ******************** BUFFERGATOR ********************

" noremap <Leader>b :BuffergatorToggle<CR>



" ******************** FILE OPENING SHORTCUTS ********************

" This configuration was taken from vimcasts.org (episode 14)

" Shortcuts to open files from the same directory as the file in the current
" buffer. Additionally, this allows to expand the directory of the current
" file anywhere at the command line by pressing %%.
cnoremap %% <C-R>=expand('%:h').'/'<CR>
noremap <Leader>ew :e %%
noremap <Leader>es :sp %%
noremap <Leader>ev :vsp %%
noremap <Leader>et :tabe %%



" ******************** MATCHIT ********************

" This configuration was taken from vimcasts.org
" (http://vimcasts.org/blog/2010/12/a-text-object-for-ruby-blocks/)

runtime macros/matchit.vim



" ******************** GUNDO.VIM ********************

nnoremap <F5> :GundoToggle<CR>



" ******************** FUGITIVE ********************

" This configuration is taken from vimcasts.org (episodes 31-35)

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  augroup fugitive
    " Make sure to clear any previous settings in this group
    autocmd!

    " Map '..' to go up a level to the parent directory, but only for buffers
    " containing a git blob or tree
    autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif

    " Autoclean fugitive buffers
    autocmd BufReadPost fugitive://* set bufhidden=delete
  augroup END

endif " has("autocmd")



" ******************** RVM ********************

" Setup g:ruby_path according to $MY_RUBY_HOME for much speedier startup times
if !empty($MY_RUBY_HOME)
  " Add lib/ruby directory
  let str = glob($MY_RUBY_HOME.'/lib/ruby/*.*')

  " Unless we are using JRuby (which has no lib/ruby/site_ruby), also add the
  " lib/ruby/site_ruby directory
  if !empty(matchstr($MY_RUBY_HOME, 'jruby'))
    let str = str."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*')
  endif

  " Process the globbed stuff
  let g:ruby_path = join(split(str,"\n"),',')
endif



" ******************** VIM-RUBY-DEBUG ********************

let g:ruby_debugger_debug_mode = 1
let g:ruby_debugger_builtin_sender = 0
let g:ruby_debugger_progname = 'vim'
" ~/.vim/tmp/ruby_debugger_output



" ******************** RAILS.VIM ********************

" open URLs w/ firefox
command! -bar -nargs=1 OpenURL :!firefox <args>



" ******************** STILL TO CHECK ********************

" Avoid deleting words in insert mode
inoremap <C-w> <C-o><C-w>


" To change current file format:
" :set fileformat=unix|dos|mac


" set formatoptions=rq " Automatically insert comment leader on return,
"                      " and let gq format comments


" Other plugins to consider
"  1) yankring (http://www.vim.org/scripts/script.php?script_id=1234)
"  5) conque (http://www.vim.org/scripts/script.php?script_id=2771)
"  6) showmarks (http://www.vim.org/scripts/script.php?script_id=152)
" 10) delimitMate (http://github.com/Raimondi/delimitMate)
