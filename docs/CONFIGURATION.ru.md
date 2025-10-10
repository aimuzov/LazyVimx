# Руководство по конфигурации

> [!TIP]
> **🇬🇧 English version:** [CONFIGURATION.md](CONFIGURATION.md)

Полное руководство по настройке LazyVimx.

## Содержание

- [Быстрый старт](#быстрый-старт)
- [Функция Setup](#функция-setup)
- [Конфигурация цветовой схемы](#конфигурация-цветовой-схемы)
- [Группы буферов](#группы-буферов)
- [Включение дополнений](#включение-дополнений)
- [Опции Vim](#опции-vim)
- [Конфигурация интеграций](#конфигурация-интеграций)
- [Расширенная конфигурация](#расширенная-конфигурация)

## Быстрый старт

### Минимальная настройка

```lua
-- In your lua/config/lazy.lua
return {
	spec = {
		{ import = "lazyvimx.boot" },
	},
}
```

Это даст вам LazyVimx с настройками по умолчанию и сделает все дополнения доступными через `:LazyExtras`.

### Рекомендуемая настройка

```lua
-- In your lua/config/lazy.lua
return {
	spec = {
		{ import = "lazyvimx.boot" },
		{ import = "lazyvimx.extras.core.all" },  -- Enable all enhancements
	},
}
```

### Пользовательская настройка

```lua
-- Create lua/config/lazyvimx.lua
require("lazyvimx").setup({
	colorscheme = "catppuccin",
	colorscheme_flavors = {
		catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
	},
	bufferline_groups = {
		["React"] = "%.tsx$",
	},
})
```

## Функция Setup

Функция setup принимает таблицу конфигурации, которая глубоко объединяется с настройками по умолчанию.

### Сигнатура функции

```lua
require("lazyvimx").setup(opts?: table)
```

### Схема конфигурации

```lua
{
	-- Base colorscheme name
	colorscheme: string,

	-- Light/dark variants for each colorscheme
	colorscheme_flavors: {
		[colorscheme_name: string]: { dark_variant: string, light_variant: string }
	},

	-- Custom buffer groups for bufferline
	bufferline_groups: {
		[group_name: string]: pattern: string  -- Lua pattern
	}
}
```

### Конфигурация по умолчанию

```lua
{
	colorscheme = "catppuccin",

	colorscheme_flavors = {
		catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
		tokyonight = { "tokyonight-storm", "tokyonight-day" },
	},

	bufferline_groups = {
		-- Empty by default
	},
}
```

## Конфигурация цветовой схемы

LazyVimx поддерживает автоматическое переключение между светлой и темной темами на основе системных настроек (только macOS).

### Базовая конфигурация

```lua
require("lazyvimx").setup({
	colorscheme = "catppuccin",
})
```

### Варианты (Flavors)

Определите светлый и темный варианты для каждой цветовой схемы:

```lua
require("lazyvimx").setup({
	colorscheme = "catppuccin",
	colorscheme_flavors = {
		catppuccin = {
			"catppuccin-macchiato",  -- [1] Dark variant
			"catppuccin-latte",      -- [2] Light variant
		},
	},
})
```

Система автоматически выбирает:

- Индекс 1 (темный) когда macOS в темном режиме
- Индекс 2 (светлый) когда macOS в светлом режиме

### Поддерживаемые цветовые схемы

#### Catppuccin

```lua
colorscheme_flavors = {
	catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
	-- Or use other variants:
	-- catppuccin = { "catppuccin-mocha", "catppuccin-latte" },
	-- catppuccin = { "catppuccin-frappe", "catppuccin-latte" },
}
```

Доступные варианты:

- `catppuccin-mocha` (самый темный)
- `catppuccin-macchiato` (темный)
- `catppuccin-frappe` (средне-темный)
- `catppuccin-latte` (светлый)

#### Tokyo Night

```lua
colorscheme_flavors = {
	tokyonight = { "tokyonight-storm", "tokyonight-day" },
	-- Or use other variants:
	-- tokyonight = { "tokyonight-night", "tokyonight-day" },
	-- tokyonight = { "tokyonight-moon", "tokyonight-day" },
}
```

Доступные варианты:

- `tokyonight-night` (самый темный)
- `tokyonight-storm` (темный)
- `tokyonight-moon` (средне-темный)
- `tokyonight-day` (светлый)

### Пользовательские цветовые схемы

Добавьте свои собственные цветовые схемы:

```lua
require("lazyvimx").setup({
	colorscheme = "gruvbox",
	colorscheme_flavors = {
		gruvbox = { "gruvbox-dark", "gruvbox-light" },
	},
})
```

**Примечание:** Пользовательские цветовые схемы не будут иметь настроек темы LazyVimx, если вы не создадите для них модули переопределения.

### Ручное переключение темы

```vim
:colorscheme catppuccin-latte
:colorscheme tokyonight-storm
```

### Автопереключение при смене системной темы

Включите переопределение:

```lua
{ import = "lazyvimx.extras.core.overrides" }
-- Or specifically:
{ import = "lazyvimx.overrides.lazyvim.auto-switch-colorscheme-on-signal" }
```

Это прослушивает события `Signal` и автоматически переключает темы.

## Группы буферов

Организуйте буферы в bufferline с помощью пользовательских групп.

### Конфигурация

```lua
require("lazyvimx").setup({
	bufferline_groups = {
		["Group Name"] = "pattern",  -- Lua pattern matching
	},
})
```

### Примеры

#### По расширению файла

```lua
bufferline_groups = {
	["TypeScript"] = "%.tsx?$",      -- .ts or .tsx files
	["JavaScript"] = "%.jsx?$",      -- .js or .jsx files
	["Styles"] = "%.s?css$",         -- .css or .scss files
	["Markdown"] = "%.md$",          -- .md files
}
```

#### По директории

```lua
bufferline_groups = {
	["Components"] = "components/",
	["Pages"] = "pages/",
	["Utils"] = "utils/",
}
```

#### По шаблону файла

```lua
bufferline_groups = {
	["Tests"] = "%.test%.",          -- Any .test. file
	["Specs"] = "%.spec%.",          -- Any .spec. file
	["Config"] = "config%.",         -- Files starting with config.
}
```

#### Сложные шаблоны

```lua
bufferline_groups = {
	["React"] = "%.tsx$",
	["Styles"] = "%.s?css$",
	["Tests"] = "%.test%.tsx?$",
	["API"] = "api/",
	["Components"] = "components/.*%.tsx$",
}
```

### Встроенные группы

LazyVimx предоставляет эти группы по умолчанию:

- **Pinned**: Вручную закрепленные буферы
- **Ungrouped**: Буферы, не соответствующие ни одному шаблону
- **Terminal**: Терминальные буферы

### Отображение групп

Группы появляются в bufferline с:

- Разделителем перед группой
- Меткой группы
- Сгруппированными буферами
- Разделителем после группы

Включите переопределение для использования групп:

```lua
{ import = "lazyvimx.overrides.bufferline.add-groups" }
-- Or via core overrides:
{ import = "lazyvimx.extras.core.overrides" }
```

## Включение дополнений

Дополнения - это опциональные модули функций, которые расширяют возможности.

### Способ 1: Через UI LazyVim Extras

1. Откройте выбор дополнений: `:LazyExtras`
2. Найдите дополнения LazyVimx под `[ 󰬟 ]`
3. Включите желаемые дополнения с помощью `x`
4. Перезапустите Neovim

### Способ 2: Через спецификацию плагина

Включите отдельные дополнения:

```lua
-- In lua/plugins/lazyvimx.lua
return {
	{ import = "lazyvimx.extras.ui.better-diagnostic" },
	{ import = "lazyvimx.extras.ui.winbar" },
	{ import = "lazyvimx.extras.motions.langmapper" },
}
```

### Способ 3: Включить все дополнения

```lua
{ import = "lazyvimx.extras.core.extras" }
```

Это включает все 43 дополнения сразу.

### Способ 4: Импорт по категориям

Импорт по категориям (примечание: не все категории поддерживают это):

```lua
{ import = "lazyvimx.extras.ui" }      -- All UI extras
{ import = "lazyvimx.extras.git" }     -- All Git extras
```

### Рекомендуемая базовая настройка

```lua
{ import = "lazyvimx.extras.core.all" }
```

Это включает:

- Все переопределения
- Все дополнения
- Пользовательские горячие клавиши
- Уведомления о рекомендуемых дополнениях

## Опции Vim

LazyVimx автоматически настраивает различные опции Vim через `boot.lua`.

### Отступы

```lua
vim.o.expandtab = false      -- Use tabs, not spaces
vim.o.smarttab = true        -- Smart tab behavior
vim.o.shiftwidth = 4         -- Indent with 4 columns
vim.o.tabstop = 4            -- Tab displays as 4 columns
vim.o.softtabstop = 4        -- Tab key inserts 4 columns
vim.o.autoindent = true      -- Copy indent from current line
```

### Резервные копии и файлы подкачки

```lua
vim.o.swapfile = false       -- Disable swap files
vim.o.backup = true          -- Enable backups
vim.o.backupdir = "~/.local/state/nvim/backup/"
```

### Прозрачность UI

```lua
vim.o.pumblend = 15          -- Popup menu transparency
vim.o.winblend = 5           -- Floating window transparency
```

### Тайм-ауты

```lua
vim.o.timeout = true
vim.o.timeoutlen = 500       -- Wait 500ms for mapped sequence
vim.o.ttimeoutlen = 0        -- No timeout for key codes
```

### Визуальные элементы

```lua
vim.o.showmode = false       -- Don't show mode (shown in statusline)
vim.o.showbreak = "↪"        -- Line wrap indicator
vim.o.conceallevel = 2       -- Conceal text with replacements
vim.o.smoothscroll = true    -- Smooth scrolling
```

### Символы списка

```lua
vim.opt.listchars = {
	eol = " ",                 -- Hidden end of line
	space = " ",               -- Hidden spaces
	tab = "  "                 -- Hidden tabs
}
vim.opt.fillchars:append({
	diff = " ",                -- Empty diff filler
	eob = " "                  -- Empty end of buffer
})
```

### Другие опции

```lua
vim.o.autochdir = false      -- Don't auto-change directory
vim.o.spelllang = ""         -- No spell check by default
vim.o.shell = vim.fn.getenv("SHELL")  -- Use system shell
```

### Переопределение опций

Создайте `lua/config/options.lua`:

```lua
-- This runs after LazyVimx options
vim.o.expandtab = true       -- Use spaces instead of tabs
vim.o.shiftwidth = 2         -- 2-space indentation
vim.o.tabstop = 2
```

Или используйте autocmd:

```lua
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimOptionsDefaults",
	callback = function()
		vim.o.expandtab = true
		vim.o.shiftwidth = 2
	end,
})
```

## Конфигурация интеграций

### Интеграция с Chezmoi

LazyVimx автоматически синхронизирует конфигурацию Neovim с chezmoi при обновлениях.

#### Настройка

Установите переменную окружения:

```bash
export DOTFILES_SRC_PATH="$HOME/.local/share/chezmoi"
```

Добавьте в профиль вашей оболочки (`~/.zshrc`, `~/.bashrc`):

```bash
export DOTFILES_SRC_PATH="$HOME/.local/share/chezmoi"
```

#### Что синхронизируется

При выполнении `:LazyUpdate`, эти файлы добавляются в chezmoi:

- `~/.config/nvim/lazy-lock.json`
- `~/.config/nvim/lazyvim.json`

#### Включение интеграции

```lua
{ import = "lazyvimx.overrides.lazyvim.auto-apply-chezmoi-on-lazy-update" }
-- Or via core overrides:
{ import = "lazyvimx.extras.core.overrides" }
```

#### Отключение интеграции

Не импортируйте переопределение или установите `DOTFILES_SRC_PATH` пустым.

### Интеграция с VSCode

При запуске Neovim внутри VSCode (через расширение vscode-neovim).

#### Индикатор режима

Требуется расширение VSCode: `nvim-mode-indicator`

LazyVimx автоматически синхронизирует режим Neovim со строкой состояния VSCode.

#### Настройка горячих клавиш

Некоторые горячие клавиши отключены в режиме VSCode:

- Переименование использует нативное переименование VSCode
- Терминал использует LazyVim.terminal вместо Snacks
- Некоторые клавиши навигации изменены

#### Включение режима VSCode

Включается автоматически, когда `vim.g.vscode` равен true (устанавливается vscode-neovim).

```lua
{ import = "lazyvimx.overrides.lazyvim.vscode" }
-- Or via core overrides:
{ import = "lazyvimx.extras.core.overrides" }
```

### Интеграция с macOS

#### Определение темы

Автоматически на macOS. Считывает системные настройки:

```bash
defaults read -g AppleInterfaceStyle
```

Возвращает "Dark" или пусто (светлый режим).

#### Операции с файлами

Neo-tree использует специфичные для macOS команды:

- команда `trash` для безопасного удаления (если доступна)
- команда `open` для открытия файлов в приложении по умолчанию

#### Требования

Установите `trash` для безопасного удаления файлов:

```bash
brew install trash
```

## Расширенная конфигурация

### Порядок загрузки

Понимание порядка загрузки помогает с продвинутой настройкой:

1. `boot.lua` - Начальная загрузка и глобальная настройка
2. Плагины LazyVim - Базовая конфигурация LazyVim
3. Главный модуль LazyVimx - `require("lazyvimx").setup()`
4. Дополнения - Опциональные функции, которые вы импортировали
5. Переопределения - Настройки плагинов
6. Пользовательские плагины - Ваши файлы `lua/plugins/*.lua`

### Конфигурация для отдельного проекта

Включите дополнение для локальной конфигурации:

```lua
{ import = "lazyvimx.extras.perf.local-config" }
```

Затем создайте в вашем проекте:

```lua
-- .nvim.lua or .config/nvim.lua
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- Project-specific settings
require("lspconfig").tsserver.setup({
	-- Project-specific LSP config
})
```

### Условные дополнения

Включайте дополнения условно:

```lua
return {
	{
		import = "lazyvimx.extras.ui.winbar",
		cond = function()
			return not vim.g.vscode
		end,
	},
}
```

### Пользовательские горячие клавиши

Переопределите горячие клавиши LazyVimx:

```lua
-- lua/plugins/keys.lua
return {
	{
		"LazyVim/LazyVim",
		keys = {
			-- Disable LazyVimx keybinding
			{ "<leader>\\", false },

			-- Add your own
			{ "<leader>|", "<cmd>vsplit<cr>", desc = "Vertical Split" },
		},
	},
}
```

### Расширение конфигурации

Добавьте пользовательские опции конфигурации:

```lua
-- lua/config/lazyvimx.lua
require("lazyvimx").setup({
	colorscheme = "catppuccin",

	-- Custom options
	my_custom_option = "value",
	my_feature_enabled = true,
})

-- Access in your plugins
local config = require("lazyvimx").config
if config.my_feature_enabled then
	-- Do something
end
```

### Настройка темы

Переопределите подсветку темы:

```lua
-- lua/plugins/colorscheme.lua
return {
	{
		"catppuccin/nvim",
		opts = {
			custom_highlights = function(colors)
				return {
					Comment = { fg = colors.overlay1 },
					-- More custom highlights
				}
			end,
		},
	},
}
```

### Отключение переопределений

Импортируйте ядро без конкретного переопределения:

```lua
-- Import overrides manually, skipping some
return {
	{ import = "lazyvimx.overrides.lazyvim" },
	{ import = "lazyvimx.overrides.snacks" },
	-- Skip bufferline overrides
	-- { import = "lazyvimx.overrides.bufferline" },
	{ import = "lazyvimx.overrides.other" },
}
```

### Отладка конфигурации

Проверьте загруженную конфигурацию:

```vim
:lua vim.print(require("lazyvimx").config)
```

Проверьте загруженные дополнения:

```vim
:lua vim.print(require("lazy.core.config").spec.modules)
```

Проверьте, загружено ли конкретное дополнение:

```lua
local has_extra = require("lazyvimx.util.general").has_extra("ui.winbar")
print(has_extra)
```

## Примеры конфигурации

### Минимальная

```lua
-- lua/config/lazy.lua
return {
	spec = {
		{ import = "lazyvimx.boot" },
	},
}
```

### Стандартная

```lua
-- lua/config/lazy.lua
return {
	spec = {
		{ import = "lazyvimx.boot" },
		{ import = "lazyvimx.extras.core.all" },
	},
}

-- lua/config/lazyvimx.lua
require("lazyvimx").setup({
	colorscheme = "catppuccin",
})
```

### Полнофункциональная

```lua
-- lua/config/lazy.lua
return {
	spec = {
		{ import = "lazyvimx.boot" },
		{ import = "lazyvimx.extras.core.all" },
	},
}

-- lua/config/lazyvimx.lua
require("lazyvimx").setup({
	colorscheme = "catppuccin",
	colorscheme_flavors = {
		catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
	},
	bufferline_groups = {
		["React"] = "%.tsx$",
		["Styles"] = "%.s?css$",
		["Tests"] = "%.test%.",
		["API"] = "api/",
	},
})
```

### Избирательные дополнения

```lua
-- lua/config/lazy.lua
return {
	spec = {
		{ import = "lazyvimx.boot" },

		-- Core
		{ import = "lazyvimx.extras.core.overrides" },
		{ import = "lazyvimx.extras.core.keys" },

		-- UI
		{ import = "lazyvimx.extras.ui.better-diagnostic" },
		{ import = "lazyvimx.extras.ui.winbar" },
		{ import = "lazyvimx.extras.ui.better-float" },

		-- Motions
		{ import = "lazyvimx.extras.motions.langmapper" },

		-- Git
		{ import = "lazyvimx.extras.git.conflicts" },
	},
}
```

## Устранение неполадок

### Дополнения не отображаются в :LazyExtras

Убедитесь, что LazyVimx загружен:

```lua
{ import = "lazyvimx.boot" }
```

Проверьте, что дополнения зарегистрированы:

```vim
:lua vim.print(require("lazyvim.util.extras").sources)
```

### Тема не переключается

1. Проверьте систему macOS:

   ```bash
   defaults read -g AppleInterfaceStyle
   ```

2. Проверьте конфигурацию вариантов:

   ```vim
   :lua vim.print(require("lazyvimx").config.colorscheme_flavors)
   ```

3. Проверьте, что переопределение загружено:
   ```lua
	 { import = "lazyvimx.overrides.lazyvim.auto-switch-colorscheme-on-signal" }
	 ```

### Группы буферов не работают

1. Включите переопределение:

   ```lua
	 { import = "lazyvimx.overrides.bufferline.add-groups" }
	 ```

2. Проверьте конфигурацию:

   ```vim
   :lua vim.print(require("lazyvimx").config.bufferline_groups)
   ```

3. Проверьте шаблон:
   ```lua
	 :lua print(vim.fn.expand("%"):match("%.tsx$"))
	 ```

### Chezmoi не синхронизируется

1. Проверьте переменную окружения:

   ```bash
   echo $DOTFILES_SRC_PATH
   ```

2. Проверьте, что путь существует:

   ```bash
   ls -la $DOTFILES_SRC_PATH
   ```

3. Проверьте, что переопределение загружено:
   ```lua
	 { import = "lazyvimx.overrides.lazyvim.auto-apply-chezmoi-on-lazy-update" }
	 ```

## Следующие шаги

- См. [EXTRAS.md](EXTRAS.md) для подробной документации по дополнениям
- См. [API.md](API.md) для справки по служебным функциям
- См. [ARCHITECTURE.md](ARCHITECTURE.md) для технических деталей
