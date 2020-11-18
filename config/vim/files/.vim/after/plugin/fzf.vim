let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

if executable('rg')
    let g:rg_derive_root='true' " Find project root from cwd
endif

let g:fzf_branch_actions = {
            \ 'checkout': {
            \   'prompt': 'Checkout> ',
            \   'execute': 'echo system("{git} checkout {branch}")',
            \   'multiple': v:false,
            \   'keymap': 'enter',
            \   'required': ['branch'],
            \   'confirm': v:false,
            \ },
            \ 'track': {
            \   'prompt': 'Track> ',
            \   'execute': 'echo system("{git} checkout --track {branch}")',
            \   'multiple': v:false,
            \   'keymap': 'ctrl-t',
            \   'required': ['branch'],
            \   'confirm': v:false,
            \ },
            \ 'create': {
            \   'prompt': 'Create> ',
            \   'execute': 'echo system("{git} checkout -b {input}")',
            \   'multiple': v:false,
            \   'keymap': 'ctrl-n',
            \   'required': ['input'],
            \   'confirm': v:false,
            \ },
            \ 'delete': {
            \   'prompt': 'Delete> ',
            \   'execute': 'echo system("{git} branch -D {branch}")',
            \   'multiple': v:true,
            \   'keymap': 'ctrl-d',
            \   'required': ['branch'],
            \   'confirm': v:true,
            \ },
            \ 'merge':{
            \   'prompt': 'Merge> ',
            \   'execute': 'echo system("{git} merge {branch}")',
            \   'multiple': v:false,
            \   'keymap': 'ctrl-e',
            \   'required': ['branch'],
            \   'confirm': v:true,
            \ },
            \ 'rebase': {
            \   'prompt': 'Rebase> ',
            \   'execute': 'echo system("{git} rebase {branch}")',
            \   'multiple': v:false,
            \   'keymap': 'ctrl-r',
            \   'required': ['branch'],
            \   'confirm': v:true,
            \ },
            \}
