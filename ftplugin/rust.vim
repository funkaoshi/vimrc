let g:ale_fixers = {'*': ['trim_whitespace', 'remove_trailing_lines'], 'rust': ['rustfmt']}
let g:ale_linters =  {'rust': ['analyzer']}
let g:ale_rust_rustfmt_options = '--config max_width=120'
let g:ale_rust_analyzer_executable = 'rust-analyzer'
