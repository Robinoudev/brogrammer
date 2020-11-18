if !has('nvim')
    finish
endif

function! s:Corpus()
    lua <<
        CorpusDirectories = {
            ['~/personal/wiki'] = {
                autocommit = true,
                autoreference = 1,
                autotitle = 1,
                base = '/wiki/',
                tags = {'wiki'},
                transform = 'web',
            },
        }
.
endfunction

call s:Corpus()
