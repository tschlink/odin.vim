" Vim compilter file for ODIN
" Compiler: odin
" Maintainer: Tom Schlink <schlink.tom@gmail.com>
" Latest Revision: 2023-05-07
" Based on the JAI compiler script of Raphael Luba

if exists("current_compiler")
  finish
endif
let current_compiler="odin"

function! FindOdinCompiler()
    if exists("g:odin_compiler")
        return g:odin_compiler
    else
        if has("win64") || has("win32") || has("win16")
            return "odin.exe"
        else
            return "odin"
        endif
    endif
endfunction

function! UpdateOdinMakeprg() 
    let &l:makeprg=FindOdinCompiler() . " run ."
endfunction

call UpdateOdinMakeprg()

CompilerSet errorformat=%f(%l:%v)\ %m

