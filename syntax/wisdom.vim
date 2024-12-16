if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

syn match htmlTagName contained "\<[a-zA-Z:\.]*\>"
syn keyword wisdomTODO contained TODO FIXME XXX
syn match wisdomComment "//.*" contains=wisdomTODO,@Spell
syn region wisdomComment2 start=+/\*+ end=+\*/+ contains=haxeTODO,@Spell

let s:conditionals = ["if", "else", "elseif", "switch", "case"]
for s:conditional in s:conditionals
	syn match wisdomConditional . s:conditional . contained containedin=htmlTagName
endfor

syn match wisdomRepeat "foreach" contained containedin=htmlTagName

syn region haxeWisdom start=+${+ms=s+2 end=+}+me=e-1 keepend contains=@haxe,@Spell

hi def link wisdomComment Comment
hi def link wisdomComment2 Comment
hi def link wisdomConditional Conditional
hi def link wisdomRepeat Repeat
