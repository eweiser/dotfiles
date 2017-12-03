" ----------
" KEY MAPS
" ----------

" turn off linewise keys
nmap j gj
nmap k gk

" shortcut for going to previous file
nmap <C-e> :e#<CR>

" Super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

nmap zj O<Esc>j
nmap zk o<Esc>k

nmap \e :NERDTreeToggle<CR>

inoremap jj <Esc>

" ----------
" OPTIONS
" ----------

set autoindent
set expandtab
set number
set ruler
set shiftwidth=2
set softtabstop=2
set tabstop=2
set splitright
set splitbelow
set backspace=indent,eol,start
set laststatus=2

filetype plugin indent on

" ----------
" PLUGINS
" ----------

" Use Pathogen for plugin management. See update.sh in this directory.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" For any plugins that use this, make their keymappings use comma
let mapleader = ","
let maplocalleader = ","

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_linters = {
\   'python': ['flake8'],
\ }
let g:ale_fixers = {
\   'python': ['flake8'],
\ }
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" ----------------------------------------------------------------------------
" COLORS
" ----------------------------------------------------------------------------

" Make sure colored syntax mode is on, and make it Just Work with 256-color terminals.
set background=dark
let g:rehash256 = 1 " Something to do with Molokai?
colorscheme molokai
if !has('gui_running')
  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
  elseif has("terminfo")
    colorscheme default
    set t_Co=8
    set t_Sf=[3%p1%dm
    set t_Sb=[4%p1%dm
  else
    colorscheme default
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
  endif
  " Disable Background Color Erase when within tmux - https://stackoverflow.com/q/6427650/102704
  if $TMUX != ""
    set t_ut=
  endif
endif
syntax on

" Window splits & ruler are too bright, so change to white on grey (non-GUI)
highlight StatusLine       cterm=NONE ctermbg=blue ctermfg=white
highlight StatusLineTerm   cterm=NONE ctermbg=blue ctermfg=white
highlight StatusLineNC     cterm=NONE ctermbg=black ctermfg=white
highlight StatusLineTermNC cterm=NONE ctermbg=black ctermfg=white
highlight VertSplit        cterm=NONE ctermbg=black ctermfg=white

" taglist.vim's filenames is linked to LineNr by default, which is too dark
highlight def link MyTagListFileName Statement
highlight def link MyTagListTagName Question

" Turn off horrible coloring for CDATA in XML
highlight def link xmlCdata NONE

" Some custom spell-checking colors
highlight SpellBad     term=underline cterm=underline ctermbg=NONE ctermfg=205
highlight SpellCap     term=underline cterm=underline ctermbg=NONE ctermfg=33
highlight SpellRare    term=underline cterm=underline ctermbg=NONE ctermfg=217
highlight SpellLocal   term=underline cterm=underline ctermbg=NONE ctermfg=72

" The Ignore color should be... ignorable
silent! highlight Ignore cterm=bold ctermfg=black ctermbg=bg
highlight clear FoldColumn
highlight def link FoldColumn Ignore
highlight clear Folded
highlight link Folded Ignore
highlight clear LineNr
highlight! def link LineNr Ignore

" Custom search colors
highlight clear Search
highlight Search term=NONE cterm=NONE ctermfg=white ctermbg=black

" Make hilighted matching parents less annoying
highlight clear MatchParen
highlight link MatchParen Search

" Custom colors for NERDTree
highlight def link NERDTreeRO NERDTreeFile

" Make trailing spaces very visible
highlight SpecialKey ctermbg=Yellow guibg=Yellow

" Make menu selections visible
highlight PmenuSel ctermfg=black ctermbg=magenta

" The sign column slows down remote terminals
highlight clear SignColumn
highlight link SignColumn Ignore

" Markdown could be more fruit salady
highlight link markdownH1 PreProc
highlight link markdownH2 PreProc
highlight link markdownLink Character
highlight link markdownBold String
highlight link markdownItalic Statement
highlight link markdownCode Delimiter
highlight link markdownCodeBlock Delimiter
highlight link markdownListMarker Todo

" ----------------------------------------------------------------------------
" HOST-SPECIFIC VIM FILE
" ----------------------------------------------------------------------------

" Now load specifics to this host
if filereadable(expand("~/.vimlocal"))
  source ~/.vimlocal
endif

" Some plugin seems to search for something at startup, so this fixes that.
silent! nohlsearch
