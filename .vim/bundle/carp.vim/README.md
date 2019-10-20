ＣＡＲＰ．ＶＩＭ
================

Carp.vim is a small, lightweight plugin designed for providing a more
ergonomic way of entering keystrokes requiring the use of modifier keys,
such as the control, shift and alt (Meta) keys. Vim's expression mapping 
feature is used to define mappings for leading key sequences that behave 
like a sticky version of the equivalent modifier key. These mappings work 
in normal, visual, operator pending, command (Ex mode) and insert modes.

Configuration options can be specified using the global variable g:carp.
Each of the values in g:carp should be a string specifying a sequence
of keys (using vim's syntax for mappings), to be mapped to each modifier.

Example configuration:

```vim
	let g:carp = {
				\ 'control' : '<Leader>,',
				\ 'shift'   : '<Leader>c',
				\ 'meta'    : '<Leader>m',
				\}
```
