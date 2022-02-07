" vim-dx - Delete function-call-like things with `dx`
" Maintainer:   Jer Wilson <superjer@superjer.com>
" URL:          https://github.com/superjer/vim-dx
" Version:      0.1
"
" License:
" Copyright Jer Wilson. Distributed under the same terms as Vim itself.
" See :help license
"
" Installation:
" Put this file in your ~/.vim/plugin dir or, if you use a bundler, clone
" https://github.com/superjer/vim-dx to your bundles dir.
"
" Description:
"Delete function-call-like things with `dx`
"
"This plugin adds a small shortcut `dx` to normal mode which deletes up to
"and including the next (, [, or <, and also the matching >, ], or )
"respectively.
"
"For example, with the cursor at the caret position, `dx` will do the following:
"
"    Test:
"        hippo = smoosh(every(a, b, c), d);
"                ^------                 -
"    Result:
"        hippo = every(a, b, c), d;
"
"
"    Test:
"        hippo = smoosh(every(a, b, c), d);
"                       ^-----       -
"    Result:
"        hippo = smoosh(a, b, c, d);

if exists("g:loaded_dx")
  finish
endif
let g:loaded_dx = 1

function! DelToBraceAndMatch()
  let start = col(".")
  let end = 99999
  exec "normal! f{" | if start != col(".") && col(".") < end | let end = col(".") | endif | exec "normal! " . start . "|"
  exec "normal! f(" | if start != col(".") && col(".") < end | let end = col(".") | endif | exec "normal! " . start . "|"
  exec "normal! f<" | if start != col(".") && col(".") < end | let end = col(".") | endif | exec "normal! " . start . "|"
  exec "normal! f[" | if start != col(".") && col(".") < end | let end = col(".") | endif | exec "normal! " . start . "|"
  if end < 99999
    exec "normal! d" . end . "|%xx"
  endif
endfun
nnoremap dx :<C-u>cal DelToBraceAndMatch()<CR>
