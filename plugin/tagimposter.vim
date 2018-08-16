" Create fake tags to populate the tagstack
"
" Inspired by jedi.vim's g:jedi#use_tag_stack.
" https://github.com/davidhalter/jedi-vim/blob/4c430ed536b6484f7c63929a4426d64f981d994e/pythonx/jedi_vim.py#L319
"
" Unlike jedi, tagimposter uses a permanent file (to avoid save/restoring
" wildignore and tags) and can work for any tag jumps, but have weird looking
" symbol names.
"
" Usage:
"   nnoremap <buffer> <Leader>jT :<C-u> TagImposterAnticipateJump <Bar> OmniSharpGotoDefinition<CR>

if exists('loaded_tagimposter')
    finish
endif
let loaded_tagimposter = 1 

let g:tagimposter_tagfile = get(g:, 'tagimposter_tagfile', '~/.vim-cache/imposter.tags')
let g:tagimposter_symbolprefix = get(g:, 'tagimposter_symbolprefix', 'IMPOSTER_')


command! -bar TagImposterAnticipateJump silent call tagimposter#pushtag(expand("<cword>"))
