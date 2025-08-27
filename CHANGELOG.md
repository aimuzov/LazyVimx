# Changelog

## [0.4.1](https://github.com/aimuzov/LazyVimx/compare/v0.4.0...v0.4.1) (2025-08-27)

### Bug Fixes

* **ui:** fix autoswitching colorscheme correctly ([49fe597](https://github.com/aimuzov/LazyVimx/commit/49fe5971a8c04d0c0f0de01ac882a7767067af8f))
* **ui:** fix bufferline highlights for tokyonight ([a78f0a0](https://github.com/aimuzov/LazyVimx/commit/a78f0a04b9da4ddc14d5fc253fb7e426be73db37))
* **ui:** fix highlight for neotree on active (tokyonight) ([ac00324](https://github.com/aimuzov/LazyVimx/commit/ac003245b321fb76c35baa73a2e45d987b79d1f2))
* **ui:** fix lualine highlight for winbar (both colorschemes) ([f7fbfd6](https://github.com/aimuzov/LazyVimx/commit/f7fbfd632610c9bfee858931580eb8a0f8566e07))

## [0.4.0](https://github.com/aimuzov/LazyVimx/compare/v0.3.0...v0.4.0) (2025-08-27)

### Bug Fixes

* **motions:** fix incorrect api using (langmapper) ([881cce0](https://github.com/aimuzov/LazyVimx/commit/881cce00bde97eb53b3de98e49c2e91d11cbcdcb))
* **ui:** small temporarily fix for bufferline ([238589a](https://github.com/aimuzov/LazyVimx/commit/238589a7184692745825967d9177a0dde45f6828)), closes [LazyVim/LazyVim#6354](https://github.com/LazyVim/LazyVim/issues/6354)
* **ui:** some fixes for highlights (tokyonight) ([94509fa](https://github.com/aimuzov/LazyVimx/commit/94509fa988a068f814e7796ea797ef8718047079))
* **ui:** some fixes for sidebar & highlights ([245b475](https://github.com/aimuzov/LazyVimx/commit/245b475c0aa616c7ee3f87db34c5a6b9828bc021))

## [0.3.0](https://github.com/aimuzov/LazyVimx/compare/v0.2.12...v0.3.0) (2025-07-27)

### Features

* **ui:** replace alpha by snacks (dashboard) ([87303b8](https://github.com/aimuzov/LazyVimx/commit/87303b841ec93c4a9829616de445ec601f3a5bed))

### Bug Fixes

* fix changelog ([f9dfb44](https://github.com/aimuzov/LazyVimx/commit/f9dfb4446439b50ba5a6023f7ca8909b75801454))
* **keys:** fix keymaps for neotree (split, vsplit) ([38c5eae](https://github.com/aimuzov/LazyVimx/commit/38c5eae2c7ab5b06ce14dc42e7650b03a6ff7b15))
* **keys:** replace bufferline api by native (tab rename) ([8658dc1](https://github.com/aimuzov/LazyVimx/commit/8658dc11e22574e10ddebcdd8a7f2a1bb668a36d))
* **perf:** disable notices from local nvim config ([772e22b](https://github.com/aimuzov/LazyVimx/commit/772e22b1d2976d0bd77c1a6bc53379418c6dfb6b))
* **ui:** fix highlight for float title ([65c4f41](https://github.com/aimuzov/LazyVimx/commit/65c4f4164a37615d7d19e79a57b83bd66542c9a5))

## [0.2.12](https://github.com/aimuzov/LazyVimx/compare/v0.2.11...v0.2.12) (2025-07-08)

### Bug Fixes

* fix vimopts (again) ([0366c22](https://github.com/aimuzov/LazyVimx/commit/0366c22086db2bf2374e04ebe0f6a7ad34315c31))

## [0.2.11](https://github.com/aimuzov/LazyVimx/compare/v0.2.10...v0.2.11) (2025-07-08)

### Bug Fixes

* fix overriding default vim.opts ([c28dd08](https://github.com/aimuzov/LazyVimx/commit/c28dd08e74f1bdf7794476f2ac94896c91b31d7c)), closes [#42](https://github.com/aimuzov/LazyVimx/issues/42)

## [0.2.10](https://github.com/aimuzov/LazyVimx/compare/v0.2.9...v0.2.10) (2025-06-30)

### Bug Fixes

* **ai:** migrate to new ver of avante ([cf2def5](https://github.com/aimuzov/LazyVimx/commit/cf2def543ebf77dc36ccf8efdb34698456f20ae9))
* **dap:** fix vscode debugger ([93650fb](https://github.com/aimuzov/LazyVimx/commit/93650fb4272547707ab671e753eb6740c59c2775))
* **git:** remove unused prop ([96967b3](https://github.com/aimuzov/LazyVimx/commit/96967b32d7159198bb6e3c4c84c34142ac5b0858))
* **perf:** remove hardtime ([e65fa6d](https://github.com/aimuzov/LazyVimx/commit/e65fa6dd8ffc156b85c5aa65cb5c70a064e57eb6))
* **ui:** disable simple mode for opening nvim with args (filepath) ([b5e9b71](https://github.com/aimuzov/LazyVimx/commit/b5e9b7155ba7f479761651697f4fd09924e617a6))
* **vscode:** disable lazygit theming ([4b4e5f6](https://github.com/aimuzov/LazyVimx/commit/4b4e5f6e8d8b214bcc316e6f2aa6c65dfffde536))

## [0.2.9](https://github.com/aimuzov/LazyVimx/compare/v0.2.8...v0.2.9) (2025-05-14)

### Bug Fixes

* **boot:** fix overriding vim.g.root_lsp_ignore ([3caf576](https://github.com/aimuzov/LazyVimx/commit/3caf5764c1f6abfd290e01a62a11fa83e67fe2dd))
* **perf:** rename mason ([6d39034](https://github.com/aimuzov/LazyVimx/commit/6d3903460bdeac1b18f754e0448490d20e1b5e03))

## [0.2.8](https://github.com/aimuzov/LazyVimx/compare/v0.2.7...v0.2.8) (2025-05-12)

### Bug Fixes

* **ui:** fix broken higlight for visual whitespace ([72480dd](https://github.com/aimuzov/LazyVimx/commit/72480dd7f4965af05a45f4401536bd96c06a5714))

## [0.2.7](https://github.com/aimuzov/LazyVimx/compare/v0.2.6...v0.2.7) (2025-05-12)

### Bug Fixes

* **mason:** temporarily downgrade to v1 ([ce88db5](https://github.com/aimuzov/LazyVimx/commit/ce88db526879767ed8006126aaedd752c5a60286))
* **ui:** fix simple mode ([76c9523](https://github.com/aimuzov/LazyVimx/commit/76c95236d146851f1cd58c64407309da0f552480))
* **vscode:** enable some plugins for motions ([1a06706](https://github.com/aimuzov/LazyVimx/commit/1a067067e989033764c5acc34479db7a8affe70c))

## [0.2.6](https://github.com/aimuzov/LazyVimx/compare/v0.2.5...v0.2.6) (2025-05-05)

### Bug Fixes

* **motions:** add extra for splitting/joining blocks ([a027015](https://github.com/aimuzov/LazyVimx/commit/a02701593ccf2833e070b218393e8a5bb5b2c3d6)), closes [#41](https://github.com/aimuzov/LazyVimx/issues/41)

## [0.2.5](https://github.com/aimuzov/LazyVimx/compare/v0.2.4...v0.2.5) (2025-05-04)

### Bug Fixes

* **ui:** fix again simple mode ([dc999cf](https://github.com/aimuzov/LazyVimx/commit/dc999cf3cb25a7e730e54e2e49508d18c4dc8388)), closes [#40](https://github.com/aimuzov/LazyVimx/issues/40)

## [0.2.4](https://github.com/aimuzov/LazyVimx/compare/v0.2.3...v0.2.4) (2025-05-04)

### Features

* **ui:** add plugin for yazi ([9df53da](https://github.com/aimuzov/LazyVimx/commit/9df53da03ac250b09d6573816dd3978dc842d812)), closes [#38](https://github.com/aimuzov/LazyVimx/issues/38)

### Bug Fixes

* **perf:** remove useless extra ([0c7f2b5](https://github.com/aimuzov/LazyVimx/commit/0c7f2b5a03e5498962f69b55c0b4d98b3c9c9ff5)), closes [#34](https://github.com/aimuzov/LazyVimx/issues/34)
* **ui:** change words highlights ([6bef7a4](https://github.com/aimuzov/LazyVimx/commit/6bef7a422b0138d0b8bc95bf99343a73174d3e99)), closes [#36](https://github.com/aimuzov/LazyVimx/issues/36)
* **ui:** improve vscode integration ([2437e08](https://github.com/aimuzov/LazyVimx/commit/2437e085deb2bd999429b5bcf3926dbafbc79e52)), closes [#39](https://github.com/aimuzov/LazyVimx/issues/39)
* **ui:** migrate to new config (whitespaces) ([d309ef4](https://github.com/aimuzov/LazyVimx/commit/d309ef42d5292a7c7f39a3f1f9c870630dffc873)), closes [#37](https://github.com/aimuzov/LazyVimx/issues/37)
* **ui:** replace scrollbar plugin ([9c96d6c](https://github.com/aimuzov/LazyVimx/commit/9c96d6cdf6836fc72743d9085517027e9be96714)), closes [#35](https://github.com/aimuzov/LazyVimx/issues/35)
* **ui:** simplify simple mode :) ([1bb13cd](https://github.com/aimuzov/LazyVimx/commit/1bb13cdb4e29a37f5e168d733e70597e841f5eb3)), closes [#40](https://github.com/aimuzov/LazyVimx/issues/40)
* **ui:** small fixes ([7b6a9ed](https://github.com/aimuzov/LazyVimx/commit/7b6a9ed6f434890598e82e6cbb828e6434adcf72))

## [0.2.3](https://github.com/aimuzov/LazyVimx/compare/v0.2.2...v0.2.3) (2025-04-27)

### Features

* **buf:** add groups ([08186c9](https://github.com/aimuzov/LazyVimx/commit/08186c9eb1af39d6833dd2f4f693ba27cd567cdd)), closes [#29](https://github.com/aimuzov/LazyVimx/issues/29)

### Bug Fixes

* **ai:** disable hints for avante ([177e2f5](https://github.com/aimuzov/LazyVimx/commit/177e2f54b4d237fc5fa7133f45fc9ca2e392e9fd)), closes [#29](https://github.com/aimuzov/LazyVimx/issues/29)
* **motions:** fix H & L keymaps (langmapper problem) ([2a57b9c](https://github.com/aimuzov/LazyVimx/commit/2a57b9c845e016449afa7f1080fbf79f7669d4c9)), closes [#31](https://github.com/aimuzov/LazyVimx/issues/31)
* **motions:** fix moving for cyrillic (spider) ([d61f8db](https://github.com/aimuzov/LazyVimx/commit/d61f8db527a454da6b0d946e4217f9964ef884c4)), closes [#32](https://github.com/aimuzov/LazyVimx/issues/32)
* **motions:** improve langmapper conf (add snacks setup) ([011848e](https://github.com/aimuzov/LazyVimx/commit/011848e8369189e9675aa1681ce86a98898109ee)), closes [#33](https://github.com/aimuzov/LazyVimx/issues/33)

## [0.2.2](https://github.com/aimuzov/LazyVimx/compare/v0.2.1...v0.2.2) (2025-04-25)

### Bug Fixes

* **colorschemes:** some fixes for catppuccin & tokyonight ([b908ad7](https://github.com/aimuzov/LazyVimx/commit/b908ad7cb487c215320f52cba9d18d5cf2bf1412)), closes [#28](https://github.com/aimuzov/LazyVimx/issues/28)

## [0.2.1](https://github.com/aimuzov/LazyVimx/compare/v0.2.0...v0.2.1) (2025-04-25)

### Bug Fixes

* **git:** fix exception for  gitlab config ([e1353da](https://github.com/aimuzov/LazyVimx/commit/e1353da7399f95da9bf535fcf3531cb6470134e0)), closes [#27](https://github.com/aimuzov/LazyVimx/issues/27)

## [0.2.0](https://github.com/aimuzov/LazyVimx/compare/v0.1.0...v0.2.0) (2025-04-24)

### Features

* **buf:** improve & simplify ([a93fa23](https://github.com/aimuzov/LazyVimx/commit/a93fa237204ac9b65e065f0c3bde15cb60b96602)), closes [#8](https://github.com/aimuzov/LazyVimx/issues/8)
* **build:** add release-it ([4baa004](https://github.com/aimuzov/LazyVimx/commit/4baa004030224d7093e9037b8c351ef366235e1c)), closes [#26](https://github.com/aimuzov/LazyVimx/issues/26)

### Bug Fixes

* **ai:** remove unused plugins ([722e086](https://github.com/aimuzov/LazyVimx/commit/722e086585d5c641802a0515999d062745b79e6a)), closes [#6](https://github.com/aimuzov/LazyVimx/issues/6)
* **ai:** simplify avante config ([bc1208a](https://github.com/aimuzov/LazyVimx/commit/bc1208a033064b79a4f3c8ef5da471cd0ecbd585)), closes [#7](https://github.com/aimuzov/LazyVimx/issues/7)
* **boot:** major update for extra & overrides ([b0c7113](https://github.com/aimuzov/LazyVimx/commit/b0c7113adfd395911d7be72f838124401ff763bc)), closes [#17](https://github.com/aimuzov/LazyVimx/issues/17)
* **buf:** repair deletion flow ([e9bd37d](https://github.com/aimuzov/LazyVimx/commit/e9bd37d1f421ed31c456efae158a7f21ebb2b3f7)), closes [#9](https://github.com/aimuzov/LazyVimx/issues/9)
* **build:** small fixes for release config ([fdf3a78](https://github.com/aimuzov/LazyVimx/commit/fdf3a78df6b3a0a69d4d4b92f154706471116364))
* **core:** replace core by boot ([665e9d7](https://github.com/aimuzov/LazyVimx/commit/665e9d777a11e3e5edf238b0b8847cb4fa3c4938)), closes [#3](https://github.com/aimuzov/LazyVimx/issues/3)
* **everything:** some important fixes ([fad8bd9](https://github.com/aimuzov/LazyVimx/commit/fad8bd921723ee13d350d47860c10492566a0d75)), closes [#23](https://github.com/aimuzov/LazyVimx/issues/23)
* fix luautf8 exception ([dbdce3e](https://github.com/aimuzov/LazyVimx/commit/dbdce3e182a229b3a0f33da41ff29fd030eaa27f)), closes [#18](https://github.com/aimuzov/LazyVimx/issues/18)
* **git:** improve config for git plugins ([0497500](https://github.com/aimuzov/LazyVimx/commit/04975004cd123604a13ffa1967054f2461b433fa)), closes [#16](https://github.com/aimuzov/LazyVimx/issues/16)
* **keys:** move all keys to single extra ([92cf7ff](https://github.com/aimuzov/LazyVimx/commit/92cf7ff1810b23e36bdf2ba2b602cc80f63b08bd)), closes [#19](https://github.com/aimuzov/LazyVimx/issues/19)
* **overrides:** fix hl for tokyonight ([b8804e3](https://github.com/aimuzov/LazyVimx/commit/b8804e34238263aa3ca5b4fd5131c7ceb66f8d1a)), closes [#25](https://github.com/aimuzov/LazyVimx/issues/25)
* **overrides:** move alpha from extras ([cd362e5](https://github.com/aimuzov/LazyVimx/commit/cd362e52736b51fb36752b2c55d95faa0327b5a1)), closes [#10](https://github.com/aimuzov/LazyVimx/issues/10)
* **overrides:** move hacks to from extras ([19cb4a9](https://github.com/aimuzov/LazyVimx/commit/19cb4a95b681931da192f63bf644c0e045e4d73b)), closes [#15](https://github.com/aimuzov/LazyVimx/issues/15)
* **overrides:** move mouse setup to overrides ([731b313](https://github.com/aimuzov/LazyVimx/commit/731b31300bbbb855af59926a6f9d7de78d405305)), closes [#14](https://github.com/aimuzov/LazyVimx/issues/14)
* **overrides:** move neo-tree from extras ([a96d358](https://github.com/aimuzov/LazyVimx/commit/a96d358022e723db95c822efcf00b514481efa7c)), closes [#11](https://github.com/aimuzov/LazyVimx/issues/11)
* **overrides:** move snacks from extras ([054d65a](https://github.com/aimuzov/LazyVimx/commit/054d65a593c3e08105fe511d12ba4ef4c4b61549)), closes [#13](https://github.com/aimuzov/LazyVimx/issues/13)
* **overrides:** move trouble from extras ([c558565](https://github.com/aimuzov/LazyVimx/commit/c55856546b1cc042339e41fcb6d77797ca975aa1)), closes [#12](https://github.com/aimuzov/LazyVimx/issues/12)
* **overrides:** remove eslint from root lsp ([13c5df6](https://github.com/aimuzov/LazyVimx/commit/13c5df640f02bfb88f09d949d6593adc2b41caf6)), closes [#20](https://github.com/aimuzov/LazyVimx/issues/20)
* **overrides:** repair imports ([884afbe](https://github.com/aimuzov/LazyVimx/commit/884afbe2e8b0dd7dd761b08bbfbffe6a8f5a381d)), closes [#22](https://github.com/aimuzov/LazyVimx/issues/22)
* simplify plugin setup ([3f16985](https://github.com/aimuzov/LazyVimx/commit/3f169856f787eadc53b5aeb3f73364825a465b08)), closes [#5](https://github.com/aimuzov/LazyVimx/issues/5)
* small fixes ([1da01ff](https://github.com/aimuzov/LazyVimx/commit/1da01ff01b63ac9d7ae7f83868c0021b58925d70))
* **ui:** move all configs for float modification to single extra ([e43d0ce](https://github.com/aimuzov/LazyVimx/commit/e43d0cef1d6bb740293be2b9b99d20b071f12b27)), closes [#21](https://github.com/aimuzov/LazyVimx/issues/21)
* **vscode:** some fixes ([3229d79](https://github.com/aimuzov/LazyVimx/commit/3229d79ef07afe04ab79b97e751e9e51ece9e668)), closes [#24](https://github.com/aimuzov/LazyVimx/issues/24)

## [0.1.0](https://github.com/aimuzov/LazyVimx/compare/674253ab894035ffa4069b8fb741d3d8dc29517d...v0.1.0) (2025-04-19)

### Features

* add extra 'no backdrop' for mason ([0f7c30f](https://github.com/aimuzov/LazyVimx/commit/0f7c30f9fa0126b8f8261a2f6377a0b02039983c))
* add simple config ([af846de](https://github.com/aimuzov/LazyVimx/commit/af846de01acfaa78320d6564414c629e77d525e1))
* **ai:** add avante ([5200e19](https://github.com/aimuzov/LazyVimx/commit/5200e19811029150f67184c6fd43f93a6efe08d7))
* **buffers:** add autoclose buffers (for deleting files) ([c4cc111](https://github.com/aimuzov/LazyVimx/commit/c4cc111e9cf47bc8c56810e59cf1917f907c61aa))
* **buffers:** add extra (hide extenstion of file) ([fc3e09e](https://github.com/aimuzov/LazyVimx/commit/fc3e09e806e3099b8c8aa0e408049538c3d7de20))
* **buffers:** auto close hidden buffers ([5b6f547](https://github.com/aimuzov/LazyVimx/commit/5b6f547c25319cd1f12dda073637b212e6cb5880))
* **coding:** improve cmp showing ([97981a5](https://github.com/aimuzov/LazyVimx/commit/97981a5556ddbef5970e4558ee429a4d8bba983a))
* **coding:** improve ui for cmp ([5238542](https://github.com/aimuzov/LazyVimx/commit/5238542bb1d33957de9d08971b010e7d5ef52ae5))
* **everything:** move extras from dotfiles & create this plugin ([674253a](https://github.com/aimuzov/LazyVimx/commit/674253ab894035ffa4069b8fb741d3d8dc29517d))
* **git:** add notification on conflict detected ([70a4919](https://github.com/aimuzov/LazyVimx/commit/70a49195cbc1f8b9b527e9a8521fdfda28516867))
* **git:** improve notifications from git-conflict plugin ([9be2ce9](https://github.com/aimuzov/LazyVimx/commit/9be2ce9ce37c8c5926899b9759fa9bb5fddf5f1c))
* **keys:** add key for dasboard open ([61c6504](https://github.com/aimuzov/LazyVimx/commit/61c650401a714a87be9c6e3aa782cd60fa00fb78))
* **keys:** add key for opening shell (cht.sh) ([ebc45f4](https://github.com/aimuzov/LazyVimx/commit/ebc45f4ddb63ac82858ee1378c69bf4c11ebb3ba))
* **keys:** add key for yazi ([ae1b7ae](https://github.com/aimuzov/LazyVimx/commit/ae1b7ae872ab525cda05dd55244b51dc0c4d412e))
* **keys:** add keys for dap ([43d7387](https://github.com/aimuzov/LazyVimx/commit/43d73870ff8db26f7d5f9310df1755e6bc5eaaea))
* **keys:** add live-rename ([9250116](https://github.com/aimuzov/LazyVimx/commit/925011685ced8cc1c48d91637311c7cd43e206c3))
* **keys:** add new extra (tab renaming) ([40f4f6f](https://github.com/aimuzov/LazyVimx/commit/40f4f6f1fe5ef339bbdc780d9aa8ec214046fe11))
* migrate to new version of lazyvim ([15ef7bc](https://github.com/aimuzov/LazyVimx/commit/15ef7bc80765de7e97f0b96ea4b932eae691f06d))
* **mouse:** add action to context menu ([e2a1e30](https://github.com/aimuzov/LazyVimx/commit/e2a1e304658833e9dc04ef436432f2d3f15553e3))
* **nav:** add extra (hardtime) ([5743760](https://github.com/aimuzov/LazyVimx/commit/57437609df4b7c8905f14ee0d208ca7b06ec8462))
* **nav:** add sibling move ([e5f5bcc](https://github.com/aimuzov/LazyVimx/commit/e5f5bccaa79403d38a17de93a5d6a3053304c379))
* **nav:** add some integrations for mupltiple cursors ([6c19fc5](https://github.com/aimuzov/LazyVimx/commit/6c19fc5d9fe7f7cab4247231e1d374c177a41e79))
* **nav:** improve motions (w,e,b) ([ff495bc](https://github.com/aimuzov/LazyVimx/commit/ff495bc8e9e74a50a8024beded38927413765c38))
* **nav:** sticky cursor ([6db76b7](https://github.com/aimuzov/LazyVimx/commit/6db76b7bc9225b85ee291aa00188b1b4c14774f7))
* **optimizations:** add local config plugin ([81f57cc](https://github.com/aimuzov/LazyVimx/commit/81f57cce4f81bf7356335e0436d2847189f2a810))
* **ui:** add clock to statusline ([b5c3f4a](https://github.com/aimuzov/LazyVimx/commit/b5c3f4a2c8c79339ee737434ca8b58847031c789))
* **ui:** add extension for git actions (telescope) ([7eae1d2](https://github.com/aimuzov/LazyVimx/commit/7eae1d25a3da96e1830c075c6dc8cf423f6710ec))
* **ui:** add extras (quick-fix) ([39a21ba](https://github.com/aimuzov/LazyVimx/commit/39a21baaaaf7a01f5fd44dd70de5c62ad4fd09a2))
* **ui:** add groups for bufferline ([c0b7f07](https://github.com/aimuzov/LazyVimx/commit/c0b7f07139704c1e0a733766ec5452db9ba1aa00))
* **ui:** add new extra (pretty code actions) ([e8e0348](https://github.com/aimuzov/LazyVimx/commit/e8e03483887fbbf638b89981129304fe37b328b2))
* **ui:** add plug for colorize ansi escape sequences ([c71885c](https://github.com/aimuzov/LazyVimx/commit/c71885c659d4e6297f4958486aac1da939153236))
* **ui:** add plugin for cursor line ([51bb160](https://github.com/aimuzov/LazyVimx/commit/51bb160efa690ea01b44d0df47aa9c32ad30d764))
* **ui:** add round style for doc ([5825d45](https://github.com/aimuzov/LazyVimx/commit/5825d45bdb7ba34abbc4af0fef119efd57454649))
* **ui:** add telescope ext (smart open) ([9932552](https://github.com/aimuzov/LazyVimx/commit/99325525a80b66ede9a47d01ae165a7058e5d156))
* **ui:** change picker for colorscheme (telescope) ([454625c](https://github.com/aimuzov/LazyVimx/commit/454625c2fae16ecfa3ca9ebf60a9bda95050c90d))
* **ui:** fix inlay hints ([da203b1](https://github.com/aimuzov/LazyVimx/commit/da203b1a0843ab09db7a7312963096d730d19760))
* **ui:** hide filepath from status line ([078fe5d](https://github.com/aimuzov/LazyVimx/commit/078fe5d9960938024750bee32eece89bc5121cb4))
* **ui:** improve style (usage helpers) ([ffabd47](https://github.com/aimuzov/LazyVimx/commit/ffabd4742b238d69eedee8e309fe74fdab0ad8fd))
* **ui:** man mode ([3cebc80](https://github.com/aimuzov/LazyVimx/commit/3cebc80d9e08d7fc2d5d4995ee22d34f55c74f01))
* **ui:** new diagnostic bubbles ([5b85c06](https://github.com/aimuzov/LazyVimx/commit/5b85c06ae4c7bbcb319c466ebeba32f4444fe442))
* **ui:** override lua icon ([024389f](https://github.com/aimuzov/LazyVimx/commit/024389f37a1a5b5bd9fdbeb81125cd916f8989f2))
* **ui:** remove extras title ([00d45b2](https://github.com/aimuzov/LazyVimx/commit/00d45b2d746c36101b4cf1c5fe0b46d53cb6774a))
* **ui:** remove telescope ([69e5423](https://github.com/aimuzov/LazyVimx/commit/69e54239f616db446eb43ee6e52fe33a1aa81e61))
* **ui:** replace default quickfix by trouble ([90718f2](https://github.com/aimuzov/LazyVimx/commit/90718f2846cd3a90acd59301ecff067f2aae0e9a))
* **ui:** some fixes for hints ([5ebc658](https://github.com/aimuzov/LazyVimx/commit/5ebc658e7283269147c8fb0dee42b900a258d533))
* **ui:** ticking clock! ([6d9d598](https://github.com/aimuzov/LazyVimx/commit/6d9d59870bb300618653f5a500bf797f11fa7205))

### Bug Fixes

* add comment ([7c640e8](https://github.com/aimuzov/LazyVimx/commit/7c640e854d43663f50b276add69f108ad8248e7c))
* **ai:** change keymaps for chatgpt ([9c7c76e](https://github.com/aimuzov/LazyVimx/commit/9c7c76e42e10320ca4e2d7ca9a7cfa84150764c6))
* **buffers:** force loading scope plugin ([bc4377e](https://github.com/aimuzov/LazyVimx/commit/bc4377ebd0d5c53eda9e63b62469c7372116c258))
* **buffers:** setup config for inactive buffers ([6c4fd38](https://github.com/aimuzov/LazyVimx/commit/6c4fd381027adddf6a3609b371cec5c190c87a1b))
* **coding:** add colors for blink ([ccb262c](https://github.com/aimuzov/LazyVimx/commit/ccb262ca830b806b36168a13a12da5a6b16341ca))
* **coding:** fix highlight (ruler) ([d627346](https://github.com/aimuzov/LazyVimx/commit/d6273469443c6318131b1187a968063452fe8679))
* **colorscheme:** add bg for FloatBorder highlight ([83ec559](https://github.com/aimuzov/LazyVimx/commit/83ec559c34b9465c2bf2f1d0986dc09801a78b43))
* **colorscheme:** fix exception on start ([94e9dd1](https://github.com/aimuzov/LazyVimx/commit/94e9dd17630898564c8acb2dd0f810a06cabf392))
* **colorscheme:** improve border highlights ([fc8a97e](https://github.com/aimuzov/LazyVimx/commit/fc8a97ee58b40f3e44cada49041591e9219fb4bd))
* **core:** increase timeoutlen ([a72a35a](https://github.com/aimuzov/LazyVimx/commit/a72a35ab19baa0d7eb255d5741cb8482e753ac45))
* **core:** remove lazyvim import plugins ([005a58c](https://github.com/aimuzov/LazyVimx/commit/005a58cb846e63d5746db51f09f1f17d9f7a8243))
* **core:** setup shell ([846f0ac](https://github.com/aimuzov/LazyVimx/commit/846f0ac5ae0e9abe589ea492743ba05a3a29da5a))
* **editor:** fix config for tiny diagnostic ([478cb9a](https://github.com/aimuzov/LazyVimx/commit/478cb9a52fd38c4ba04818ee286873a741f97219))
* fix autoupdating 3thtools ([ab5f513](https://github.com/aimuzov/LazyVimx/commit/ab5f513e2a4c4028580c1820524d80460ca2df78))
* fix dashboard ([ba63ebd](https://github.com/aimuzov/LazyVimx/commit/ba63ebd052859796f1af2a24641848b0c3cd3a04))
* **git:** decrease 'show' delay for git blame ([83742a0](https://github.com/aimuzov/LazyVimx/commit/83742a0f794aec837ba1012305d99007ac9e47e7))
* **git:** fix exception (missing theme file for lazygit) ([d6ff59e](https://github.com/aimuzov/LazyVimx/commit/d6ff59e7d7890687cda2d39bcfdfbd9f5f302765)), closes [#2](https://github.com/aimuzov/LazyVimx/issues/2)
* **git:** increase lazygit window size ([4e3157c](https://github.com/aimuzov/LazyVimx/commit/4e3157c985a249596f7d3fa188fdeaebf01d8e07))
* **git:** remove border for lazygit ([c69b19f](https://github.com/aimuzov/LazyVimx/commit/c69b19f8c899d77abc600c56302fb005133901d6))
* **git:** remove unused dep ([b167c1d](https://github.com/aimuzov/LazyVimx/commit/b167c1de9a95b0397dd448e9159659dd3a7629d2))
* **hacks:** fix hack for diagnostic (toggling) ([f0ba830](https://github.com/aimuzov/LazyVimx/commit/f0ba830c1055eb4b1b15f5b519f287c901e2d231))
* **hacks:** remove langmapper hack (getcharstr) ([949db77](https://github.com/aimuzov/LazyVimx/commit/949db770b0f9394b8cc5c271330fce537c02f28f))
* **inlay-hints:** disable by default ([49d3d7e](https://github.com/aimuzov/LazyVimx/commit/49d3d7e91fb49442304bb1d5d21a232172fe41ac))
* **keymaps:** fix bprev, bnext for cyrillic layout ([588da31](https://github.com/aimuzov/LazyVimx/commit/588da31e9e3678b9a97edd81b15cfa674f110a25))
* **keys:** add gx for opening path from terminal ([05249b6](https://github.com/aimuzov/LazyVimx/commit/05249b6690448f98b1c73594da02af2111a4723c))
* **keys:** fix gitlab keys ([aeb64e2](https://github.com/aimuzov/LazyVimx/commit/aeb64e2eef92231dc2c0abc6caa6b450eea1088d))
* **keys:** fix incorrect keymap for dap ([598172f](https://github.com/aimuzov/LazyVimx/commit/598172f1091c88572eaa1ed3b2c6b937ad089121))
* **keys:** migrate to whichkey v3 ([c5249a7](https://github.com/aimuzov/LazyVimx/commit/c5249a7d941f1266fc762250634b77c7c575912d))
* **keys:** move some keys from config ([1736180](https://github.com/aimuzov/LazyVimx/commit/17361806ed35511cacb4352fd94ebc927b05ddcf))
* **keys:** some fixes for keymaps ([789dafe](https://github.com/aimuzov/LazyVimx/commit/789dafed84f6f61009f13b4054f12208842df225))
* **lang:** add scss treesitter ([eadaf4e](https://github.com/aimuzov/LazyVimx/commit/eadaf4e41bea1e0a54e1f1186d7f77de884d6323))
* **lang:** fix incorrect name of package ([dc5085c](https://github.com/aimuzov/LazyVimx/commit/dc5085c8a03325068e6adcace0269da014e81a47))
* **langmapper:** fix incorrect mapping for 'ё' char ([9e4798b](https://github.com/aimuzov/LazyVimx/commit/9e4798b264bd18e6548c2a89abfd44998f4723ef))
* **lang:** remove unused extra (typescript) ([431a16b](https://github.com/aimuzov/LazyVimx/commit/431a16b9f0bfeb545f80d19fe19207eddb9508b4))
* **lang:** some fixes ([9129036](https://github.com/aimuzov/LazyVimx/commit/9129036c7b99f0483df1615352d689979f7da6fd))
* **linting:** fix incorrect filetypes for styleint ([72e9a8f](https://github.com/aimuzov/LazyVimx/commit/72e9a8f1ca2083f0a91ec345e842e5f2c4a897b0))
* **nav:** add missing arg for getcharstr func ([cff9b2c](https://github.com/aimuzov/LazyVimx/commit/cff9b2ce37c32c0154817928beb360e9f201c5f8))
* **nav:** enable search mode for flash ([a27d343](https://github.com/aimuzov/LazyVimx/commit/a27d3439b9021d1215ce6471f59d801df32c18d4))
* **nav:** fix config after upgrade (better-escape) ([b4413a7](https://github.com/aimuzov/LazyVimx/commit/b4413a7ea388b6d58222be112d38d775f291b5b6))
* **nav:** fix conflict with langmapper ([3a602d4](https://github.com/aimuzov/LazyVimx/commit/3a602d4c33026ac23458c6f9541b97825ed15846))
* **nav:** fix lazygit j keymap problem ([af367ab](https://github.com/aimuzov/LazyVimx/commit/af367ab4a2a93425156bffeab7ba5237df20cc4d))
* **nav:** force open find_files ([99dbe48](https://github.com/aimuzov/LazyVimx/commit/99dbe48cd6358615ea780c4ac23e64d0c69127bf))
* **nav:** remove better escape ([3b05658](https://github.com/aimuzov/LazyVimx/commit/3b05658dc1ac436fb72261afcc608a3231752c50))
* **nav:** remove useless extra ([64e7136](https://github.com/aimuzov/LazyVimx/commit/64e71366340d6170716e042466853982c0d76151))
* **nav:** revert changes (flash) ([c360af1](https://github.com/aimuzov/LazyVimx/commit/c360af17f38c385b8f475f9fadd7db05235147cf))
* **nav:** small fix ([75c2aaa](https://github.com/aimuzov/LazyVimx/commit/75c2aaaa140b4c6bedba11be86a545d45e5535e0))
* **nav:** some fixes for langmapper ([67d5d20](https://github.com/aimuzov/LazyVimx/commit/67d5d20bbdecb9f949098282068494d203b0f384))
* **optimizations:** fix config for hardtime ([991ee70](https://github.com/aimuzov/LazyVimx/commit/991ee70dc9330ab125724e80c9306e35decf94d2))
* **optimizations:** remove some extra (for buffer deleting) ([f11f9b4](https://github.com/aimuzov/LazyVimx/commit/f11f9b4dd0c0352fb3fe1ec428e7bba5ec47a75b))
* **optimizations:** revert last commit ([5d4bb50](https://github.com/aimuzov/LazyVimx/commit/5d4bb5040df9ea663114112be8b1e37801f98fa7))
* remove inlay-hint logic for autohide for insert mode ([46ad032](https://github.com/aimuzov/LazyVimx/commit/46ad0328def4d6563a1c0e5d4bd60d02739da0b2))
* remove not working solution ([1e2d123](https://github.com/aimuzov/LazyVimx/commit/1e2d123f0e8398a9cc1338b53107038115e70a57))
* some fixes ([d76e433](https://github.com/aimuzov/LazyVimx/commit/d76e4331c4d14bfeb70464f32aa57823d0a0022d))
* **test:** fix jest ([ae4a3f0](https://github.com/aimuzov/LazyVimx/commit/ae4a3f0caf4ceac7b3c427b0f4f650a5c5adedea))
* **ui:** add common group for bufferline ([4baab08](https://github.com/aimuzov/LazyVimx/commit/4baab08c9af7743b9390445b8abbf21fe4dacf54))
* **ui:** add mappings for normal mode (telescope) ([595235d](https://github.com/aimuzov/LazyVimx/commit/595235d4e25dca337ef456b6238716dcd31bff36))
* **ui:** add optional property for telescope ([3da06c0](https://github.com/aimuzov/LazyVimx/commit/3da06c0fc4922976702dd91520375cab4e0be336))
* **ui:** add rounded style for news window ([f19b98a](https://github.com/aimuzov/LazyVimx/commit/f19b98a59af670ea143f4bda4e36fb846b49fee6))
* **ui:** bufferline is alwaysvisible now ([b22a8d4](https://github.com/aimuzov/LazyVimx/commit/b22a8d492734de28865824f519f0b23347733674))
* **ui:** change dashboard header ([2d40078](https://github.com/aimuzov/LazyVimx/commit/2d40078853660c3de430668af626063a7893ed24))
* **ui:** change palette (frappe => macchiato) ([9d1fbd0](https://github.com/aimuzov/LazyVimx/commit/9d1fbd0fa3b9e0faed2b2e1a5d208f63cd8a69ef))
* **ui:** change picker for highlights ([58a9e87](https://github.com/aimuzov/LazyVimx/commit/58a9e87ca2e8eabf8996cd65faf2408fc74e8d08))
* **ui:** change pickers (telescope) ([4a95257](https://github.com/aimuzov/LazyVimx/commit/4a9525766f527528e13b9ee0dafdd0952539ae89))
* **ui:** decrease terminal window (for lazygit) ([a465d64](https://github.com/aimuzov/LazyVimx/commit/a465d64e180ce14299a7485681f7f5b168a3b89a))
* **ui:** disable animation ([6a244b2](https://github.com/aimuzov/LazyVimx/commit/6a244b2dbc715bd5457ac3464c5d2d0738b1635d))
* **ui:** disable cursor lines for some filetypes ([3545fae](https://github.com/aimuzov/LazyVimx/commit/3545fae59b5d1cd674a6b4282cc9e1072247d35c))
* **ui:** disable floating preview (neo-tree) ([1d9ca7b](https://github.com/aimuzov/LazyVimx/commit/1d9ca7b6a68da994d12dc161caa458e4d6c99231))
* **ui:** disable inlay hints ([8c12cef](https://github.com/aimuzov/LazyVimx/commit/8c12ceff050e1a2633708cc1c5c28bb02bc43be7))
* **ui:** fix backdrop (again) ([e2339e1](https://github.com/aimuzov/LazyVimx/commit/e2339e15a93f9aafec43dd613872b9f4bcc5238a))
* **ui:** fix backdrop for lazygit & remove bottom padding ([74f4a42](https://github.com/aimuzov/LazyVimx/commit/74f4a421ad1a6f33492ae5fae38f827141415603))
* **ui:** fix bufferline groups ([922d2fc](https://github.com/aimuzov/LazyVimx/commit/922d2fc1e968557a88cce9a46411fe570cf2e5f5))
* **ui:** fix config for whitespace ([1820e18](https://github.com/aimuzov/LazyVimx/commit/1820e186e29582e577e85df280b938e288397966))
* **ui:** fix config loading for lazygit ([7910c79](https://github.com/aimuzov/LazyVimx/commit/7910c793d4570c43b82210c0f9bc5c3cbb216f68))
* **ui:** fix delete action for explorer ([b67c546](https://github.com/aimuzov/LazyVimx/commit/b67c546211366f27d3f70369571c9a350443ffaf))
* **ui:** fix deprecated warnings (zen-mode) ([ce7cbe5](https://github.com/aimuzov/LazyVimx/commit/ce7cbe51431b47f6cb7eaa9aecb9abf544cf4e56))
* **ui:** fix exception after opening telescope ([45e236e](https://github.com/aimuzov/LazyVimx/commit/45e236e5abcc0566c65aaff046c7510e2048b7e0))
* **ui:** fix flickering for winbar ([422a1e6](https://github.com/aimuzov/LazyVimx/commit/422a1e617cdde3b96f5ddae9b0fe3ec45b5df0a0))
* **ui:** fix folded hi (again bleat) ([bbd872c](https://github.com/aimuzov/LazyVimx/commit/bbd872cea73af0c0c34d6efc2babcd563b457589))
* **ui:** fix highlight on focus (neotree + edgy) ([055b384](https://github.com/aimuzov/LazyVimx/commit/055b3849a5f70a1cfb40eef91454045a70a6c764))
* **ui:** fix highlights (line numbers) ([67f3f2a](https://github.com/aimuzov/LazyVimx/commit/67f3f2a4d84d918d28bba30feee58b9bf6365afb))
* **ui:** fix highlights for gitsigns ([24fc040](https://github.com/aimuzov/LazyVimx/commit/24fc0402df167a727fa7c20c10add6bfdffe2c0b))
* **ui:** fix highlights for inline diagnostic ([0296bf7](https://github.com/aimuzov/LazyVimx/commit/0296bf7210938ef1684abc3e1b9f23d53af992fd))
* **ui:** fix highlights for mini.icons ([b1e460f](https://github.com/aimuzov/LazyVimx/commit/b1e460fc043dbbe3f5230fe581f460a42080e5c6))
* **ui:** fix highlights for which-key ([aa27d6a](https://github.com/aimuzov/LazyVimx/commit/aa27d6a10e38522de9640ffb73e99105bae03fbe))
* **ui:** fix icon for zshrc ([ec3c8c6](https://github.com/aimuzov/LazyVimx/commit/ec3c8c65ca52fcef8e5cd74a01f7fcb76b53f1b6))
* **ui:** fix path for winbar ([8195891](https://github.com/aimuzov/LazyVimx/commit/8195891c0e74dea9252b705078e99bd246294ced))
* **ui:** fix priority for diagnstostic (virt text) ([a5d19cb](https://github.com/aimuzov/LazyVimx/commit/a5d19cbe1f16ee6a53a29a0e28e54b5f93bc74d4))
* **ui:** fix quickfix replacing by trouble ([aed5b81](https://github.com/aimuzov/LazyVimx/commit/aed5b81058ff92d0249ef17b745686a8f1c60af1))
* **ui:** fix style for bufferline group ([772e987](https://github.com/aimuzov/LazyVimx/commit/772e9878387b856466802d19c3b834c733e5d1e6))
* **ui:** fix term group for bufferline ([e58a99c](https://github.com/aimuzov/LazyVimx/commit/e58a99ce282aebaa4eb0a4e25b26dec2d2ec9f40))
* **ui:** fix whitespace ([a1cb04e](https://github.com/aimuzov/LazyVimx/commit/a1cb04e419f511a5d6b9e6ccad789f062affee78))
* **ui:** hide root dir (neo-tree) ([47b6fb2](https://github.com/aimuzov/LazyVimx/commit/47b6fb20c277d5ee9b74cd0f6bd823a57953c917))
* **ui:** ignore cursor line for alpha filetype ([8fb53ef](https://github.com/aimuzov/LazyVimx/commit/8fb53efd4674263d3eb7d8d870468df807c5c7e4))
* **ui:** ignore cursor line for chatgpt input ([c6ab7b7](https://github.com/aimuzov/LazyVimx/commit/c6ab7b78eb3d73f776665508e4925e7c1a7d8afd))
* **ui:** improve rename file flow ([9c0673e](https://github.com/aimuzov/LazyVimx/commit/9c0673e47e35bc1a11215e777fa277e90f0896ce))
* **ui:** improve which-key config ([33f7f08](https://github.com/aimuzov/LazyVimx/commit/33f7f081531d1074b8e10b7bfdac8d35d04731ff))
* **ui:** migrate from spectre to grugfar ([f8327b6](https://github.com/aimuzov/LazyVimx/commit/f8327b68a9a066ae9e42b2fcdd6fa2d26fa0f335))
* **ui:** override icons ([d8f5246](https://github.com/aimuzov/LazyVimx/commit/d8f5246adf992957cdfa6130ca6c496a5fcdebed))
* **ui:** remove 'loading...' hint (symbol-usage) ([b51ddbd](https://github.com/aimuzov/LazyVimx/commit/b51ddbdc202ff6ab3de27bf3de308352a8b7e7d0))
* **ui:** remove bold style for selection ([32421b2](https://github.com/aimuzov/LazyVimx/commit/32421b2bc484128bd85b7617a1fdb459f2befa29))
* **ui:** remove empty winbar ([af3e69d](https://github.com/aimuzov/LazyVimx/commit/af3e69d78573442854406f9439b5bae6cd1005cb))
* **ui:** remove ext from filenames (bufferline) ([b877d84](https://github.com/aimuzov/LazyVimx/commit/b877d84cc011c245c3554922834cbf7674dc46bb))
* **ui:** remove unused extra (after migration on mini.icons) ([76c4508](https://github.com/aimuzov/LazyVimx/commit/76c4508606e1d87329a40a315d8b237bb3775f57))
* **ui:** remove unused mapping (neo-tree) ([aad3211](https://github.com/aimuzov/LazyVimx/commit/aad321179b960491a23b430a84fe526d7734af35))
* **ui:** remove useless quickfix plugins ([cf5b5f5](https://github.com/aimuzov/LazyVimx/commit/cf5b5f558b72ec8ad2216be102b80751603095d1))
* **ui:** replace colorizer ([d1c8c03](https://github.com/aimuzov/LazyVimx/commit/d1c8c03739a0188f9e1d9691bc7c525ae215b03d))
* **ui:** show lualine always ([027eb66](https://github.com/aimuzov/LazyVimx/commit/027eb662b864c0aae292725b174662d47c240cb7))
* **ui:** show root dir (neo-tree) ([5c36778](https://github.com/aimuzov/LazyVimx/commit/5c3677877513c2012347c9504949c3bc5c06454a))
* **ui:** some improves for flash config ([9a15943](https://github.com/aimuzov/LazyVimx/commit/9a15943879cea05d5587fe1ed3ce1ce5f7de4c6f))
* **ui:** some improves for telescope config ([4491b10](https://github.com/aimuzov/LazyVimx/commit/4491b10a98383cec3ff43a2bf0e827ed40328aeb))
* **ui:** toggle hidden files on click by hint (neo-tree) ([ca2e315](https://github.com/aimuzov/LazyVimx/commit/ca2e315aec3154da2060c7fa92fe8fa7c98be686))
* **ui:** update dashboard logo ([9d5fadb](https://github.com/aimuzov/LazyVimx/commit/9d5fadbf5d0aa70955731f970692f32650b8e6d6))
* **util:** fix exception (sudo) ([febad31](https://github.com/aimuzov/LazyVimx/commit/febad317fbbf8bea7f6eeb8d95f27915c8c1cd0e))

### Refactoring

* **ai:** some renaming & add recommended detection ([abdffa2](https://github.com/aimuzov/LazyVimx/commit/abdffa29aad7d4d08d103b58ad358bd6de836053))
* **buffers:** move files ([46bbfd7](https://github.com/aimuzov/LazyVimx/commit/46bbfd7d6564c3cb6d8f6de7535266513efeaa2b))
* **everything:** simplification ([600a585](https://github.com/aimuzov/LazyVimx/commit/600a585a67e0ebdf54451637f8635f97e52f95f4))
* **everything:** some sueting (╯°□°）╯︵ ┻━┻ ([20826bb](https://github.com/aimuzov/LazyVimx/commit/20826bbf104c224a14bc0512f43901b701246267))
* fix incorrect sequence of plugins calling ([628decd](https://github.com/aimuzov/LazyVimx/commit/628decd6c6772a9e7c3769a3962aa9c91d37e6e8))
* **keys:** rename file ([885431a](https://github.com/aimuzov/LazyVimx/commit/885431a498574b35b3d95cebbdf2add7e3281057))
* **lang:** split formatting config ([ca54403](https://github.com/aimuzov/LazyVimx/commit/ca544034ee087433df9d5232a410e5ebbb4bd184))
* **linting:** fix config style ([b51293a](https://github.com/aimuzov/LazyVimx/commit/b51293a99d412f336d61478f6205fc7054d68884))
* **nav:** fix langmapper config ([9f0f027](https://github.com/aimuzov/LazyVimx/commit/9f0f027e6803ca0e75393b7c51802f7736b1b185))
* **nav:** remove useless table ([59717ba](https://github.com/aimuzov/LazyVimx/commit/59717ba8338b53df7526365191248b888401ef88))
* **repo:** rename plugin ([2b97349](https://github.com/aimuzov/LazyVimx/commit/2b97349498ecf04fa2ba1afc4f3e7f0cb2f69306))
* **ui:** remove indents for statusline config ([fca4ab3](https://github.com/aimuzov/LazyVimx/commit/fca4ab3bed314a83c1c3a552f89aacf8e7bc047d))
* **ui:** remove useless table ([54683a8](https://github.com/aimuzov/LazyVimx/commit/54683a8bbf91a4c4f9e7934fe92e5c56eab626f0))
* **ui:** replace callback by command (autocmd for terminal) ([5ba2a4c](https://github.com/aimuzov/LazyVimx/commit/5ba2a4cef46e6f1e743b37642541258e2297663e))
* **ui:** split config to files ([50e2533](https://github.com/aimuzov/LazyVimx/commit/50e25336d38590dac6b0c43249b0c0758f9928e3))
