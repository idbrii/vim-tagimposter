# vim-tagimposter
Forge tag jumps so tag alternatives can populate the tagstack.

# Obsolete

Recent versions of vim have `gettagstack` and `settagstack` that are better
versions of the functionality provided by tagimposter. See [vim/vim#3604](https://github.com/vim/vim/pull/3604).

For an example implementation, see 
[this commit in vim-racer](https://github.com/racer-rust/vim-racer/commit/6fe615ecedce06df9ec2624dd8f2ae0b3b69c4f5).

# About

Do you have a
[LSP](https://github.com/search?l=Vim+script&q=lsp&type=Repositories) or other
magic that helps you jump to symbols? Are you frustrated that `C-t` doesn't
work with that magic? tagimposter will commit tag forgery for you!

Inspired by [jedi.vim's
g:jedi#use_tag_stack](https://github.com/davidhalter/jedi-vim/blob/4c430ed536b6484f7c63929a4426d64f981d994e/pythonx/jedi_vim.py#L319),
tagimposter pushes imposter tags onto the tagstack. Call
`:TagImposterAnticipateJump` before your tag jumper, and you'll have full
native support (including `C-t`) without any key remapping.

# Usage

Usage varies for each tag jumper and how you like to jump to tags. For example
with [omnisharp-vim](https://github.com/OmniSharp/omnisharp-vim), **in
`ftplugin/cs.vim`**:

    nnoremap <buffer> <Leader>jT :<C-u> TagImposterAnticipateJump <Bar> OmniSharpGotoDefinition<CR>

Now you can use `<Leader>jT` to jump to tags, `<C-t>` to jump back, and
`:pop`/`:tag` to navigate up and down the stack. `:tags` will show your tags
prefixed with `IMPOSTER_`.

# Differences from jedi

vim-jedi is just for python. tagimposter works with anything (but requires more setup).

Unlike jedi, tagimposter uses a permanent file (to avoid save/restoring
wildignore and tags) and can work for any tag jumps, but have weird looking
symbol names.

