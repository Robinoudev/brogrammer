function s:SetColorScheme()
    if !has('termguicolors')
        let g:base16colorspace=256
    endif

    set background=dark
    colorscheme base16-default-dark

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
