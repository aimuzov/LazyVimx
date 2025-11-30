# Contributing to LazyVimx

[Русская версия](CONTRIBUTING.ru.md)

First off, thank you for considering contributing to LazyVimx! It's people like you that make LazyVimx such a great tool.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Project Structure](#project-structure)
- [Creating Extras](#creating-extras)
- [Creating Overrides](#creating-overrides)
- [Coding Guidelines](#coding-guidelines)
- [Commit Messages](#commit-messages)
- [Pull Request Process](#pull-request-process)

## Code of Conduct

This project and everyone participating in it is governed by respect and professionalism. Be kind, be constructive, and help us build an amazing tool together.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR-USERNAME/LazyVimx.git`
3. Create a new branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Test your changes thoroughly
6. Commit your changes (see [Commit Messages](#commit-messages))
7. Push to your fork: `git push origin feature/your-feature-name`
8. Open a Pull Request

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When creating a bug report, include:

- **Clear title** describing the issue
- **Detailed description** of the problem
- **Steps to reproduce** the behavior
- **Expected behavior** vs actual behavior
- **Screenshots** if applicable
- **Environment details**: Neovim version, OS, LazyVimx version
- **Configuration**: relevant parts of your config

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Clear title** describing the enhancement
- **Detailed description** of the proposed functionality
- **Use cases** and examples of how it would be used
- **Alternative approaches** you've considered
- **Additional context** or screenshots

### Adding Extras

Extras are optional feature modules that enhance LazyVim. They should:

- Be **optional** and not affect base functionality
- Follow the **existing pattern** from other extras
- Include **documentation** in EXTRAS.md
- Be **categorized** appropriately (ui, coding, motions, etc.)
- Be **tested** to ensure they work correctly

### Adding Overrides

Overrides modify existing plugin configurations. They should:

- Use `optional = true` for graceful degradation
- Not break functionality if the plugin is not installed
- Be well-documented with comments
- Follow existing patterns

### Improving Documentation

Documentation improvements are always welcome:

- Fix typos or clarify confusing sections
- Add examples or use cases
- Translate content (especially to Russian)
- Update outdated information
- Add missing documentation

## Development Setup

### Prerequisites

- Neovim >= 0.10.0
- Git
- Basic understanding of Lua and LazyVim

### Local Development

1. Clone the repository:
   ```bash
   git clone https://github.com/aimuzov/LazyVimx.git ~/.local/share/nvim/lazy/LazyVimx
   ```

2. Create a test configuration:
   ```lua
   -- ~/.config/nvim-test/init.lua
   local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
   vim.opt.rtp:prepend(lazy_path)
   
   require("lazy").setup({
     spec = {
       { dir = "~/.local/share/nvim/lazy/LazyVimx", import = "lazyvimx.boot" },
       { import = "lazyvimx.extras.core.all" },
     },
   })
   ```

3. Test your changes:
   ```bash
   NVIM_APPNAME=nvim-test nvim
   ```

## Project Structure

```
LazyVimx/
├── lua/lazyvimx/
│   ├── boot.lua              # Bootstrap configuration
│   ├── init.lua              # Main module with setup function
│   ├── extras/               # Optional feature modules (48 total)
│   │   ├── core/            # Core enhancements
│   │   ├── ui/              # UI improvements (19 modules)
│   │   ├── coding/          # Coding tools (2 modules)
│   │   ├── motions/         # Motion enhancements (6 modules)
│   │   ├── buf/             # Buffer management (3 modules)
│   │   ├── git/             # Git integration (4 modules)
│   │   ├── lang/            # Language support (2 modules)
│   │   ├── linting/         # Linting tools (2 modules)
│   │   ├── ai/              # AI assistants (1 module)
│   │   ├── dap/             # Debugging (1 module)
│   │   ├── perf/            # Performance (3 modules)
│   │   └── test/            # Testing (1 module)
│   ├── overrides/           # Plugin customizations (33 total)
│   │   ├── lazyvim/         # LazyVim core overrides (8 modules)
│   │   ├── snacks/          # Snacks.nvim overrides (7 modules)
│   │   ├── bufferline/      # Bufferline overrides (6 modules)
│   │   └── other/           # Other plugins (13 modules)
│   └── util/                # Utility functions
│       ├── general.lua      # General utilities
│       └── layout.lua       # Layout management
└── docs/                    # Documentation
```

## Creating Extras

### Extra Module Template

```lua
-- lua/lazyvimx/extras/category/my-extra.lua
return {
  {
    "plugin/name",
    opts = {
      -- Configuration options
    },
    keys = {
      -- Keybindings
    },
    dependencies = {
      -- Dependencies
    },
  },
}
```

### Steps to Create an Extra

1. **Choose category**: ui, coding, motions, buf, git, lang, linting, ai, dap, perf, or test
2. **Create file**: `lua/lazyvimx/extras/category/extra-name.lua`
3. **Write module**: Follow the template above
4. **Add to registry**: Include in `lua/lazyvimx/extras/core/extras.lua`
5. **Document**: Add entry to `docs/EXTRAS.md` with description, features, and usage
6. **Test**: Verify the extra works correctly
7. **Update count**: Increment extras count in README if adding new extra

### Extra Guidelines

- **Naming**: Use kebab-case for file names (e.g., `better-diagnostic.lua`)
- **Optional**: Always make plugins optional with `optional = true`
- **Dependencies**: Declare all dependencies explicitly
- **Conditionals**: Use `cond` for conditional loading
- **Documentation**: Include inline comments for complex logic

## Creating Overrides

### Override Module Template

```lua
-- lua/lazyvimx/overrides/category/my-override.lua
return {
  {
    "plugin/name",
    optional = true,
    opts = function(_, opts)
      -- Modify existing opts
      opts.new_option = value
      return opts
    end,
  },
}
```

### Override Guidelines

- **Optional**: Always use `optional = true`
- **Safe**: Check plugin existence before modifying
- **Documented**: Add comments explaining the override
- **Categorized**: Place in correct category (lazyvim, snacks, bufferline, other)

## Coding Guidelines

### Lua Style

- **Indentation**: Tabs (width 4)
- **Quotes**: Double quotes for strings
- **Line length**: Max 120 characters
- **Comments**: Explain "why", not "what"

### Good Practices

- **DRY**: Don't repeat yourself
- **KISS**: Keep it simple
- **Testing**: Test all changes
- **Documentation**: Document all public APIs
- **Backwards compatibility**: Don't break existing configs

### Example

```lua
-- Good
local function get_theme()
  local util = require("lazyvimx.util.general")
  return util.theme_is_dark() and "dark" or "light"
end

-- Bad
local function get_theme()
  if require("lazyvimx.util.general").theme_is_dark() == true then
    return "dark"
  else
    return "light"
  end
end
```

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

### Format

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### Examples

```bash
feat(ui): add better-diagnostic extra
fix(motions): resolve langmapper conflict with which-key
docs(readme): update installation instructions
refactor(util): simplify color blending function
```

## Pull Request Process

1. **Update documentation** for any user-facing changes
2. **Update CHANGELOG.md** under "Unreleased" section
3. **Update extras count** if you added/removed extras
4. **Test thoroughly** in a clean Neovim instance
5. **Ensure commits** follow conventional commits format
6. **Link issues** that the PR addresses
7. **Request review** from maintainers
8. **Address feedback** promptly and professionally

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Refactoring

## Checklist
- [ ] Documentation updated
- [ ] CHANGELOG.md updated
- [ ] Tested in clean environment
- [ ] Follows coding guidelines
- [ ] Commits follow conventional commits

## Related Issues
Closes #<issue_number>
```

## Questions?

If you have questions:

1. Check [FAQ.md](FAQ.md)
2. Check [existing issues](https://github.com/aimuzov/LazyVimx/issues)
3. Ask in [Discussions](https://t.me/aimuzov_dotfiles)
4. Open a new issue

## Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

Thank you for contributing! 🎉
