# vim-tagimposter
Forge tag jumps so tag alternatives can populate the tagstack.

# About

Do you have a LSP or other magic that helps you jump to tags? Are you
frustrated that `C-t` doesn't work with that magic? tagimposter is here to
commit forgery!

Inspired by [jedi.vim's
g:jedi#use_tag_stack](https://github.com/davidhalter/jedi-vim/blob/4c430ed536b6484f7c63929a4426d64f981d994e/pythonx/jedi_vim.py#L319),
tagimposter pushes imposter tags onto the tagstack for you. With a little
configuration, tagimposter with make your tag jumper magic populate the
tagstack.

# Usage

In an ftplugin:

    nnoremap <buffer> <Leader>jT :<C-u> RecordTagJump <Bar> OmniSharpGotoDefinition<CR>

# Differences from jedi

vim-jedi is just for python. tagimposter works with anything (but requires more setup).

Unlike jedi, tagimposter uses a permanent file (to avoid save/restoring
wildignore and tags) and can work for any tag jumps, but have weird looking
symbol names.

