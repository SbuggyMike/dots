" NROFF PLUGIN
" This plugin creates keybinding that speed up adding the formatting options
" to a .ms document
" a check to see if the plug in has already been loaded
if exists("b:did_my_nroff_plugin")
  finish
endif
let b:did_my_nroff_plugin = 1 

" some useful mappings - note that they exit out of insert mode so that they
" will still work at any point in the line
" new paragraph
noremap <buffer> <localleader>p o.PP<CR>
inoremap <buffer> <localleader>p <esc>o.PP<CR>
" new paragraph without indent (no new line as what follows it is often
" underlined)
noremap <buffer> <localleader>P o.LP
inoremap <buffer> <localleader>P <esc>o.LP
" new chapter heading (numbered)
noremap <buffer> <localleader>C o.bp<CR>.NH 1<CR>
inoremap <buffer> <localleader>C <esc>o.bp<CR>.NH 1<CR>
" new chapter heading (unnumbered)
noremap <buffer> <localleader>c o.bp<CR>.SH 1<CR>
inoremap <buffer> <localleader>c <esc>o.bp<CR>.SH 1<CR>
" new section heading (numbered)
noremap <buffer> <localleader>S :write<CR>o.NH 2<CR>
inoremap <buffer> <localleader>S <esc>:write<CR>o.NH 2<CR>
" new section heading (unnumbered) 
noremap <buffer> <localleader>s :write<CR>o.SH 2<CR>
inoremap <buffer> <localleader>s <esc>:write<CR>o.SH 2<CR>
" new subsection heading (numbered)
noremap <buffer> <localleader>H o.NH 3<CR>
inoremap <buffer> <localleader>H <esc>o.NH 3<CR>
" new subsection heading (unnumbered)
noremap <buffer> <localleader>h o.SH 3<CR>
inoremap <buffer> <localleader>h <esc>o.SH 3<CR>
" italics (with both quotes)
noremap <buffer> <localleader>i o.I "  "<Esc>hi
inoremap <buffer> <localleader>i <esc>o.I "  "<Esc>hi
" italics (with first quote only to allow for auto complete)
noremap <buffer> <localleader>I o.I " 
inoremap <buffer> <localleader>I <esc>o.I " 
" italic inter alia 
noremap <buffer> <localleader>ia o.I " inter alia, " 
inoremap <buffer> <localleader>ia <esc>o.I " inter alia, "
" underline (with both quotes)
noremap <buffer> <localleader>u o.UL "  "<Esc>hi
inoremap <buffer> <localleader>u <esc>o.UL "  "<Esc>hi
" underline (with first quote only to allow for auto complete)
noremap <buffer> <localleader>U o.UL " 
inoremap <buffer> <localleader>U <esc>o.UL " 
" bullet point
noremap <buffer> <localleader>l o.IP \[bu] 2<CR>
inoremap <buffer> <localleader>l <esc>o.IP \[bu] 2<CR>
" em dash
noremap <buffer> <localleader>m o\*[-]<CR>
inoremap <buffer> <localleader>m <esc>o\*[-]<CR>
" some sensible opening lines
inoremap <buffer> <localleader>x i.nr PS 12<CR>.nr PO 1.5i<CR>.nr LL 5.2i<CR>.nr PI 3n<CR>.nr PSINCR 2p<CR>.nr GROWPS 3<CR>.nr PD 0.3v<CR>.fam  T<CR>.ls 0
" compile pdf
noremap <buffer> <localleader>j :write<bar>execute '!groff -T ps -m ms % >> %:r.ps'<CR>
inoremap <buffer> <localleader>j <esc>:write<bar>execute '!groff -T ps -m ms % >> %:r.ps'<CR>
" open pdf
noremap <buffer> <localleader>k :execute '!okular %:r.ps &'<CR>
inoremap <buffer> <localleader>k <esc>:execute '!okular %:r.ps'<CR>
