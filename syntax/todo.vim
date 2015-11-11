if exists("b:current_syntax")
  finish
endif
syntax region todoWaiting start=/^\s\+- / end=/^\s\+[-ox] /me=s-1
syntax region todoDoing start=/^\s\+o /  end=/^\s\+[-ox] /me=s-1
syntax region todoDone start=/^\s\+x /  end=/^\s\+[-ox] /me=s-1

syntax match todoDate /\d\{4}-\d\d-\d\d/
syntax match todoDate /xxxx-xx-xx/

syntax match todoTime /\d\d:\d\d/
syntax match todoTime /xx:xx/

syntax match todoHeader /^\s*[^:]\{-}:/

hi def link todoWaiting Statement
hi def link todoDoing   Identifier
hi def link todoDone    Ignore
hi def link todoHeader  Statement
hi def link todoTime    Constant
hi def link todoDate    Constant

