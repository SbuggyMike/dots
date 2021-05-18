"" TEX PLUGIN
" This plugin creates keybinding that speed up adding the formatting options
" to a .tex document a check to see if the plug in has already been loaded
if exists("b:did_my_tex_plugin")
  finish
endif
let b:did_my_tex_plugin = 1 

" some useful mappings - note that they exit out of insert mode so that they
" will still work at any point in the line
"
" new chapter heading (numbered)
noremap <buffer> <localleader>c o\section{}<esc>i
inoremap <buffer> <localleader>c <esc>o\section{}<esc>i
" new section heading (numbered)
noremap <buffer> <localleader>s :write<CR>o\subsection{}<esc>i
inoremap <buffer> <localleader>s <esc>:write<CR>o\subsection{}<esc>i
" new subsection heading (numbered)
noremap <buffer> <localleader>h o\subsubsection{}<esc>i
inoremap <buffer> <localleader>h <esc>o\subsubsection{}<esc>i
" italics
noremap <buffer> <localleader>i i\emph{}<esc>i
inoremap <buffer> <localleader>i \emph{}<esc>i
" quote
noremap <buffer> <localleader>q o\begin{quote}\end{quote}<esc>2F}a
inoremap <buffer> <localleader>q <esc>o\begin{quote}\end{quote}<esc>ka
" bullet points
noremap <buffer> <localleader>b o\begin{itemize}<CR><CR>\end{itemize}<esc>ka
inoremap <buffer> <localleader>b <esc>o\begin{itemize}<CR><CR>\end{itemize}<esc>2F}a
" numbered list
noremap <buffer> <localleader>n o\begin{enumerate}<CR>\end{enumerate}<esc>2F}a
inoremap <buffer> <localleader>n <esc>o\begin{enumerate}<CR>\end{enumerate}<esc>2F}a
" items in a list
noremap <buffer> <localleader>y o\item
inoremap <buffer> <localleader>y o\item
" superscripte
noremap <buffer> <localleader>u o\textsuperscript{}<esc>i
inoremap <buffer> <localleader>u <esc>o\textsuperscript{}<esc>i
" elipsis
noremap <buffer> <localleader>. o\ldots
inoremap <buffer> <localleader>. \ldots{}
" (auto)cite
noremap <buffer> <localleader>a o\autocite[]{}<esc>i
inoremap <buffer> <localleader>a <esc>o\autocite[]{}<esc>i
" textcite
noremap <buffer> <localleader>t \textcite{}<esc>i
inoremap <buffer> <localleader>t \textcite{}<esc>i
" some default settings
noremap <buffer> <localleader>x i\documentclass[12 pt, a4paper, notitlepage]{article}<CR>\usepackage{setspace}<CR>\usepackage[small]{titlesec}<CR>%\doublespacing<CR>\frenchspacing<CR><CR>\title{\large\bfseries}<CR><CR>\begin{document}<CR>\date{}<CR>\maketitle<CR><CR>\end{document}<esc>2k
" compile pdf
noremap <buffer> <localleader>j :write<bar>execute "!pdflatex %"<CR>
inoremap <buffer> <localleader>j <esc>:write<bar>execute "!pdflatex %"<CR>
" open pdf
noremap <buffer> <localleader>k :execute '!okular %:r.pdf &'<CR>
inoremap <buffer> <localleader>k <esc>:execute '!okular %:r.pdf'<CR>
