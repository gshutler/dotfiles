syntax region bold matchgroup=bold start='*' end='*' keepend oneline
syntax region heading matchgroup=heading start='\v^##* ' end='\v$' keepend oneline
syntax region comments matchgroup=comments start='\v^(    )+[^#]' end='\v$' keepend oneline contains=hashtag

syntax match check 'X' contained
syntax region checkbox matchgroup=checkbox start='\v *\[' end=']' keepend oneline contains=check

syntax match hashtag '\v#[^# ][^ ]*'

syntax region codeblock matchgroup=codeblock start='\v^```' end='\v^```'

highlight bold ctermfg=red guifg=red
highlight check ctermfg=green guifg=green
highlight checkbox ctermfg=yellow guifg=yellow
highlight comments ctermfg=darkgray guifg=darkgray
highlight hashtag ctermfg=cyan guifg=cyan
highlight heading ctermfg=red guifg=red

highlight codeblock ctermfg=gray guifg=gray
