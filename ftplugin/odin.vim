" Vim filetype plugin file
" Language:        Odin
" Maintainer:      Tom Schlink <schlink.tom@gmail.com>
" Latest Revision: 2023-05-15
" License:         MIT
" Repository:      https://github.com/kururen/odin.vim

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

if !exists('current_compiler')
    compiler odin
endif
