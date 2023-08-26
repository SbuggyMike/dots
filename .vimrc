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
set relativenumber
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
" easily reload vimrC
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
" fuzzy finder?
nnoremap <C-p> :find ./**/*
" correct typos - particularly law words and names
iabbrev na an
iabbrev waht what
iabbrev tehn then
iabbrev hte the
iabbrev teh the
iabbrev THe The
iabbrev htey they
iabbrev taht that
iabbrev atht that
iabbrev owuld would
iabbrev oculd could
iabbrev beyind beyond
iabbrev whcih which
iabbrev hwich which
iabbrev ie i.e.,
iabbrev eg e.g.,
iabbrev nb n.b.
iabbrev Nb N.b.
iabbrev wrt with regard to
iabbrev w/ with
iabbrev c1rcs circumstances
" citations
iabbrev CoA Court of Appeal
iabbrev ewhc EWHC
iabbrev ewca EWCA
iabbrev HoL House of Lords
iabbrev ukpc UKPC
iabbrev uksc UKSC
iabbrev oplr OPLR
iabbrev plr PLR
iabbrev pc Privy Council
iabbrev SC Supreme Court
iabbrev ukhl UKHL
iabbrev lj LJ
iabbrev vc V-C
iabbrev j J
" general law vocabulary
iabbrev c0m company
iabbrev c0ms companies
iabbrev C0m Company
iabbrev C0ms Companies
iabbrev c0n contract
iabbrev C0n Contract
iabbrev c0ns contracts
iabbrev C0ns Contracts
iabbrev c0l contractual
iabbrev C0l Contractual
iabbrev c0t court
iabbrev C0t Court
iabbrev c0ts courts
iabbrev C0ts Courts
iabbrev c0l contractual
iabbrev d0c document
iabbrev D0c Document
iabbrev d0x documents
iabbrev D0x Documents
iabbrev 3st estoppel
iabbrev 3St Estoppel
iabbrev r3g regulation
iabbrev r3gs regulations
iabbrev R3g Regulation
iabbrev R3gs Regulations
iabbrev govt government
iabbrev Govt Government
" trust words
iabbrev d3 duty
iabbrev D3 Duty
iabbrev d3s duties
iabbrev D3s Duties
iabbrev t3 trustee
iabbrev T3 Trustee
iabbrev t3s trustees
iabbrev T3s Trustees
iabbrev b3 beneficiary
iabbrev B3 Beneficiary
iabbrev b3s beneficiaries
iabbrev B3s Beneficiaries
iabbrev b3l beneficial
iabbrev B3l Beneficial
iabbrev i3 interest
iabbrev I3 Interest
iabbrev i3s interests
iabbrev I3s Interests
iabbrev f1d fiduciary
iabbrev F1d Fiduciary
iabbrev f1ds fiduciaries
iabbrev F1ds Fiduciaries
iabbrev bfpfvwn bona fide purchaser for value without notice
" pension words
iabbrev p3 pension
iabbrev P3 Pension
iabbrev p3s pensions
iabbrev P3s Pensions
iabbrev s3m scheme
iabbrev S3m Scheme
iabbrev s3ms schemes
iabbrev S3ms Schemes
iabbrev m3 member
iabbrev M3 Member
iabbrev m3s members
iabbrev M3s Members
iabbrev e33 employee
iabbrev E33 Employee
iabbrev e33s employees
iabbrev E33s Employees
iabbrev e3r employer
iabbrev E3r Employer
iabbrev e3rs employers
iabbrev E3rs Employers
iabbrev e3t employment
iabbrev E3t Employment
iabbrev oPs occupational pension scheme
iabbrev oPss occupational pension schemes
iabbrev Ops Occupational Pension Scheme
iabbrev Opss Occupational Pension Schemes
iabbrev tr1b tribunal
iabbrev Tr1b Tribunal
iabbrev tpr the Pensions Regulator
iabbrev Tpr The Pensions Regulator
iabbrev tpo the Pensions Ombudsman
iabbrev Tpo The Pensions Ombudsman
iabbrev 0ms Ombudsman
iabbrev ppf PPF
iabbrev Ppf Pension Protection Fund
" admin words
iabbrev n0 number
iabbrev n0s numbers
iabbrev N0 Number
iabbrev N0s Numbers
iabbrev steph Stephen
iabbrev sjh SJH
