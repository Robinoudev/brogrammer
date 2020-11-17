let g:projectionist_heuristics = {
            \   '*': {
            \       'app/*.rb': {
            \           'alternate': 'spec/{}_spec.rb',
            \           'type': 'source'
            \       },
            \       'spec/*_spec.rb': {
            \           'alternate': 'app/{}.rb',
            \           'type': 'test'
            \       },
            \
            \       '*.ts': {
            \           'alternate': ['{}.spec.ts', '{}.html'],
            \           'type': 'source'
            \       },
            \       '*.spec.ts': {
            \           'alternate': ['{}.ts', '{}.html'],
            \           'type': 'spec'
            \       },
            \   }
            \}
