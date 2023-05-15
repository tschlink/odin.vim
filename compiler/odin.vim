" Vim compiler plugin file
" Language:        Odin
" Maintainer:      Tom Schlink <schlink.tom@gmail.com>
" Latest Revision: 2023-05-15
" License:         MIT
" Repository:      https://github.com/kururen/odin.vim
" Based on the JAI compiler script of Raphael Luba
" (https://github.com/rluba/jai.vim)

if exists("g:current_compiler")
  finish
endif

let g:current_compiler="odin"

function! FindOdinCompiler()
    if exists("g:odin_compiler")
        return g:odin_compiler
    else
        if has("win64") || has("win32") || has("win16")
            let g:odin_compiler="odin.exe"
            return "odin.exe"
        else
            let g:odin_compiler="odin"
            return "odin"
        endif
    endif
endfunction

function! UpdateOdinMakeprg() 
    return FindOdinCompiler() . " build ."
endfunction

execute "CompilerSet makeprg=" . escape(UpdateOdinMakeprg(), ' ')

CompilerSet errorformat=%f(%l:%v)\ %m

