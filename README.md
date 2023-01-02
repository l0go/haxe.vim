Haxe.vim is a vim plugin for [Haxe][haxe], forked from [vaxe][vaxe] to focus on
providing filetype detection, syntax highlighting and indenting for Haxe-related
files.

More advanced features are left to LSP client.

# Installation

Install `kLabz/haxe.vim` with your favorite plugin manager.

# Example LSP client configuration

Apply your usual lsp config, for an example see
[nvim-lspconfig suggested configuration][lspconfig-suggested].

For default configuration and haxe LSP server setup instructions, see
[nvim-lspconfig server configurations][lspconfig-servers].

```lua
require("lspconfig")["haxe_language_server"].setup {}
```


[haxe]: http://www.haxe.org
[vaxe]: https://github.com/jdonaldson/vaxe
[lspconfig-suggested]: https://github.com/neovim/nvim-lspconfig#suggested-configuration
[lspconfig-servers]: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#haxe_language_server
