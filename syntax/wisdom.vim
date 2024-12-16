echo "epic wisdom"
syn region    mochaComment start="#" end="$"
syn keyword   mochaConstant true false nil

syn region    mochaString start="'" end="'" contains=mochaEscape
syn match     mochaEscape contained /\\\([nts\\']\|x\x\{2}\)/

syn region    mochaArray start="\[" end="\]" transparent fold
syn region    mochaBlock start="{" end="}"  transparent fold

syn match     mochaDec "[+-]\?\d\+\.\d\+\([eE][+-]\?\d\+\(\.\d\+\)\?\)\?"
syn match     mochaInt "[+-]\?\d\+\(\.\)\@!\([eE][+-]\?\d\+\(\.\d\+\)\?\)\?"
syn match     mochaInt "\<0[xX][a-fA-F0-9]\+"

syn match     mochaIdentifier /\v[a-zA-Z_]*:/

hi default link mochaComment Comment
hi default link mochaConstant Constant

hi default link mochaString String
hi default link mochaEscape Special

hi default link mochaArray Operator
hi default link mochaBlock Operator

hi default link mochaDec Number
hi default link mochaInt Number

hi default link mochaIdentifier Identifier
