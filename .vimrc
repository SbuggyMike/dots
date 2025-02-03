" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim
" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!
" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
set wildmenu
set number
set spell
set ignorecase
set smartcase
set cursorline
set guifont=Inconsolata\ 23
set tw=0
set autoread " so that I can do edits on one laptop and they will load in another
set hidden " allows movement between buffers without writing
" load plugins
packloadall
silent! helptags ALL
colorscheme koehler
filetype plugin on
syntax enable
" write before leaving buffer
autocmd BufLeave *.ms write
" from learn vimscript the hard way
" move a line down 
noremap - ddp 
" move a line up 
noremap _ ddkkp
" auto-correct most recently misspelled word
inoremap <leader>; <esc>[sz=1
" in insert mode, place (Groff/Tex) single quotes around a word
inoremap <leader>' <esc>viw<esc>a'<esc>bi`<esc>ela
" in insert mode, place double quotes around a word
inoremap <leader>" <esc>viw<esc>a"<esc>bi"<esc>ela
" in visual mode, place (groff/Tex) single around a selection
vnoremap <leader>' <esc>`<i`<esc>`>a'
" in visual mode, place double quotes around a selection
vnoremap <leader>" <esc>`<i"<esc>`>a"
" easily open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" easily reload vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" latex-related commands
" easily open filetype plugin 
nnoremap <leader>et :vsplit ~/.vim/ftplugin/tex.vim<cr>
" reload plugins
nnoremap <leader>st :source ~/.vim/ftplugin/tex.vim<cr>
" list buffers
nnoremap <leader>? :ls<cr>
" write file and close buffer
nnoremap <leader># :w<bar>bwipeout<cr>
" move to next and previous buffers
noremap <leader>> :w<bar>bnext<cr>
noremap <leader>< :w<bar>bprevious<cr>

source ~/.vim/abbreviations


" Enable autosave every 5 minutes
autocmd BufWritePost * silent! wall

function! AutoSave()
    if &modified
        write
    endif
endfunction

augroup AutoSaveGroup
    autocmd!
    autocmd CursorHold,CursorHoldI * call AutoSave()
    autocmd CursorHold,CursorHoldI * if !exists('g:auto_save_timer') | let g:auto_save_timer = 0 | endif
    autocmd CursorHold,CursorHoldI * if g:auto_save_timer > 300 | call AutoSave() | let g:auto_save_timer = 0 | endif
    autocmd CursorHold,CursorHoldI * let g:auto_save_timer += 1
augroup END

" Allow for keyboard shortcuts to increase font size in gVim
if has("gui_running")
  noremap <C-+> :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0) + 1', ')<CR>
  noremap <C--> :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0) - 1', ')<CR>
endif

