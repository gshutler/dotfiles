syntax region heading matchgroup=heading start=/^##* / end=/$/ keepend oneline
syntax region bold matchgroup=bold start='*' end='*' keepend oneline

syntax match check /X/ contained
syntax region checkbox matchgroup=checkbox start=/ *\[/ end="]" keepend oneline contains=check

highlight heading ctermfg=red guifg=red
highlight bold ctermfg=red guifg=red
highlight checkbox ctermfg=yellow guifg=yellow
highlight check ctermfg=green guifg=green
