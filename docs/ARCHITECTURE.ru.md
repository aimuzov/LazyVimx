# Архитектура

> [!TIP]
> **🇬🇧 English version:** [ARCHITECTURE.md](ARCHITECTURE.md)

Этот документ описывает техническую архитектуру и детали реализации LazyVimx.

## Содержание

- [Обзор](#обзор)
- [Процесс загрузки](#процесс-загрузки)
- [Система модулей](#система-модулей)
- [Система конфигурации](#система-конфигурации)
- [Система extras](#система-extras)
- [Система overrides](#система-overrides)
- [Утилитные модули](#утилитные-модули)
- [Точки интеграции](#точки-интеграции)

## Обзор

LazyVimx спроектирован как дополнительный слой поверх LazyVim, предоставляющий опциональные extras и overrides без нарушения базовой конфигурации LazyVim. Он следует модульной архитектуре, где все улучшения являются опциональными.

### Принципы проектирования

1. **Неинвазивность**: Все функции опциональны и не вмешиваются в ядро LazyVim
2. **Модульность**: Каждая функция изолирована в собственном модуле
3. **Расширяемость**: Пользователи могут легко добавлять свои собственные настройки
4. **Производительность**: Отложенная загрузка и условная активация
5. **Интеграция**: Работает без проблем с chezmoi, VSCode и системными инструментами

## Процесс загрузки

Процесс загрузки обрабатывается файлом `lua/lazyvimx/boot.lua`, который является главной точкой входа:

### 1. Защита точки входа

`init.lua` в корне предотвращает прямое использование репозитория:

```lua:8
vim.api.nvim_echo({
  { "Do not use this repository directly\n", "ErrorMsg" },
  { "Please check the docs on how to get started with LazyVim (enhanced)\n", "WarningMsg" },
}, true, {})
```

### 2. Последовательность загрузки

**boot.lua** определяет спецификацию плагина, которую обрабатывает lazy.nvim:

```lua:98
return {
  { import = "system.plug", enabled = set_global },
  { import = "system.plug", enabled = vimopts_create_autocmd },
  { "LazyVim/LazyVim", opts = update_root_lsp_ignore },
  { "LazyVim/LazyVim", opts = insert_extras },
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  { "LazyVim/LazyVim", opts = set_colorscheme },
  { "aimuzov/LazyVimx", dependencies = { "LazyVim/LazyVim" }, vscode = true, config = true },
  { import = "plugins", enabled = has_plugins_dir },
}
```

### 3. Функции инициализации

#### Настройка глобальных переменных

```lua:13
local function set_global()
  vim.g.lazyvim_check_order = false
  vim.g.xtras_prios = {}
  vim.g.lazyvim_explorer = "neo-tree"
  return false
end
```

#### Конфигурация опций Vim

```lua:21
local function vimopts_set_values()
  vim.o.autochdir = false
  vim.o.swapfile = false
  vim.o.backup = true
  -- ... дополнительные опции
end
```

Ключевые конфигурации:

- **Отступы**: Табы с шириной 4 (без expandtab)
- **Прозрачность UI**: `pumblend = 15`, `winblend = 5`
- **Таймауты**: 500ms для маппингов, 0ms для кодов клавиш
- **Backup**: Включен с пользовательской директорией

#### Интеграция Extras

```lua:1
local function insert_extras()
  table.insert(require("lazyvim.util.extras").sources, {
    name = "[ 󰬟 ]",
    desc = "Some recipes (extras) for enhance lazyvim",
    module = "lazyvimx.extras",
  })
end
```

Это регистрирует LazyVimx extras в UI extras LazyVim (`:LazyExtras`).

#### Выбор цветовой схемы

```lua:9
local function set_colorscheme(_, opts)
  opts.colorscheme = require("lazyvimx.util.general").get_flavor()
end
```

Автоматически выбирает светлый/темный вариант на основе системной темы.

## Система модулей

### Главный модуль (`lua/lazyvimx/init.lua`)

Главный модуль предоставляет интерфейс конфигурации:

```lua:16
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", defaults, opts or {})
end
```

#### Конфигурация по умолчанию

```lua:3
local defaults = {
  colorscheme = "catppuccin",
  colorscheme_flavors = {
    catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
    tokyonight = { "tokyonight-storm", "tokyonight-day" },
  },
  bufferline_groups = {
    -- ["name"] = "regex",
  },
}
```

### Определение плагинов

```lua:67
local function has_plugins_dir()
  local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"

  if vim.fn.isdirectory(plugins_dir) == 1 then
    local files = vim.fn.glob(plugins_dir .. "/*.lua", 0, 1)
    return #files > 0
  end

  return false
end
```

Это позволяет пользовательским плагинам сосуществовать с LazyVimx.

## Система конфигурации

### Поток конфигурации

1. **Определены значения по умолчанию** в `lua/lazyvimx/init.lua`
2. **Загружена пользовательская конфигурация** через `require("lazyvimx").setup({})`
3. **Глубокое слияние** объединяет пользовательскую конфигурацию со значениями по умолчанию
4. **Конфигурация доступна** через `require("lazyvimx").config`

### Опции конфигурации

#### Управление цветовой схемой

```lua
colorscheme = "catppuccin"  -- Базовое имя цветовой схемы
colorscheme_flavors = {
	[colorscheme_name] = { dark_variant, light_variant }
}
```

**Логика выбора варианта** (`util/general.lua`):

```lua:52
function M.get_flavor(colorscheme)
  local config = require("lazyvimx").config
  local flavor_index = require("lazyvimx.util.general").theme_is_dark() and 1 or 2
  local flavor_list = config.colorscheme_flavors[colorscheme or config.colorscheme]
  local flavor_name = flavor_list[flavor_index]
  return flavor_name
end
```

#### Определение системной темы (macOS)

```lua:40
function M.theme_is_dark()
  local cmd_result = M.popen_get_result("defaults read -g AppleInterfaceStyle 2>&1")
  local theme_is_dark = cmd_result == "Dark"
  return theme_is_dark
end
```

#### Группы буферов

```lua
bufferline_groups = {
	["Group Name"] = "pattern",  -- Сопоставление с паттерном Lua
}
```

Используется в `overrides/bufferline/add-groups.lua` для организации буферов.

## Система extras

### Структура

Extras организованы по категориям в `lua/lazyvimx/extras/`:

```
extras/
├── core/        # Оркестрация и базовая функциональность
├── ui/          # Улучшения UI
├── coding/      # Инструменты для кодирования
├── motions/     # Улучшения навигации
├── buf/         # Управление буферами
├── git/         # Интеграция Git
├── lang/        # Поддержка языков
├── linting/     # Инструменты линтинга
├── ai/          # AI помощники
├── dap/         # Отладка
├── perf/        # Производительность
└── test/        # Тестирование
```

### Паттерн модуля Extra

Каждый extra - это модуль Lua, который возвращает спецификацию плагина:

```lua
-- Стандартная структура extra
return {
	{
		"plugin/name",
		opts = { ... },
		keys = { ... },
		dependencies = { ... },
	},
}
```

### Базовые Extras

#### `extras/core/all.lua`

Рекомендуемая точка входа, которая загружает все:

```lua:1
return {
  { import = "lazyvimx.extras.core.overrides" },
  { import = "lazyvimx.extras.core.extras" },
  { import = "lazyvimx.extras.core.keys" },
  { "folke/snacks.nvim", opts = function() ... end },
}
```

Также проверяет наличие рекомендуемых LazyVim extras и уведомляет, если они отсутствуют.

#### `extras/core/overrides.lua`

Импортирует все категории overrides:

```lua:1
return {
  recommended = true,
  { import = "lazyvimx.overrides.lazyvim" },
  { import = "lazyvimx.overrides.snacks" },
  { import = "lazyvimx.overrides.bufferline" },
  { import = "lazyvimx.overrides.other" },
}
```

#### `extras/core/extras.lua`

Центральный реестр всех 43 extras - единая точка импорта для всех функций.

#### `extras/core/keys.lua`

Пользовательские привязки клавиш, которые интегрируются с различными extras. Условно загружается в зависимости от того, какие extras включены.

### Условная загрузка

Extras используют условную загрузку для избежания ошибок:

```lua
-- Пример из ui/simple-mode.lua
local function is_not_simple_mode()
	return not is_simple_mode()
end

return {
	{ "nvim-neo-tree/neo-tree.nvim", optional = true, cond = is_not_simple_mode },
	{ "akinsho/bufferline.nvim", optional = true, cond = is_not_simple_mode },
}
```

### Определение Extra

Утилитная функция для проверки, загружен ли extra:

```lua:61
function M.has_extra(extra)
  local Config = require("lazyvim.config")
  local modname = "lazyvimx.extras." .. extra

  return vim.tbl_contains(require("lazy.core.config").spec.modules, modname)
    or vim.tbl_contains(Config.json.data.extras, modname)
end
```

## Система overrides

Overrides изменяют существующие конфигурации плагинов без их полной замены.

### Структура

```
overrides/
├── lazyvim/       # Кастомизация ядра LazyVim
├── snacks/        # Улучшения Snacks.nvim
├── bufferline/    # Модификации Bufferline.nvim
└── other/         # Кастомизация других плагинов
```

### Паттерны Override

#### 1. Расширение опций

Наиболее распространенный паттерн - расширение опций плагина:

```lua
return {
	{
		"plugin/name",
		optional = true,
		opts = {
			option1 = value1,
			option2 = value2,
		},
	},
}
```

#### 2. Переопределение функций

Замена конкретных функций:

```lua
-- Пример из overrides/lazyvim/lualine-pretty-path.lua
return {
	{
		"LazyVim/LazyVim",
		opts = function()
			local lualine = require("lualine_require").require("lualine.components.filetype")

			LazyVim.lualine.pretty_path = function(opts)
				-- Пользовательская реализация
			end
		end,
	},
}
```

#### 3. Overrides на основе Autocmd

Динамические модификации во время выполнения:

```lua
-- Пример из overrides/lazyvim/auto-switch-colorscheme-on-signal.lua
return {
	{
		"LazyVim/LazyVim",
		opts = function()
			vim.api.nvim_create_autocmd("Signal", {
				callback = function()
					-- Переключение темы на основе системной
				end,
			})
		end,
	},
}
```

#### 4. Overrides на основе хуков

Изменение поведения плагина путем обертывания функций:

```lua
-- Пример из overrides/snacks/lazygit-fix-theme.lua
local original_open = Snacks.lazygit.open

Snacks.lazygit.open = function(opts)
	-- Установка окружения перед вызовом оригинала
	vim.env.LG_CONFIG_FILE = config_path
	return original_open(opts)
end
```

### Система импорта

Overrides используют импорты на уровне директории:

```
overrides/
└── lazyvim/
    ├── override1.lua
    ├── override2.lua
    └── init.lua  (опционально, для конфигурации на уровне директории)
```

Импортируется как:

```lua
{ import = "lazyvimx.overrides.lazyvim" }
```

Lazy.nvim автоматически загружает все `.lua` файлы в директории.

## Утилитные модули

### `util/general.lua`

Утилиты общего назначения:

#### Смешивание цветов

```lua:18
function M.color_blend(color_first, color_second, percentage)
  -- Смешивает два hex цвета по процентному соотношению
  -- Широко используется в кастомизации тем
end
```

#### Выполнение процессов

```lua:29
function M.popen_get_result(cmd)
  local cmd_handle = io.popen(cmd, "r")
  local cmd_result = cmd_handle ~= nil and cmd_handle:read("*a"):gsub("%s+$", ""):gsub("[\n\r]", "") or ""
  if cmd_handle ~= nil then cmd_handle:close() end
  return cmd_result
end
```

#### Интеграция с dotfiles

```lua:47
function M.get_dotfiles_path()
  local dotfiles_path = vim.fn.getenv("DOTFILES_SRC_PATH")
  return dotfiles_path ~= vim.NIL and dotfiles_path or ""
end
```

#### Определение темы

```lua:40
function M.theme_is_dark()
  local cmd_result = M.popen_get_result("defaults read -g AppleInterfaceStyle 2>&1")
  local theme_is_dark = cmd_result == "Dark"
  return theme_is_dark
end
```

### `util/layout.lua`

Управление компоновкой окон для боковых панелей:

```lua:3
local size = {
  left = 40,
  right = 40,
  top = 10,
  bottom = 10,
}
```

Используется edgy.nvim и diffview для согласованных размеров:

```lua:27
M.step = 3  -- Шаг изменения размера

function M.get_size(pos)
  return size[pos]
end

function M.increase_create(dir)
  return function(win)
    local step_signed = M.step * 1
    size[win.view.edgebar.pos] = win[dir] + step_signed
    win:resize(dir, step_signed)
  end
end
```

## Точки интеграции

### Интеграция с LazyVim

1. **Система Extras**: Регистрируется в UI extras LazyVim
2. **Слияние конфигурации**: Расширяет опции LazyVim
3. **Спецификации плагинов**: Совместимы со структурой плагинов LazyVim
4. **Утилитные функции**: Использует утилиты `LazyVim.*`

### Интеграция с Lazy.nvim

1. **Спецификация плагина**: Возвращает совместимые с lazy.nvim спецификации
2. **Система импорта**: Использует паттерн `{ import = "..." }`
3. **Опциональные плагины**: Использует `optional = true` для плавной деградации
4. **Условная загрузка**: Использует `cond` и `enabled` для умной загрузки

### Интеграция с Chezmoi

Автоматическая синхронизация при обновлении LazyVim:

```lua
-- overrides/lazyvim/auto-apply-chezmoi-on-lazy-update.lua
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyUpdate",
	callback = function()
		local dotfiles_path = require("lazyvimx.util.general").get_dotfiles_path()
		-- Добавление файлов в chezmoi
	end,
})
```

### Интеграция с VSCode

Специальный режим при работе в VSCode:

```lua
-- overrides/lazyvim/vscode.lua
if vim.g.vscode then
	-- Синхронизация индикатора режима
	vim.api.nvim_create_autocmd("ModeChanged", {
		callback = function()
			vim.fn.VSCodeNotify("nvim-mode-indicator.update", vim.fn.mode())
		end,
	})
end
```

### Интеграция с macOS

1. **Определение темы**: `defaults read -g AppleInterfaceStyle`
2. **Интеграция с корзиной**: Использует команду `trash` в neo-tree
3. **Системное открытие**: Команда `open` для файлов

## Вопросы производительности

### Отложенная загрузка

1. **Extras - opt-in**: Загружаются только при импорте
2. **Условные плагины**: Используют `optional = true`
3. **Проверки во время выполнения**: `has_extra()` предотвращает ошибки
4. **Загрузка по событиям**: Autocmds для отложенной инициализации

### Оптимизация памяти

1. **Очистка неактивных LSP**: `extras/perf/stop-inactive-lsp.lua`
2. **Жизненный цикл буферов**: Автоматическое удаление неактивных буферов
3. **Отключенные анимации**: `overrides/snacks/disable-animation.lua`

### Оптимизация запуска

1. **Без активной загрузки**: Все extras загружаются по требованию
2. **Защита плагинов**: Проверка доступности плагина перед использованием
3. **Отложенная конфигурация**: Использование autocmds и lazy callbacks

## Точки расширения

### Добавление пользовательских Extras

Создайте новый модуль extra:

```lua
-- lua/lazyvimx/extras/category/my-extra.lua
return {
	{
		"plugin/name",
		opts = { ... },
	},
}
```

Добавьте в `extras/core/extras.lua`:

```lua
{ import = "lazyvimx.extras.category.my-extra" },
```

### Добавление пользовательских Overrides

Создайте модуль override:

```lua
-- lua/lazyvimx/overrides/category/my-override.lua
return {
	{
		"plugin/name",
		optional = true,
		opts = { ... },
	},
}
```

Будет автоматически загружен при импорте категории.

### Пользовательская конфигурация

Расширьте главную конфигурацию:

```lua
require("lazyvimx").setup({
	colorscheme = "tokyonight",
	custom_option = "value",  -- Доступно как require("lazyvimx").config.custom_option
})
```

## Отладка и разработка

### Проверка загруженных Extras

```lua
:lua vim.print(require("lazy.core.config").spec.modules)
```

### Инспектирование конфигурации

```lua
:lua vim.print(require("lazyvimx").config)
```

### Перезагрузка модулей

```lua
:lua package.loaded["lazyvimx"] = nil
:lua package.loaded["lazyvimx.util.general"] = nil
```

## Заключение

Архитектура LazyVimx построена на модульности, опциональных улучшениях и глубокой интеграции с LazyVim. Система позволяет пользователям выбирать функции, сохраняя при этом целостный, отполированный опыт. Все компоненты спроектированы для совместной работы, оставаясь при этом достаточно независимыми для выборочного использования.
