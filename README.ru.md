# LazyVimx

> [!TIP]
> **🇬🇧 English version:** [README.md](README.md)

**Расширенная конфигурация LazyVim с обширными настройками, улучшениями UI и оптимизацией рабочего процесса.**

LazyVimx — это комплексный слой улучшений, построенный поверх [LazyVim](https://github.com/LazyVim/LazyVim), который предоставляет 47 опциональных расширений (extras) и 33 модуля переопределений (overrides) для создания высококачественного и функционального Neovim.

## ✨ Возможности

### 🎨 Визуальные улучшения
- **Продвинутая кастомизация тем** с глубокой настройкой Catppuccin и Tokyo Night
- **Автоматическое переключение темы** в зависимости от светлого/темного режима системы
- **Улучшенные UI компоненты** с единообразными скругленными рамками и кастомными иконками
- **Улучшенная строка состояния** с индикаторами режимов и визуальными элементами
- **Улучшенная панель приветствия** с кастомным ASCII-артом и стилизованными секциями
- **Индикаторы использования символов** показывают ссылки и реализации inline

### 🚀 Повышение продуктивности
- **Умное управление буферами** с группами, автоочисткой и изоляцией по табам
- **Улучшенная навигация по коду** с tree-sitter навигацией
- **Улучшенное отображение диагностики** с inline сообщениями
- **Улучшения для работы с Git** включая интеграцию с GitLab MR и разрешение конфликтов
- **Продвинутое автодополнение** с интеграцией Blink.cmp
- **Поддержка AI-ассистента** через Avante

### ⚙️ Качество жизни
- **Поддержка русской клавиатуры** через langmapper
- **Повторяемые действия** для операций с буферами
- **Автосохранение в chezmoi** при обновлениях LazyVim
- **Поддержка локальной конфигурации проекта**
- **Интеграция с VSCode** для гибридных рабочих процессов
- **Оптимизация производительности** включая очистку неактивных LSP

## 📦 Установка

### Требования
- Neovim >= 0.10.0

### Быстрый старт

1. **Создайте `~/.config/nvim/init.lua` со следующим содержимым:**

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

2. **Запустите Neovim:**

```bash
nvim
```

Вот и всё! LazyVimx автоматически установит LazyVim и все необходимые плагины при первом запуске.

3. **Настройте LazyVimx (опционально):**

Создайте `~/.config/nvim/lua/config/lazyvimx.lua`:

```lua
require("lazyvimx").setup({
  colorscheme = "catppuccin",
  colorscheme_flavors = {
    catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
    tokyonight = { "tokyonight-storm", "tokyonight-day" },
  },
  bufferline_groups = {
    -- Определите кастомные группы буферов
    -- ["name"] = "regex_pattern",
  },
})
```

4. **Включите расширения (extras):**

Используйте UI для выбора расширений LazyVim (`:LazyExtras`) чтобы включить расширения LazyVimx, или добавьте их в конфигурацию:

```lua
-- В lua/plugins/extras.lua
return {
  { import = "lazyvimx.extras.core.all" },  -- Рекомендуется: включает все базовые улучшения
  { import = "lazyvimx.extras.ui.better-diagnostic" },
  { import = "lazyvimx.extras.motions.langmapper" },
  -- Добавьте больше расширений по необходимости
}
```

## 🗂️ Структура проекта

```
LazyVimx/
├── lua/lazyvimx/
│   ├── boot.lua              # Загрузочная конфигурация
│   ├── init.lua              # Главный модуль с функцией setup
│   ├── extras/               # Опциональные модули (всего 47)
│   │   ├── core/            # Базовые улучшения (overrides, keys)
│   │   ├── ui/              # Улучшения UI (18 модулей)
│   │   ├── coding/          # Инструменты программирования (2 модуля)
│   │   ├── motions/         # Улучшения навигации (6 модулей)
│   │   ├── buf/             # Управление буферами (3 модуля)
│   │   ├── git/             # Git интеграция (4 модуля)
│   │   ├── lang/            # Поддержка языков (2 модуля)
│   │   ├── linting/         # Инструменты линтинга (2 модуля)
│   │   ├── ai/              # AI-ассистенты (1 модуль)
│   │   ├── dap/             # Отладка (1 модуль)
│   │   ├── perf/            # Производительность (2 модуля)
│   │   └── test/            # Тестирование (1 модуль)
│   ├── overrides/           # Кастомизация плагинов (всего 33)
│   │   ├── lazyvim/         # Переопределения LazyVim (8 модулей)
│   │   ├── snacks/          # Переопределения Snacks.nvim (7 модулей)
│   │   ├── bufferline/      # Переопределения Bufferline (6 модулей)
│   │   └── other/           # Другие плагины (13 модулей)
│   └── util/                # Утилиты
│       ├── general.lua      # Общие утилиты
│       └── layout.lua       # Управление макетом
└── init.lua                 # Точка входа с защитой
```

## 🎯 Базовые расширения

### Рекомендуемая настройка

Включите все базовые улучшения одним импортом:

```lua
{ import = "lazyvimx.extras.core.all" }
```

Это включает:
- **Overrides**: Все кастомизации плагинов
- **Extras**: Все доступные расширения
- **Keys**: Кастомные горячие клавиши
- **Notifications**: Предупреждения об отсутствующих расширениях

### Отдельные базовые компоненты

```lua
{ import = "lazyvimx.extras.core.overrides" }  -- Переопределения плагинов
{ import = "lazyvimx.extras.core.extras" }     -- Все расширения
{ import = "lazyvimx.extras.core.keys" }       -- Кастомные горячие клавиши
```

## 📚 Документация

- **[ARCHITECTURE.ru.md](docs/ARCHITECTURE.ru.md)** - Техническая архитектура и детали реализации ([🇬🇧](docs/ARCHITECTURE.md))
- **[CONFIGURATION.ru.md](docs/CONFIGURATION.ru.md)** - Руководство по настройке и опции ([🇬🇧](docs/CONFIGURATION.md))
- **[EXTRAS.ru.md](docs/EXTRAS.ru.md)** - Полное руководство по всем 47 расширениям ([🇬🇧](docs/EXTRAS.md))
- **[API.ru.md](docs/API.ru.md)** - Справочник по API и утилитам ([🇬🇧](docs/API.md))

## 🎨 Выделенные расширения

### UI улучшения
- `ui.better-diagnostic` - Inline сообщения диагностики
- `ui.better-float` - Единообразный стиль плавающих окон
- `ui.symbol-usage` - Счетчики ссылок/определений
- `ui.better-explorer` - Интеграция с файловым менеджером Yazi
- `ui.winbar` - Путь к файлу в панели окна

### Инструменты программирования
- `coding.emmet` - Расширение HTML/CSS
- `coding.comments` - Улучшенное комментирование с генерацией документации

### Навигация
- `motions.langmapper` - **Поддержка русской клавиатуры**
- `motions.better-move-between-words` - Навигация по подсловам
- `motions.sibling-swap` - Перемещение на основе Tree-sitter
- `motions.splitting-joining-blocks` - Умная манипуляция блоками

### Git интеграция
- `git.gitlab` - Ревью GitLab MR
- `git.conflicts` - Визуальное разрешение конфликтов
- `git.remote-view` - Открытие удаленных репозиториев локально

### AI и тестирование
- `ai.avante` - Эмуляция Cursor AI IDE
- `test.jest` - Фреймворк тестирования Jest

## ⌨️ Горячие клавиши

LazyVimx добавляет множество кастомных привязок клавиш. Некоторые основные:

| Клавиша | Режим | Описание |
|---------|-------|----------|
| `d` | n, v | Удаление без копирования в буфер |
| `<C-S-j/k>` | n, i, v | Перемещение строк вверх/вниз |
| `<leader>\` | n | Разделить окно вправо |
| `<leader>fy` | n | Открыть файловый менеджер Yazi |
| `<leader>gl*` | n | Операции GitLab |
| `<F5>` | n | DAP продолжить |
| `<F10>` | n | DAP перейти |
| `<C-,/.>` | n | Поменять соседей местами |
| `gr` | n | Перейти к ссылкам (glance) |
| `<leader>cr` | n | Переименование (live-rename) |

См. [extras/core/keys.lua](./lua/lazyvimx/extras/core/keys.lua) для полного списка.

## 🔧 Конфигурация

### Цветовая схема

LazyVimx поддерживает автоматическое переключение между светлым/темным вариантами:

```lua
require("lazyvimx").setup({
  colorscheme = "catppuccin",
  colorscheme_flavors = {
    catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
  },
})
```

Система автоматически переключается между темным (индекс 1) и светлым (индекс 2) в зависимости от системной темы.

### Группы буферов

Определите кастомные группы bufferline:

```lua
require("lazyvimx").setup({
  bufferline_groups = {
    ["React"] = "%.tsx$",
    ["Tests"] = "%.test%.",
  },
})
```

## 🤝 Интеграция

### Chezmoi
LazyVimx автоматически синхронизирует `lazy-lock.json` и `lazyvim.json` в chezmoi при обновлениях, если установлена переменная окружения `DOTFILES_SRC_PATH`.

### VSCode
Специальный режим интеграции с VSCode:
- Синхронизация индикатора режима
- Адаптированные горячие клавиши
- Нативная интеграция переименования VSCode

### macOS
- Определение системной темы для автопереключения цветовых схем
- Интеграция с корзиной для безопасного удаления файлов в neo-tree
- Системные команды открытия

## 🌟 Философия

LazyVimx улучшает LazyVim, следуя принципам:
1. **Сохранение дизайна LazyVim** - Все улучшения опциональны через extras
2. **Поддержание консистентности** - Единая тема и визуальный язык
3. **Улучшение юзабилити** - Умные настройки по умолчанию и оптимизация рабочих процессов
4. **Поддержка кастомизации** - Гибкая система конфигурации
5. **Обеспечение качества** - Внимательное отношение к полировке и деталям

## 📊 Статистика

- **47 опциональных расширений** в 11 категориях
- **33 модуля переопределений** для глубокой кастомизации
- **150+ кастомных подсветок** для темы Catppuccin
- **70+ кастомных подсветок** для темы Tokyo Night
- **30+ кастомных горячих клавиш**

## 🔗 Ссылки

- [Пример использования](https://github.com/aimuzov/dotfiles/blob/main/dot_config/nvim/init.lua#L6-L7)
- [Обсуждение](https://t.me/aimuzov_dotfiles)
- [LazyVim](https://github.com/LazyVim/LazyVim)

## 📈 Активность

![Repo Activity](https://repobeats.axiom.co/api/embed/f5453bcfc3ad93005a4d3b73d0681450ff7ca5d3.svg "Repobeats analytics image")

## 📄 Лицензия

Этот проект следует той же лицензии, что и LazyVim.

## 🙏 Благодарности

Построен поверх превосходного [LazyVim](https://github.com/LazyVim/LazyVim) от [folke](https://github.com/folke).

---

**Автор**: Aleksey Imuzov ([@aimuzov](https://github.com/aimuzov))
