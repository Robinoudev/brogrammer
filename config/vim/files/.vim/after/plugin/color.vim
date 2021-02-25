function s:SetColorScheme()
    if !has('termguicolors')
        let g:base16colorspace=256
    endif

    let s:base16_config = expand('~/.vim/.base16')
    if filereadable(s:base16_config)
        let s:config = readfile(s:base16_config, '', 2)

        if s:config[1] =~# '^dark\|light$'
            execute 'set background=' . s:config[1]
        else
            echoerr 'Bad background ' . s:config[1] . ' in' . s:base16_config
        endif

        if filereadable(expand('~/.vim/pack/bundle/opt/base16-vim/colors/base16-' . s:config[0] . '.vim'))
            execute 'colorscheme base16-' . s:config[0]
        else
            echoerr 'Bad colorscheme ' . s:config[0] . ' in' . s:base16_config
        endif
    else
        set background=dark
        colorscheme base16-default-dark
    endif

    " Italicize comments
    highlight! Comment gui=italic

    " make search and inc search red, bold, italic and underlined
    highlight! Search gui=bold,underline,italic guifg=Red guibg=bg
    highlight! IncSearch gui=bold,underline,italic guifg=Red guibg=bg

    " setup colors for nvim lsp messages
    highlight! LspDiagnosticsSignError gui=bold guibg=bg guifg=Red
    highlight! LspDiagnosticsSignWarning gui=bold guibg=bg guifg=Orange

    " Make list chars less fat
    highlight! NonText gui=none

    " Make end of buffer the same color as the colorcolumn
    execute 'highlight link EndOfBuffer ColorColumn'

    " execute all autocmds for the ColorScheme group when this function is
    " called
    doautocmd ColorScheme
endfunction

if v:progname !=# 'vi'
    if has('autocmd')
        augroup CreateColors
            autocmd!
            autocmd FocusGained * call s:SetColorScheme()
        augroup END
    endif

    call s:SetColorScheme()
endif
