if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

syn match htmlTagName contained "\<[a-zA-Z:\.]*\>"
syn match wisdomComment "//.*" contains=haxeTODO,@Spell
syn region wisdomComment2 start=+/\*+ end=+\*/+ contains=haxeTODO,@Spell

let s:conditionals = ["if", "else", "elseif", "switch", "case"]
for s:conditional in s:conditionals
	syn match wisdomConditional . s:conditional . contained containedin=htmlTagName
endfor

syn match wisdomRepeat "foreach" contained containedin=htmlTagName
syn match wisdomKeyword "key" contained containedin=htmlTagName

unlet! b:current_syntax
syn region wisdomInterpolated matchgroup=haxeinterpolated start=+${+ end=+}+ keepend skip="{[^{}]*}" contains=haxeMeta,haxeCompilerMeta,haxeRegex,haxeDString,haxeSString,haxeSpecialCharacter,haxeIntSpecialChar,haxeRegexEscape,haxeErrorCharacter,haxeRegexError,haxeInterpolatedIdent,haxeInterpolated,haxeError,haxeOperator,haxeOperator2,haxeSpecial,haxeInt,haxeFloat,haxeBool,haxeComment,haxeComment2,haxeTODO,haxePre,haxePreError,haxeType,haxeTypedef,haxeTypeDecl,haxeStorageClass,haxeException,haxeRepeat,haxeLabel,haxeConditional,haxeConstant,haxeFunction,haxeKeyword,haxeWisdom containedin=htmlTag,htmlValue,haxeWisdom,htmlH1

hi def link wisdomComment Comment
hi def link wisdomComment2 Comment
hi def link wisdomConditional Conditional
hi def link wisdomRepeat Repeat
hi def link wisdomKeyword Keyword
