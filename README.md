# LazyVimx

> [!TIP]
> **🇷🇺 Русская версия:** [README.ru.md](README.ru.md)

**Enhanced LazyVim configuration with extensive customizations, UI improvements, and workflow optimizations.**

LazyVimx is a comprehensive enhancement layer built on top of [LazyVim](https://github.com/LazyVim/LazyVim) that provides 47 optional extras and 33 override modules to create a highly polished, feature-rich Neovim experience.

## ✨ Features

### 🎨 Visual Enhancements
- **Advanced theming** with deep customization for Catppuccin and Tokyo Night
- **Automatic theme switching** based on system light/dark mode
- **Enhanced UI components** with consistent rounded borders and custom icons
- **Better statusline** with custom mode indicators and visual elements
- **Improved dashboard** with custom ASCII art and styled sections
- **Symbol usage indicators** showing references and implementations inline

### 🚀 Productivity Boosters
- **Smart buffer management** with groups, automatic cleanup, and tab scoping
- **Enhanced code navigation** with tree-sitter aware motions
- **Better diagnostics display** with inline messages
- **Git workflow improvements** including GitLab MR integration and conflict resolution
- **Advanced completion** with Blink.cmp integration
- **AI coding assistant** support via Avante

### ⚙️ Quality of Life
- **Russian keyboard support** via langmapper
- **Repeatable actions** for buffer operations
- **Auto-save to chezmoi** on LazyVim updates
- **Local project configuration** support
- **VSCode integration** for hybrid workflows
- **Performance optimizations** including inactive LSP cleanup

## 📦 Installation

### Prerequisites
- Neovim >= 0.10.0

### Quick Start

1. **Create `~/.config/nvim/init.lua` with the following content:**

```lua
local lazy_opts = {
  spec = { { "aimuzov/LazyVimx", import = "lazyvimx.boot" } },

  install = { colorscheme = { "catppuccin", "tokyonight" } },
  checker = { enabled = true, notify = false },
  change_detection = { enabled = false },
  diff = { cmd = "diffview.nvim" },

  ui = {
    backdrop = 100,
    border = "rounded",
    icons = { keys = "󰥻" },
  },
}

-- Bootstrap lazy.nvim
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_url = "https://github.com/folke/lazy.nvim.git"

if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazy_url, lazy_path })
end

vim.opt.rtp:prepend(lazy_path)

require("lazy").setup(lazy_opts)
```

2. **Start Neovim:**

```bash
nvim
```

That's it! LazyVimx will automatically install LazyVim and all required plugins on first launch.

3. **Configure LazyVimx (optional):**

Create `~/.config/nvim/lua/config/lazyvimx.lua`:

```lua
require("lazyvimx").setup({
  colorscheme = "catppuccin",
  colorscheme_flavors = {
    catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
    tokyonight = { "tokyonight-storm", "tokyonight-day" },
  },
  bufferline_groups = {
    -- Define custom buffer groups
    -- ["name"] = "regex_pattern",
  },
})
```

4. **Enable extras:**

Use the LazyVim extras UI (`:LazyExtras`) to enable LazyVimx extras, or add them to your config:

```lua
-- In lua/plugins/extras.lua
return {
  { import = "lazyvimx.extras.core.all" },  -- Recommended: includes all core enhancements
  { import = "lazyvimx.extras.ui.better-diagnostic" },
  { import = "lazyvimx.extras.motions.langmapper" },
  -- Add more extras as needed
}
```

## 🗂️ Project Structure

```
LazyVimx/
├── lua/lazyvimx/
│   ├── boot.lua              # Bootstrap configuration
│   ├── init.lua              # Main module with setup function
│   ├── extras/               # Optional feature modules (47 total)
│   │   ├── core/            # Core enhancements (overrides, keys)
│   │   ├── ui/              # UI improvements (18 modules)
│   │   ├── coding/          # Coding tools (2 modules)
│   │   ├── motions/         # Motion enhancements (6 modules)
│   │   ├── buf/             # Buffer management (3 modules)
│   │   ├── git/             # Git integration (4 modules)
│   │   ├── lang/            # Language support (2 modules)
│   │   ├── linting/         # Linting tools (2 modules)
│   │   ├── ai/              # AI assistants (1 module)
│   │   ├── dap/             # Debugging (1 module)
│   │   ├── perf/            # Performance (2 modules)
│   │   └── test/            # Testing (1 module)
│   ├── overrides/           # Plugin customizations (33 total)
│   │   ├── lazyvim/         # LazyVim core overrides (8 modules)
│   │   ├── snacks/          # Snacks.nvim overrides (7 modules)
│   │   ├── bufferline/      # Bufferline overrides (6 modules)
│   │   └── other/           # Other plugins (13 modules)
│   └── util/                # Utility functions
│       ├── general.lua      # General utilities
│       └── layout.lua       # Layout management
└── init.lua                 # Entry point guard
```

## 🎯 Core Extras

### Recommended Setup

Enable all core enhancements with a single import:

```lua
{ import = "lazyvimx.extras.core.all" }
```

This includes:
- **Overrides**: All plugin customizations
- **Extras**: All available extras
- **Keys**: Custom keybindings
- **Notifications**: Missing extras warnings

### Individual Core Components

```lua
{ import = "lazyvimx.extras.core.overrides" }  -- Plugin overrides
{ import = "lazyvimx.extras.core.extras" }     -- All extras
{ import = "lazyvimx.extras.core.keys" }       -- Custom keybindings
```

## 📚 Documentation

- **[ARCHITECTURE.md](docs/ARCHITECTURE.md)** - Technical architecture and implementation details ([🇷🇺](docs/ARCHITECTURE.ru.md))
- **[CONFIGURATION.md](docs/CONFIGURATION.md)** - Configuration guide and options ([🇷🇺](docs/CONFIGURATION.ru.md))
- **[EXTRAS.md](docs/EXTRAS.md)** - Complete guide to all 47 extras ([🇷🇺](docs/EXTRAS.ru.md))
- **[API.md](docs/API.md)** - API reference and utility functions ([🇷🇺](docs/API.ru.md))

## 🎨 Highlighted Extras

### UI Enhancements
- `ui.better-diagnostic` - Inline diagnostic messages
- `ui.better-float` - Consistent floating window styles
- `ui.symbol-usage` - Reference/definition counters
- `ui.better-explorer` - Yazi file manager integration
- `ui.winbar` - File path in window bar

### Coding Tools
- `coding.emmet` - HTML/CSS expansion
- `coding.comments` - Enhanced commenting with documentation generation

### Motions
- `motions.langmapper` - **Russian keyboard support**
- `motions.better-move-between-words` - Subword navigation
- `motions.sibling-swap` - Tree-sitter based swapping
- `motions.splitting-joining-blocks` - Smart block manipulation

### Git Integration
- `git.gitlab` - GitLab MR review
- `git.conflicts` - Visual conflict resolution
- `git.remote-view` - Open remote repos locally

### AI & Testing
- `ai.avante` - Cursor AI IDE emulation
- `test.jest` - Jest testing framework

## ⌨️ Key Mappings

LazyVimx adds numerous custom keybindings. Some highlights:

| Key | Mode | Description |
|-----|------|-------------|
| `d` | n, v | Delete without yanking |
| `<C-S-j/k>` | n, i, v | Move lines up/down |
| `<leader>\` | n | Split window right |
| `<leader>fy` | n | Open Yazi file manager |
| `<leader>gl*` | n | GitLab operations |
| `<F5>` | n | DAP continue |
| `<F10>` | n | DAP step over |
| `<C-,/.>` | n | Swap siblings |
| `gr` | n | Go to references (glance) |
| `<leader>cr` | n | Rename (live-rename) |

See [extras/core/keys.lua](./lua/lazyvimx/extras/core/keys.lua) for complete list.

## 🔧 Configuration

### Colorscheme

LazyVimx supports automatic light/dark variant switching:

```lua
require("lazyvimx").setup({
  colorscheme = "catppuccin",
  colorscheme_flavors = {
    catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
  },
})
```

The system automatically switches between dark (index 1) and light (index 2) based on system theme.

### Buffer Groups

Define custom bufferline groups:

```lua
require("lazyvimx").setup({
  bufferline_groups = {
    ["React"] = "%.tsx$",
    ["Tests"] = "%.test%.",
  },
})
```

## 🤝 Integration

### Chezmoi
LazyVimx automatically syncs `lazy-lock.json` and `lazyvim.json` to chezmoi on updates if `DOTFILES_SRC_PATH` is set.

### VSCode
Special VSCode integration mode with:
- Mode indicator synchronization
- Adjusted keybindings
- Native VSCode rename integration

### macOS
- System theme detection for auto-switching colorschemes
- Trash integration for safe file deletion in neo-tree
- System open commands

## 🌟 Philosophy

LazyVimx enhances LazyVim by:
1. **Preserving LazyVim's design** - All enhancements are opt-in via extras
2. **Maintaining consistency** - Unified theming and visual language
3. **Improving usability** - Smart defaults and workflow optimizations
4. **Supporting customization** - Flexible configuration system
5. **Ensuring quality** - Careful attention to polish and detail

## 📊 Stats

- **47 optional extras** across 11 categories
- **33 override modules** for deep customization
- **150+ custom highlights** for Catppuccin theme
- **70+ custom highlights** for Tokyo Night theme
- **30+ custom keybindings**

## 🔗 Links

- [Usage Example](https://github.com/aimuzov/dotfiles/blob/main/dot_config/nvim/init.lua#L6-L7)
- [Discussion](https://t.me/aimuzov_dotfiles)
- [LazyVim](https://github.com/LazyVim/LazyVim)

## 📈 Activity

![Repo Activity](https://repobeats.axiom.co/api/embed/f5453bcfc3ad93005a4d3b73d0681450ff7ca5d3.svg "Repobeats analytics image")

## 📄 License

This project follows the same license as LazyVim.

## 🙏 Credits

Built on top of the excellent [LazyVim](https://github.com/LazyVim/LazyVim) by [folke](https://github.com/folke).

---

**Author**: Aleksey Imuzov ([@aimuzov](https://github.com/aimuzov))
