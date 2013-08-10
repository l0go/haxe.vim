compiler haxe
setlocal omnifunc=vaxe#HaxeComplete

if (!&autowrite)
    echomsg "Please enable autowrite (see :help autowrite) in order for vaxe autocompletion to work naturally"
endif

let run_once = 0
if (!run_once)
    " Start a server the first time a hx file is edited
    if g:vaxe_cache_server_enable && ! exists('g:vaxe_cache_server_pid')
        call vaxe#StartCacheServer()
    endif

    " Utility variable that stores the directory that this script resides in
    "Load the first time a haxe file is opened
    let s:plugin_path = escape(expand('<sfile>:p:h') . '/../python/', '\')
    exe 'pyfile '.s:plugin_path.'/vaxe.py'

    " load special configuration for vim-airline if it exists
    if (exists("g:loaded_airline") && g:vaxe_enable_airline )
        function! AirlineBuild()
            if &filetype == 'haxe'
                let w:airline_section_c =
                            \'☢ %{pathshorten(fnamemodify(vaxe#CurrentBuild(), ":."))'
                            \. '} '
                            \. g:airline_left_alt_sep
                            \.' %f%m'
            endif
        endfunction
        call add(g:airline_statusline_funcrefs, function('AirlineBuild'))
    endif
endif
