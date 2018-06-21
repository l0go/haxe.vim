if exists("g:loaded_vaxe_plugin")
    finish
endif

let g:loaded_vaxe_plugin = 1

" Utility variable that stores the directory that this script resides in
"Load the first time a haxe file is opened
let g:vaxe_plugin_path = expand('<sfile>:p:h:h')

command -nargs=? -complete=file DefaultHxml call vaxe#DefaultHxml(<q-args>)
command -nargs=? -complete=file ProjectHxml call vaxe#ProjectHxml(<q-args>)
command VaxeToggleLogging let g:vaxe_logging = !g:vaxe_logging

autocmd FileType haxe setlocal commentstring=//%s

" a short alias, since I use this all over the place
let Default = function("vaxe#util#Config")

" misc options
let g:vaxe_logging             = Default('g:vaxe_logging', 0)

" default build options
let g:vaxe_prefer_hxml               = Default('g:vaxe_prefer_hxml', "build.hxml")
let g:vaxe_prefer_lime               = Default('g:vaxe_prefer_lime', "*.lime")
let g:vaxe_prefer_openfl             = Default('g:vaxe_prefer_openfl', "project.xml")
let g:vaxe_prefer_first_in_directory = Default('g:vaxe_prefer_first_in_directory', 1)

let g:vaxe_default_parent_search_patterns
            \= Default('g:vaxe_default_parent_search_patterns'
            \, [g:vaxe_prefer_hxml, "*.hxml"])

" Supported 3rd party plugin options
let g:vaxe_enable_airline_defaults = Default('g:vaxe_enable_airline_defaults', 1)

" Auto config Haxe LSP
augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted call vaxe#SetConfig()
augroup END

if exists("g:LanguageClient_serverCommands")
    g:LanguageClient_serverCommands['haxe'] = ['node', g:vaxe_plugin_path.'/haxe-languageserver/bin/server.js']
else
    let g:LanguageClient_serverCommands = {
    \ 'haxe': ['node', g:vaxe_plugin_path.'/haxe-languageserver/bin/server.js'],
    \ }
endif

let g:vaxe_trace_absolute_path = Default('g:vaxe_trace_absolute_path', 1)

autocmd CompleteDone *.hx call AdditionalTextEdits()

function! AdditionalTextEdits()
  if has_key(v:completed_item, "user_data") && v:completed_item.user_data != ""
    let dat = json_decode(v:completed_item.user_data)
    echomsg string(dat)
    for edit in dat.additional_text_edits
      let pos = edit.range.start.line
      let text = substitute(edit.newText, '\n$', '', '')
      let text = substitute(text, '[[:cntrl:]]', '', 'g')
      undojoin | call append(pos, text)
    endfor
  endif
endfunction

" language client settings
let g:vaxe_lc_enableDiagnostics     = Default('g:vaxe_lc_enableDiagnostics', 1)
let g:vaxe_lc_diagnosticsPathFilter = Default('g:vaxe_lc_diagnosticsPathFilter', "")
let g:vaxe_lc_enableCodeLens        = Default('g:vaxe_lc_enableCodeLens', 1)
let g:vaxe_lc_displayPort           = Default('g:vaxe_lc_displayPort', "auto")
let g:vaxe_lc_buildCompletionCache  = Default('g:vaxe_lc_buildCompletionCache', 1)
let g:vaxe_lc_codeGeneration        = Default('g:vaxe_lc_codeGeneration', {})
let g:vaxe_lc_format                = Default('g:vaxe_lc_format', {})

