""""""
"" ALE
""""""

let g:ale_completion_enabled = 1
let g:ale_fixers = {
\	'javascript': ['prettier', 'eslint']
\}
let g:ale_rust_rls_executable = 'rust-analyzer'
let g:ale_rust_rls_toolchain = 'stable'

