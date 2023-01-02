function! s:checkEnvironment() abort
    let valid = 1
    if !executable('haxe')
        let valid = 0
        call health#report_error('Haxe not found! Please install Haxe')
    endif

    if !executable('haxelib')
        let valid = 0
        call health#report_error('Haxelib not found! Please install Haxe')
    endif

    if valid
        call health#report_ok('Environment check passed')
    endif
endfunction

function! health#haxe() abort
    call s:checkEnvironment()
endfunction
