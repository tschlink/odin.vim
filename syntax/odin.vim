" if exists("b:current_syntax")
"   finish
" endif

setlocal commentstring=//\ %s
setlocal suffixesadd=.odin

syntax keyword odinImport import
syntax keyword odinPackage package
syntax keyword odinForeign foreign

syntax keyword odinProc proc
syntax keyword odinUsing using
syntax keyword odinTransmute transmute
syntax keyword odinCast cast
syntax keyword odinDo do
syntax keyword odinDefer defer

syntax keyword odinDistinct distinct
syntax keyword odinDynamic dynamic
syntax keyword odinMap map
syntax keyword odinMatrix matrix

syntax keyword odinIf if
syntax keyword odinWhen when
syntax keyword odinElse else
syntax keyword odinWhere where
syntax keyword odinSwitch switch
syntax keyword odinCase case

syntax keyword odinFor for
syntax keyword odinContinue continue
syntax keyword odinBreak break

syntax keyword odinIn in
syntax keyword odinNotIn not_in
syntax keyword odinOrElse or_else

syntax keyword odinSizeOf size_of
syntax keyword odinOffsetOf offset_of
syntax keyword odinTypeOf type_of
syntax keyword odinTypeIdOf typeid_of
syntax keyword odinTypeInfoOf type_info_of
syntax keyword odinAlignOf align_of

syntax keyword odinReturn return
syntax keyword odinOrReturn or_return

syntax keyword odinStruct struct
syntax keyword odinEnum enum
syntax keyword odinUnion union
syntax keyword odinBitSet bit_set

syntax keyword odinDataType bool byte b8 b16 b32 b64 int i8 i16 i32 i64 i128 uint u8 u16 u32 u64 u128 i16le i32le i64le i128le i16be i32be i64be i128be u16le u32le u64le u128le u16be u32be u64be u128be float double f16 f32 f64 f16le f16be f32le f32be f64le f64be complex complex32 complex64 complex128 quaternion64 quaternion128 quaternion256 uintptr rune string cstring rawptr typeid any
syntax keyword odinBool true false
syntax keyword odinNull nil
syntax match odinNoinit "---"

syntax match odinInteger "\-\?\<\d\+\>" display
syntax match odinHex "\<0[xX][0-9A-Fa-f]\+\>" display
syntax match odinOct "\<0[oO][0-7]\+\>" display
syntax match odinBin "\<0[bB][01]\+\>" display
syntax match odinDoz "\<0[zZ][0-9a-bA-B]\+\>" display
syntax match odinFloat "\-\?\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=" display

syntax region odinRawString start=+`+ end=+`+
syntax region odinChar start=+'+ skip=+\\\\\|\\'+ end=+'+
syntax region odinString start=+"+ skip=+\\\\\|\\'+ end=+"+ contains=odinEscape
syntax match odinEscape display contained /\\\([nrt\\'"]\|x\x\{2}\)/

" @= means "match the previous atom (part between parentheses) but do not
" consider it part of the matched expression, i.e. the atom must be present
" but is not part of the syntax group

" Any declaration, constant or procedure
syntax match odinConstDeclaration "\v<\w+>(\s*:\s*\w*\s*:)@="
syntax match odinVariableDeclaration "\v<\w+>(\s*:\s*\w*\s*\=)@="
"syntax match odinFunctionDecl "\v<\w*>(\s*::\s*proc)@="
syntax match odinFunctionCall "\v\w*\.\?\w+\s*(\()@="

syntax match odinDeclarationOp "::?" display
syntax match odinDeclAssign ":=" display
syntax match odinAssign "=" display

syntax match odinRange "\.\.=" display
syntax match odinHalfRange "\.\.\<" display
syntax match odinAddressOf "&" display
syntax match odinDeref "\^" display

syntax match odinTernaryQMark "?" display
syntax match odinReturnOp "->" display

syntax match odinSingleAttribute "^\s*@\<\w\+\>" display
syntax keyword odinAttribute private require link_name link_prefix export linkage default_calling_convention link_section extra_linker_flags deferred_in deferred_out deferred_in_out deferred_none

syntax match odinDirective "#\<\w\+\>" display

syntax match odinTemplate "$\<\w\+\>"

syntax match odinTodo "TODO"
syntax match odinNote "NOTE"
syntax match odinFixMe "FIXME"
syntax match odinNoCheckin "NOCHECKIN"
syntax match odinHack "HACK"

syntax match odinCommentNote "@\<\w\+\>" contained display
syntax region odinLineComment start=/\/\// end=/$/  contains=odinCommentNote, odinTodo, odinNote, odinFixMe, odinNoCheckin, odinHack
syntax region odinBlockComment start=/\v\/\*/ end=/\v\*\// contains=odinBlockComment, odinCommentNote, odinTodo, odinNote, odinFixMe, odinNoCheckin, odinHack

" Maybe scan back to find the beginning of block comments?
syntax sync minlines=200

highlight link odinImport  Keyword
highlight link odinPackage Keyword
highlight link odinForeign Keyword

highlight link odinProc      Keyword
highlight link odinUsing     Keyword
highlight link odinTransmute Keyword
highlight link odinCast      Keyword
highlight link odinDo        Keyword
highlight link odinDefer     Keyword

highlight link odinDistinct Keyword
highlight link odinDynamic  Keyword
highlight link odinMap      Keyword
highlight link odinMatrix   Keyword

highlight link odinIf     Conditional
highlight link odinWhen   Conditional
highlight link odinElse   Conditional
highlight link odinWhere  Conditional
highlight link odinSwitch Conditional
highlight link odinCase   Label

highlight link odinFor      Repeat
highlight link odinContinue Repeat
highlight link odinBreak    Repeat

highlight link odinIn     Operator
highlight link odinNotIn  Operator
highlight link odinOrElse Operator

highlight link odinSizeOf     Keyword
highlight link odinOffsetOf   Keyword
highlight link odinTypeOf     Keyword
highlight link odinTypeIdOf   Keyword
highlight link odinTypeInfoOf Keyword
highlight link odinAlignOf    Keyword

highlight link odinReturn   Keyword
highlight link odinOrReturn Keyword

highlight link odinStruct Structure
highlight link odinEnum   Structure
highlight link odinUnion  Structure
highlight link odinBitSet Structure

highlight link odinDataType Type
highlight link odinBool Boolean
highlight link odinNull Type
highlight link odinNoinit Keyword

highlight link odinInteger Number
highlight link odinHex     Number
highlight link odinOct     Number
highlight link odinBin     Number
highlight link odinDoz     Number
highlight link odinFloat   Float

highlight link odinString    String
highlight link odinRawString String
highlight link odinChar      String

highlight link odinConstDeclaration    Identifier
highlight link odinVariableDeclaration Identifier
"highlight link odinFunctionDecl Function
highlight link odinFunctionCall Function

highlight link odinDeclarationOp Operator
highlight link odinDeclAssign    Operator
highlight link odinAssign        Operator

highlight link odinRange     Operator
highlight link odinHalfRange Operator
highlight link odinAddressOf Operator
highlight link odinDeref     Operator

highlight link odinTernaryQMark Operator
highlight link odinReturnOp     Operator

highlight link odinSingleAttribute Keyword
highlight link odinAttribute Keyword

highlight link odinDirective Macro

highlight link odinTemplate Constant

highlight link odinTodo        Todo
highlight link odinNote        Todo
highlight link odinXXX         Todo
highlight link odinFixMe       Todo
highlight link odinNoCheckin   Todo
highlight link odinHack        Todo
highlight link odinCommentNote Todo

highlight link odinLineComment  Comment
highlight link odinBlockComment Comment

let b:current_syntax = "odin"
