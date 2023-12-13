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
syntax keyword odinFallthrough fallthrough

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

syntax keyword odinDataType bool b8 b16 b32 b64
syntax keyword odinDataType int i8 i16 i32 i64 i128
syntax keyword odinDataType uint byte u8 u16 u32 u64 u128
syntax keyword odinDataType i16le i32le i64le i128le i16be i32be i64be i128be
syntax keyword odinDataType u16le u32le u64le u128le u16be u32be u64be u128be
syntax keyword odinDataType f16 f32 f64 f16le f16be f32le f32be f64le f64be
syntax keyword odinDataType complex complex32 complex64 complex128 quaternion64 quaternion128 quaternion256
syntax keyword odinDataType uintptr rune string cstring rawptr typeid any

syntax keyword odinBool true false
syntax keyword odinNull nil
syntax match odinNoinit "---"

syntax match odinInteger "\<[0-9][0-9_]*\>" display
syntax match odinHex     "\<0[xX][0-9A-Fa-f][0-9A-Fa-f_]*\>" display
syntax match odinOct     "\<0[oO][0-7][0-7_]*\>" display
syntax match odinBin     "\<0[bB][01][01_]*\>" display
syntax match odinDoz     "\<0[zZ][0-9a-bA-B][0-9a-bA-B_]*\>" display

syntax match odinFloat   "\<[0-9][0-9_]*\%(\.[0-9_]\+\)\%([eE][+-]\=[0-9_]\+\)\=" display

syntax match odinOperator "\V!\|+\|-\|*\|/\|%\|%%"
syntax match odinOperator "\V+=\|-=\|*=\|/=\|%=\|%%="
syntax match odinOperator "\V>\|>=\|<\|<=\|!=\|&&\|&&=\|||\|||="
syntax match odinOperator "\V~\|~=\||\||=\|&\|&=\|&~\|&~=\|<<\|<<=\|>>\|>>="

syntax match odinDeclarationOp "::\=" display
syntax match odinDeclAssign ":=" display
syntax match odinAssign "=" display

syntax match odinRange "\V..=" display
syntax match odinHalfRange "\V..<" display
syntax match odinAddressOf "&" display
syntax match odinDeref "\^" display

syntax match odinTernaryQMark "?" display
syntax match odinReturnOp "->" display

syntax region odinRawString start=+`+ end=+`+
syntax region odinChar start=+'+ skip=+\\\\\|\\'+ end=+'+
syntax region odinString start=+"+ skip=+\\\\\|\\'+ end=+"+ contains=odinEscape
syntax match odinEscape /\\\([abefnrtv\\'"]\|\o\{2}\|x\x\{2}\|u\x\{4}\|u\x\{8}\)/ display contained

" @= means "match the previous atom (part between parentheses) but do not
" consider it part of the matched expression, i.e. the atom must be present
" but is not part of the syntax group

" Any declaration, constant, variable or procedure, with or without assignment
" type definition pattern: [0-9A-Za-z_[\]()^.]*
" TODO this doesn't take into account any newlines
syntax match odinDeclaration '\m\h\w*\(\s*:\s*[0-9A-Za-z_[\]()^.]*\(\s*\(:\|=\)\)\=\)\@='
syntax match odinFunctionCall "\v(<\h\w*>\.)=<\h\w*>\s*(\()@="

syntax match odinCallingConvention /\v"(odin|contextless|stdcall|std|cdecl|c|fastcall|fast|none)"/ display contained contains=odinString

" Both, parameters and return values can contain full odinDeclarations. For
" the sake of simplicity, performance, and readability we don't repeat the
" full regex here again. Matching on just '.*' should be good enough for most
" cases
" TODO this doesn't take into account any newlines
syntax match odinProcedureDecl /\mproc\s*\("[a-z]\+"\)\=\s*(.*)\(\s*->\s*\(\h\w*\|(.+)\)\)\=\(\s*{\)\@=/ contains=odinDataType,odinDeclaration,odinCallingConvention

syntax keyword odinAttribute private require link_name link_prefix export linkage default_calling_convention link_section extra_linker_flags deferred_in deferred_out deferred_in_out deferred_none  contained
syntax match odinSingleAttribute "^\s*@\<\w\+\>" display contains=odinAttribute
syntax region odinAttributeList start="@(" end=")$" contains=odinAttribute,odinString

syntax match odinDirective "#\<\w\+\>" display
syntax match odinTemplate "$\<\w\+\>"

syntax match odinTodo "TODO"
syntax match odinNote "NOTE"
syntax match odinFixMe "FIXME"
syntax match odinNoCheckin "NOCHECKIN"
syntax match odinHack "HACK"

syntax match odinCommentNote "@\<\w\+\>" contained display
syntax region odinLineComment start="//" end="$" oneline contains=odinCommentNote, odinTodo, odinNote, odinFixMe, odinNoCheckin, odinHack
syntax region odinBlockComment start="\/\*" end="\*\/" contains=odinBlockComment, odinCommentNote, odinTodo, odinNote, odinFixMe, odinNoCheckin, odinHack

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

highlight link odinFallthrough Keyword

highlight link odinFor      Repeat
highlight link odinContinue Repeat
highlight link odinBreak    Repeat

highlight link odinIn     Keyword
highlight link odinNotIn  Keyword
highlight link odinOrElse Keyword

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

highlight link odinOperator Operator

highlight link odinDeclarationOp Operator
highlight link odinDeclAssign    Operator
highlight link odinAssign        Operator

highlight link odinRange     Operator
highlight link odinHalfRange Operator
highlight link odinAddressOf Operator
highlight link odinDeref     Operator

highlight link odinTernaryQMark Operator
highlight link odinReturnOp     Operator

highlight link odinString    String
highlight link odinRawString String
highlight link odinChar      String
highlight link odinEscape    String

highlight link odinDeclaration Identifier
"highlight link odinVariableDeclaration Identifier
"highlight link odinFunctionDecl Function
highlight link odinFunctionCall Function

highlight link odinSingleAttribute Keyword
highlight link odinAttribute Keyword

highlight link odinDirective PreProc
highlight link odinTemplate  PreProc

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
