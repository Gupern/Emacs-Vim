" Vim filetype plugin file
" Language:	python
" Maintainer:	James Sully <sullyj3@gmail.com>
" Previous Maintainer: Johannes Zellner <johannes@zellner.org>
" Last Change:	Tue, 06 September 2016
" https://github.com/sullyj3/vim-ftplugin-python

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1
let s:keepcpo= &cpo
set cpo&vim

setlocal cinkeys-=0#
setlocal indentkeys-=0#
setlocal include=^\\s*\\(from\\\|import\\)
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal suffixesadd=.py
setlocal comments=b:#,fb:-
setlocal commentstring=#\ %s

setlocal omnifunc=pythoncomplete#Complete

set wildignore+=*.pyc

let b:next_toplevel='\v%$\|^(class\|def)>'
let b:prev_toplevel='\v^(class\|def)>'
let b:next='\v%$\|^\s*(class\|def)>'
let b:prev='\v^\s*(class\|def)>'

execute "nnoremap <silent> <buffer> ]] :call <SID>Python_jump('n', '". b:next_toplevel."', 'W')<cr>"
execute "nnoremap <silent> <buffer> [[ :call <SID>Python_jump('n', '". b:prev_toplevel."', 'Wb')<cr>"
execute "nnoremap <silent> <buffer> ]m :call <SID>Python_jump('n', '". b:next."', 'W')<cr>"
execute "nnoremap <silent> <buffer> [m :call <SID>Python_jump('n', '". b:prev."', 'Wb')<cr>"

execute "onoremap <silent> <buffer> ]] :call <SID>Python_jump('o', '". b:next_toplevel."', 'W')<cr>"
execute "onoremap <silent> <buffer> [[ :call <SID>Python_jump('o', '". b:prev_toplevel."', 'Wb')<cr>"
execute "onoremap <silent> <buffer> ]m :call <SID>Python_jump('o', '". b:next."', 'W')<cr>"
execute "onoremap <silent> <buffer> [m :call <SID>Python_jump('o', '". b:prev."', 'Wb')<cr>"

execute "xnoremap <silent> <buffer> ]] :call <SID>Python_jump('x', '". b:next_toplevel."', 'W')<cr>"
execute "xnoremap <silent> <buffer> [[ :call <SID>Python_jump('x', '". b:prev_toplevel."', 'Wb')<cr>"
execute "xnoremap <silent> <buffer> ]m :call <SID>Python_jump('x', '". b:next."', 'W')<cr>"
execute "xnoremap <silent> <buffer> [m :call <SID>Python_jump('x', '". b:prev."', 'Wb')<cr>"

if !exists('*<SID>Python_jump')
  fun! <SID>Python_jump(mode, motion, flags) range
      if a:mode == 'x'
          normal! gv
      endif

      normal! 0

      let cnt = v:count1
      mark '
      while cnt > 0
          call search(a:motion, a:flags)
          let cnt = cnt - 1
      endwhile

      normal! ^
  endfun
endif

if has("browsefilter") && !exists("b:browsefilter")
    let b:browsefilter = "Python Files (*.py)\t*.py\n" .
                \ "All Files (*.*)\t*.*\n"
endif

if !exists("g:python_recommended_style") || g:python_recommended_style != 0
    " As suggested by PEP8.
    setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8
endif

" First time: try finding "pydoc".
if !exists('g:pydoc_executable')
    if executable('pydoc')
        let g:pydoc_executable = 1
    else
        let g:pydoc_executable = 0
    endif
endif
" If "pydoc" was found use it for keywordprg.
if g:pydoc_executable
    setlocal keywordprg=pydoc
endif

let &cpo = s:keepcpo
unlet s:keepcpo
