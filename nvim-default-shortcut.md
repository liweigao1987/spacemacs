# Neovim v0.12.5 原生快捷键与 Ex 命令参考

> **版本与范围**：本文对应本机 **Neovim v0.12.5**，只整理 Neovim 原生默认按键和内置 Ex 命令。主要且唯一的本机依据是 `/snap/nvim/4860/usr/share/nvim/runtime/doc/index.txt` 与同目录的 `quickref.txt`。
>
> **明确排除**：不读取、不收录本工程的用户映射、leader 前缀映射、配置和第三方插件命令。本文也不混入选项清单、内置函数清单或 Lua API 清单；但 `index.txt` 的 Ex 索引本身列出的内置命令（例如 `:lua`、`:packadd`）仍属于本手册范围。
>
> 在线官方索引：[Neovim User Manual — vimindex](https://neovim.io/doc/user/vimindex/)

## 1. 模式、记号与帮助查询

| 记号 | 含义 |
|---|---|
| `N` / `{count}` | 命令前的可选十进制次数，例如 `3dw`；无计数时通常为 1。 |
| `{motion}` | 光标动作；操作符作用于该动作跨过的文本，例如 `d{motion}`。 |
| `{register}` | 寄存器名；通常用 `"{register}` 选择，或用 `CTRL-R {register}` 插入。 |
| `CTRL-X` | 按住 Ctrl 再按 X；`CTRL-W h` 表示依次按组合键和 `h`。 |
| `Meta` / `M-x` | Meta 修饰键，终端里通常由 Alt 或先按 Esc 表示；索引中 0x80–0xff 的 Meta 字符默认未用。 |
| `<CR>` / `<Esc>` | 回车 / Escape。 |
| `<BS>` / `<Tab>` | Backspace / Tab。 |
| `CHAR` | 任意非空白字符；`WORD` 是连续非空白字符序列。小写 `word` 按关键字字符边界划分。 |
| `[]` | 在 Ex 命令名中表示可省略后缀，如 `:h[elp]` 的最短写法是 `:h`，完整写法是 `:help`；不是要输入的方括号。 |
| `{...}` / `[...]` | 一般表示必需参数 / 可选参数；具体以对应 `:help` 为准。 |

常见模式：Normal（普通）、Insert/Replace（插入/替换）、Visual/Select（可视/选择）、Operator-pending（操作符等待动作）、Command-line（Ex/搜索命令行）、Terminal（终端作业输入）。

查询帮助：`:help index` 打开总索引；`:help i_CTRL-X`、`:help CTRL-W`、`:help v_aW`、`:help :substitute` 查询具体主题；光标放在帮助标签上按 `CTRL-]` 跳转，`CTRL-T` 返回；`:helpgrep {pattern}` 搜索全部帮助。

## 2. Insert 模式

### 2.1 基本键

| 按键 | 原生用途 |
|---|---|
| `CTRL-@` | 插入上次插入文本并退出 Insert。 |
| `CTRL-A` | 插入上次插入文本。 |
| `CTRL-C` | 退出 Insert，不检查缩写。 |
| `CTRL-D` / `CTRL-T` | 当前行减少 / 增加一个 `shiftwidth` 缩进。 |
| `0 CTRL-D` / `^ CTRL-D` | 删除本行全部缩进；后者在下一行恢复。 |
| `CTRL-E` / `CTRL-Y` | 插入光标下方 / 上方字符。 |
| `CTRL-G CTRL-J`、`CTRL-G j`、`CTRL-G <Down>` | 下移一行，到开始插入时的列。 |
| `CTRL-G CTRL-K`、`CTRL-G k`、`CTRL-G <Up>` | 上移一行，到开始插入时的列。 |
| `CTRL-G u` / `CTRL-G U` | 开始新的可撤销编辑块 / 下次移动不打断撤销块。 |
| `<BS>` / `CTRL-H` | 删除光标前字符。 |
| `{char1}<BS>{char2}` | 启用 `digraph` 时输入二合字。 |
| `<Tab>` / `CTRL-I` | 插入 Tab。 |
| `<NL>` / `CTRL-J` / `<CR>` / `CTRL-M` | 新建一行。 |
| `CTRL-K {char1} {char2}` | 输入二合字。 |
| `CTRL-N` / `CTRL-P` | 补全光标前关键字的下一个 / 上一个匹配。 |
| `CTRL-O {command}` | 临时执行一个 Normal 命令后返回 Insert。 |
| `CTRL-Q` / `CTRL-V {char}` | 原样插入下一字符；后接数字可输入最多三位十进制字节值。 |
| `CTRL-SHIFT-Q` / `CTRL-SHIFT-V` | 未启用 TUI modifyOtherKeys 时分别同 `CTRL-Q` / `CTRL-V`。 |
| `CTRL-R {register}` | 插入寄存器内容。 |
| `CTRL-R CTRL-R {register}` | 原样插入寄存器内容。 |
| `CTRL-R CTRL-O {register}` | 原样插入且不自动缩进。 |
| `CTRL-R CTRL-P {register}` | 原样插入并修正缩进。 |
| `CTRL-U` | 删除本行本次已输入内容。 |
| `CTRL-W` | 删除光标前一个词。 |
| `CTRL-X {mode}` | 进入 `CTRL-X` 补全子模式。 |
| `<Esc>` / `CTRL-[` | 结束 Insert。 |
| `CTRL-\ CTRL-N` / `CTRL-\ CTRL-G` | 进入 Normal。 |
| `CTRL-]` | 触发缩写。 |
| `CTRL-^` | 切换 `:lmap` 映射。 |
| `CTRL-_` | 设置 `allowrevins` 时切换反向插入。 |
| `<Del>` | 删除光标下字符。 |

### 2.2 移动、特殊键与鼠标

| 按键 | 原生用途 |
|---|---|
| `<Left>` / `<Right>` / `<Up>` / `<Down>` | 左、右、上、下移动。 |
| `<S-Left>` / `<C-Left>` | 左移一个词。 |
| `<S-Right>` / `<C-Right>` | 右移一个词。 |
| `<S-Up>` / `<S-Down>` | 同 `<PageUp>` / `<PageDown>`。 |
| `<Home>` / `<End>` | 行首 / 行尾之后。 |
| `<C-Home>` / `<C-End>` | 文件开头 / 文件末尾。 |
| `<PageUp>` / `<PageDown>` | 后退 / 前进一屏。 |
| `<F1>` / `<Help>` | 退出 Insert 并打开帮助。 |
| `<Insert>` | 切换 Insert/Replace。 |
| `<LeftMouse>` | 光标移到点击处。 |
| `<ScrollWheelDown>` / `<ScrollWheelUp>` | 窗口下 / 上滚三行。 |
| `<S-ScrollWheelDown>` / `<S-ScrollWheelUp>` | 窗口下 / 上滚一页。 |
| `<ScrollWheelLeft>` / `<ScrollWheelRight>` | 窗口左 / 右滚六列。 |
| `<S-ScrollWheelLeft>` / `<S-ScrollWheelRight>` | 窗口左 / 右滚一页。 |

### 2.3 `CTRL-X` 子模式

| 按键 | 补全来源/动作 |
|---|---|
| `CTRL-X CTRL-D` | 已定义标识符。 |
| `CTRL-X CTRL-E` / `CTRL-X CTRL-Y` | 补全期间向上 / 向下滚动。 |
| `CTRL-X CTRL-F` | 文件名。 |
| `CTRL-X CTRL-I` | 当前及包含文件中的标识符。 |
| `CTRL-X CTRL-K` / `CTRL-X CTRL-T` | 字典 / 同义词库。 |
| `CTRL-X CTRL-L` | 整行。 |
| `CTRL-X CTRL-N` / `CTRL-X CTRL-P` | 下一个 / 上一个匹配。 |
| `CTRL-X CTRL-O` | Omni 补全。 |
| `CTRL-X CTRL-R` | 寄存器内容。 |
| `CTRL-X CTRL-S` / `CTRL-X s` | 拼写建议。 |
| `CTRL-X CTRL-U` | `completefunc`。 |
| `CTRL-X CTRL-V` | Ex 命令行式补全。 |
| `CTRL-X CTRL-Z` | 停止补全，文本不变。 |
| `CTRL-X CTRL-]` | 标签。 |

补全菜单中：`CTRL-E` 取消并恢复原文，`CTRL-Y` 接受，`CTRL-L` 从当前匹配多插一字符，`<CR>` 接受当前项，`<BS>`/`CTRL-H` 删一字符并重搜，`<Up>`/`<Down>` 前后选项，`<PageUp>`/`<PageDown>` 跨多项，其他字符结束补全并插入。

### 2.4 Insert 未使用/保留

| 按键 | 状态 |
|---|---|
| `CTRL-F` | 未使用，但默认可在 `cinkeys` 中触发重缩进。 |
| `CTRL-S` | 未使用，或被终端流控占用。 |
| `CTRL-\ a` … `CTRL-\ z` | 为扩展保留（已定义的 `CTRL-N`/`CTRL-G` 除外）。 |
| 其他 `CTRL-\` 组合 | 未使用。 |
| `<Space>` 至 `~` | 通常直接插入；索引称无特殊命令，例外为 `0`/`^` 后接 `CTRL-D`。 |
| Meta 字符 0x80–0xff | 未使用。 |

## 3. Normal 模式

### 3.1 基础、移动、编辑与重复

| 按键 | 原生用途 |
|---|---|
| `CTRL-A` / `CTRL-X` | 光标处或之后的数字加 / 减 `N`。 |
| `CTRL-B` / `CTRL-F` | 后退 / 前进 `N` 屏。 |
| `CTRL-D` / `CTRL-U` | 下 / 上滚 `N` 行（默认半屏）。 |
| `CTRL-E` / `CTRL-Y` | 窗口上 / 下滚 `N` 行。 |
| `CTRL-C` | 中断当前命令或搜索。 |
| `CTRL-G` | 显示文件名和位置；`CTRL-L` 重绘。 |
| `<BS>` / `CTRL-H` / `h` / `<Left>` | 左移；`<Space>` / `l` / `<Right>` 右移。 |
| `<Tab>` / `CTRL-I` | 跳转列表中前进 `N` 项；`CTRL-O` 后退 `N` 项。 |
| `<NL>` / `CTRL-J` / `CTRL-N` / `j` / `<Down>` | 下移；`CTRL-P` / `k` / `<Up>` 上移。 |
| `<CR>` / `CTRL-M` / `+` | 下 `N` 行并到首个 `CHAR`；`-` 上 `N` 行到首个 `CHAR`。 |
| `CTRL-R` | 重做；`u` 撤销；`U` 撤销当前行最近修改；`.` 重复最近修改。 |
| `CTRL-T` | 标签栈后退 `N` 项；`CTRL-]` 跳到光标下标签。 |
| `CTRL-V` | 块 Visual；`v` 字符 Visual；`V` 行 Visual。 |
| `CTRL-W {char}` | 窗口命令，见后文。 |
| `CTRL-Z` | 挂起程序/启动 shell。 |
| `CTRL-^` | 编辑第 `N` 个 alternate file，即 `:e #N`。 |
| `CTRL-<Tab>` / `<C-Tab>` | 同 `g<Tab>`，到上次访问标签页。 |
| `!{motion}{filter}` / `!!{filter}` | 外部命令过滤动作范围 / `N` 行。 |
| `"{register}` | 为下一次删除、复制或粘贴选择寄存器。 |
| `#` / `*` | 反向 / 正向搜索光标下标识符。 |
| `$` / `0` / `^` / `_` | 行尾；行首；首个非空白；下 `N-1` 行首个非空白。 |
| `%` / `{count}%` | 匹配括号、注释或预处理指令；跳到文件百分比。 |
| `&` | 重复最近 `:substitute`。 |
| `(` / `)` | 后退 / 前进 `N` 句。 |
| `{` / `}` | 后退 / 前进 `N` 段。 |
| `,` / `;` | 反向 / 同向重复最近 `f/F/t/T`。 |
| `/{pattern}<CR>` / `?{pattern}<CR>` | 正向 / 反向搜索；`/<CR>`、`?<CR>` 复用最近模式。 |
| `1`…`9` | 构成前置计数；输入计数时 `<Del>` 删除末位。 |
| `:` / `{count}:` | 进入 Ex；带计数时范围从当前行至下 `N-1` 行。 |
| `<{motion}` / `<<` | 左移范围 / `N` 行一个 `shiftwidth`。 |
| `={motion}` / `==` | 缩进范围 / `N` 行。 |
| `>{motion}` / `>>` | 右移范围 / `N` 行一个 `shiftwidth`。 |
| `@{a-z}` / `@@` / `@:` | 执行寄存器宏 / 重复宏 / 重复上一 Ex。 |
| `A` / `a` / `I` / `i` | 行尾后追加；光标后追加；首个 `CHAR` 前插入；光标前插入。 |
| `O` / `o` | 上 / 下方新建行并插入。 |
| `R` | Replace 模式。 |
| `C` / `c{motion}` / `cc` / `S` / `s` | 改到行尾；改范围；改行；改 `N` 行；改 `N` 字符。 |
| `D` / `d{motion}` / `dd` | 删到行尾；删范围；删 `N` 行。 |
| `X` / `x` / `<Del>` | 删除光标前 / 光标下 `N` 字符。 |
| `Y` / `y{motion}` / `yy` | 复制 `N` 行；复制范围；复制 `N` 行。注意 `Y` 的默认映射另见官方 `default-mappings`。 |
| `P` / `p` | 在光标前 / 后粘贴。 |
| `J` | 连接 `N` 行（默认 2）。 |
| `B/W/E` | 按 `WORD` 后退 / 前进 / 到结尾；`b/w/e` 为 `word` 版本。 |
| `F{char}` / `T{char}` | 向左找到字符 / 停在字符之后。 |
| `f{char}` / `t{char}` | 向右找到字符 / 停在字符之前。 |
| `G` / `H` / `M` / `L` | 第 `N` 行（默认末行）；屏顶第 `N` 行；屏中；屏底第 `N` 行。 |
| `K` | 以 `keywordprg` 查询光标下关键字。 |
| `N` / `n` | 反向 / 同向重复最近搜索。 |
| `q{0-9a-zA-Z"}` / `q` / `Q` | 开始录制（大写追加）/ 停止 / 回放最近寄存器。 |
| `q:` / `q/` / `q?` | 打开 Ex / 正向搜索 / 反向搜索命令行窗口。 |
| `r{char}` | 用字符替换 `N` 个字符。 |
| `m{A-Za-z}` | 设置标记。 |
| `do` / `dp` | 同 `:diffget` / `:diffput`。 |
| `ZZ` / `ZQ` | 有改动则写入并关闭 / 不写入关闭。 |
| `\` | 未使用。 |
| `\|` | 到第 `N` 列。 |
| `~` / `~{motion}` | `tildeop` 关闭时切换 `N` 字符大小写；开启时作为操作符。 |

### 3.2 标记动作

| 按键 | 原生用途 |
|---|---|
| `'{mark}` / `` `{mark} `` | 到标记所在行首个 `CHAR` / 精确位置。标记可为 `a-zA-Z0-9`。 |
| `''` / `` `` `` | 到最近跳转前所在行 / 精确位置。 |
| `'(`/`')`、`` `(``/`` `)`` | 当前句子的开始 / 结束（行首版 / 精确版）。 |
| `'{`/`'}`、`` `{``/`` `}`` | 当前段落开始 / 结束。 |
| `'<`/`'>`、`` `<``/`` `>`` | 最近 Visual 区域开始 / 结束。 |
| `'[`/`']`、`` `[` ``/`` `]` `` | 最近操作或粘贴文本开始 / 结束。 |

### 3.3 Normal 特殊键与鼠标

| 按键 | 原生用途 |
|---|---|
| `<C-End>` / `<C-Home>` | 同 `G` / `gg`。 |
| `<C-Left>` / `<S-Left>` | 同 `b`；`<C-Right>` / `<S-Right>` 同 `w`。 |
| `<End>` / `<Home>` | 同 `$` / `0`。 |
| `<F1>` / `<Help>` | 打开帮助；`<Insert>` 同 `i`；`<Undo>` 同 `u`。 |
| `<PageDown>` / `<S-Down>` / `<S-CR>` / `<S-NL>` / `<S-+>` | 同 `CTRL-F`。 |
| `<PageUp>` / `<S-Up>` / `<S-->` | 同 `CTRL-B`。 |
| `<LeftMouse>` | 光标到点击处。 |
| `<MiddleMouse>` | 点击处执行 `gP`。 |
| `<RightMouse>` | 开始 Visual 并移动到点击处。 |
| `<C-LeftMouse>` | 点击处执行标签跳转；`<C-RightMouse>` 同 `CTRL-T`。 |
| `<S-LeftMouse>` / `<S-RightMouse>` | 点击处执行 `*` / `#`。 |
| `<ScrollWheelDown>` / `<ScrollWheelUp>` | 下 / 上滚三行；Shift 版本滚一页。 |
| `<ScrollWheelLeft>` / `<ScrollWheelRight>` | 左 / 右滚六列；Shift 版本滚一页。 |

未使用/保留：`CTRL-@`、`CTRL-K`、`CTRL-_` 未使用；`CTRL-Q`、`CTRL-S` 未使用或被流控占用；`CTRL-[`/`<Esc>` 在 Normal 无操作；`CTRL-\ a`…`z` 为扩展保留（`CTRL-N`/`CTRL-G` 已定义），其他 `CTRL-\` 未使用。

## 4. 文本对象（Operator-pending 与 Visual）

`a` 对象通常包含分隔符/相邻空白，`i` 对象为 inner。以下为 `index.txt` 全部对象：

| 对象 | 作用 | 对象 | 作用 |
|---|---|---|---|
| `a"` / `i"` | 双引号字符串（含 / 不含引号） | `a'` / `i'` | 单引号字符串 |
| `` a` `` / `` i` `` | 反引号字符串 | `aw` / `iw` | 一个 word / inner word |
| `aW` / `iW` | 一个 WORD / inner WORD | `as` / `is` | 句子 |
| `ap` / `ip` | 段落 | `at` / `it` | 标签块 |
| `ab`、`a(`、`a)` / `ib`、`i(`、`i)` | `()` 块 | `aB`、`a{`、`a}` / `iB`、`i{`、`i}` | `{}` 块 |
| `a[`、`a]` / `i[`、`i]` | `[]` 块 | `a<`、`a>` / `i<`、`i>` | `<>` 块 |

## 5. `CTRL-W` 窗口命令

| 按键 | 原生用途 |
|---|---|
| `CTRL-W h/j/k/l` | 到左/下/上/右第 `N` 个窗口；箭头和 `CTRL-H/J/K/L` 同义。 |
| `CTRL-W w` / `CTRL-W W` | 循环到后 / 前第 `N` 个窗口；`CTRL-W CTRL-W` 同前者。 |
| `CTRL-W t` / `CTRL-W b` / `CTRL-W p` / `CTRL-W CTRL-P` / `CTRL-W P` | 顶部 / 底部 / 上次访问 / 上次访问 / 预览窗口。 |
| `CTRL-W s` / `CTRL-W S` / `CTRL-W CTRL-S` | 水平拆分。 |
| `CTRL-W v` / `CTRL-W CTRL-V` | 垂直拆分。 |
| `CTRL-W n` / `CTRL-W CTRL-N` | 新建窗口。 |
| `CTRL-W c` / `CTRL-W q` / `CTRL-W o` | 关闭当前 / 退出当前 / 仅保留当前。相应 Ctrl 版本 `CTRL-C` 为 no-op，`CTRL-Q/O` 同字母。 |
| `CTRL-W r` / `CTRL-W R` | 向下 / 向上轮转窗口 `N` 次；`CTRL-W CTRL-R` 同 `r`。 |
| `CTRL-W x` / `CTRL-W CTRL-X` | 与第 `N` 个（默认下一个）窗口交换。 |
| `CTRL-W H/J/K/L` | 把当前窗口移到最左 / 最下 / 最上 / 最右。 |
| `CTRL-W T` / `CTRL-W CTRL-T` | 当前窗口移到新标签页。 |
| `CTRL-W +` / `CTRL-W -` | 高度增 / 减 `N` 行。 |
| `CTRL-W >` / `CTRL-W <` | 宽度增 / 减 `N` 列。 |
| `CTRL-W =` | 所有窗口等宽等高。 |
| `CTRL-W _` / `CTRL-W CTRL-_` | 高度设为 `N`（默认极高）。 |
| `CTRL-W \|` | 宽度设为 `N`。 |
| `CTRL-W f` / `CTRL-W F` | 拆分并编辑光标下文件；大写还跳到文件名后的行号。Ctrl 版本 `CTRL-F` 同 `f`。 |
| `CTRL-W d` / `CTRL-W i` | 拆分并跳到光标下定义 / 声明；Ctrl 版本同义。 |
| `CTRL-W ]` / `CTRL-W CTRL-]` | 拆分并跳到光标下标签。 |
| `CTRL-W ^` / `CTRL-W CTRL-^` | 拆分并编辑第 `N` 个 alternate file。 |
| `CTRL-W }` | 在预览窗口显示标签。 |
| `CTRL-W z` / `CTRL-W CTRL-Z` | 关闭预览窗口。 |
| `CTRL-W g CTRL-]` / `CTRL-W g ]` / `CTRL-W g }` | 拆分 `:tjump` / 拆分 `:tselect` / `:ptjump`。 |
| `CTRL-W g f` / `CTRL-W g F` | 新标签页编辑光标下文件；大写跳到后续行号。 |
| `CTRL-W g t` / `CTRL-W g T` / `CTRL-W g <Tab>` | 下一 / 上一 / 上次访问标签页。 |
| `CTRL-W CTRL-B/D/I` | 分别同 `CTRL-W b/d/i`；`CTRL-W CTRL-G` 表示后续 `CTRL-W g ...`。 |

## 6. `[` 与 `]` 前缀

| 前向/后向 | 原生用途 |
|---|---|
| `[ CTRL-D` / `] CTRL-D` | 从文件开头 / 光标处搜索并跳到匹配光标词的首个 `#define`。 |
| `[ CTRL-I` / `] CTRL-I` | 从文件开头 / 光标处搜索并跳到包含光标词的首行。 |
| `[#` / `]#` | 前一个未匹配 `#if/#else/#ifdef` / 后一个未匹配 `#else/#endif`。 |
| `['` / `]'` | 前 / 后一个小写标记，落到首个非空白。 |
| `` [` `` / `` ]` `` | 前 / 后一个小写标记精确位置。 |
| `[(` / `])` | 前一个未匹配 `(` / 后一个未匹配 `)`。 |
| `[{` / `]}` | 前一个未匹配 `{` / 后一个未匹配 `}`。 |
| `[*` / `]*` | 同 `[/` / `]/`，前一个 C 注释开头 / 后一个 C 注释结尾。 |
| `[[` / `]]` | 前 / 后 `N` 个 section 开始。 |
| `[]` / `][` | 前 / 后 `N` 个 SECTION 结束。 |
| `[D` / `]D` | 列出从文件开头 / 光标处找到的全部匹配 `#define`。 |
| `[I` / `]I` | 列出从文件开头 / 光标处找到的全部包含词的行。 |
| `[d` / `]d` | 显示从文件开头 / 光标处找到的首个匹配 `#define`。 |
| `[i` / `]i` | 显示从文件开头 / 光标处找到的首个包含词的行。 |
| `[P` / `]P` | 同 `[p`。 |
| `[p` / `]p` | 类似 `P` / `p`，按当前行修正缩进。 |
| `[c` / `]c` | 前 / 后第 `N` 个变更起点。 |
| `[f` / `]f` | 同 `gf`。 |
| `[m` / `]m` | 前一个成员函数开头 / 后一个成员函数结尾。 |
| `[s` / `]s` | 前 / 后一个拼错词。 |
| `[z` / `]z` | 当前打开折叠的开始 / 结束。 |
| `[<MiddleMouse>` / `]<MiddleMouse>` | 同 `[p` / `]p`。 |

## 7. `g` 前缀

| 按键 | 原生用途 |
|---|---|
| `g CTRL-G` | 显示详细光标位置；`g CTRL-H` 开始块 Select；`g CTRL-]` 对光标下标签执行 `:tjump`。 |
| `g#` / `g*` | 类似 `#` / `*`，但允许部分词匹配。 |
| `g0` / `g^` / `g$` / `g<End>` | 屏幕行首 / 首个非空白 / 行末 / 最右非空白。 |
| `g&` | 在所有行重复最近替换。 |
| `g'{mark}` / `` g`{mark} `` | 像 `'` / `` ` `` 跳标记但不改 jumplist。 |
| `g+` / `g-` | 撤销树中到较新 / 较旧文本状态 `N` 次。 |
| `g,` / `g;` | change list 中到较新 / 较旧位置。 |
| `g8` / `ga` | 显示光标下 UTF-8 字节十六进制 / 字符数值。 |
| `g<` | 显示上一命令输出。 |
| `g?{motion}` / `g??` / `g?g?` | ROT13 操作符 / 当前行。 |
| `gD` / `gd` | 当前文件 / 当前函数内的定义。 |
| `gE` / `ge` | 后退到前一个 `WORD` / `word` 的结尾。 |
| `gH` / `gh` | 行 Select / 字符 Select。 |
| `gI` / `gi` | 第 1 列插入 / 先到 `'^` 标记再插入。 |
| `gJ` | 不插空格连接行。 |
| `gN` / `gn` | 找上 / 下一个最近搜索匹配并 Visual 选中。 |
| `gP` / `gp` | 光标前 / 后粘贴，光标留在新文本之后。 |
| `gQ` | 进入带 Vim 编辑的 Ex 模式。 |
| `gR` | Virtual Replace。 |
| `gT` / `gt` / `g<Tab>` | 上一 / 下一 / 上次访问标签页。 |
| `gU{motion}` / `gu{motion}` / `g~{motion}` | 转大写 / 小写 / 切换大小写。 |
| `gV` | Select 映射/菜单执行时不重选旧 Visual 区域。 |
| `g]` | 对光标下标签执行 `:tselect`。 |
| `g_` | 下 `N-1` 行最后一个 `CHAR`。 |
| `gf` / `gF` | 编辑光标下文件；大写并跳至文件名后行号。 |
| `gg` | 第 `N` 行，默认首行。 |
| `gj` / `gk` / `g<Down>` / `g<Up>` | 按屏幕行下 / 上移动。 |
| `gm` / `gM` | 屏幕行 / 文本行中间字符。 |
| `go` | 缓冲区第 `N` 字节。 |
| `gq{motion}` / `gw{motion}` | 格式化，后者保持光标。 |
| `gr{char}` | 虚拟替换 `N` 字符。 |
| `gs` | 休眠 `N` 秒。 |
| `gv` | 重选最近 Visual 区域。 |
| `gx` | 用系统应用打开光标下路径。 |
| `g@{motion}` | 调用 `operatorfunc`。 |
| `g<Home>` | 同 `g0`。 |
| `g<LeftMouse>` / `g<RightMouse>` | 同 Ctrl 左 / 右键；`g<MiddleMouse>` 同 Ctrl 中键。 |

## 8. `z` 前缀

| 按键 | 原生用途 |
|---|---|
| `z<CR>` / `zt` | 重绘并让当前行置顶；前者光标到首个非空白。 |
| `z{height}<CR>` | 重绘并把窗口设为指定高度。 |
| `z+` / `z^` | 到第 `N` 行（默认窗口下 / 上方一行）并分别按顶部 / 底部方式重绘。 |
| `z-` / `zb` | 当前行置底；前者到首个非空白。 |
| `z.` / `zz` | 当前行居中；前者到首个非空白。 |
| `z=` | 拼写建议。 |
| `za` / `zA` | 切换折叠 / 递归切换。 |
| `zc` / `zC` | 关闭折叠 / 递归关闭。 |
| `zd` / `zD` | 删除折叠 / 递归删除。 |
| `zE` | 删除全部折叠。 |
| `zf{motion}` / `zF` | 为动作范围 / `N` 行创建折叠。 |
| `zo` / `zO` | 打开折叠 / 递归打开。 |
| `zi` / `zn` / `zN` | 切换 / 关闭 / 开启 `foldenable`。 |
| `zM` / `zR` | `foldlevel` 设为 0 / 最深。 |
| `zm` / `zr` | `foldlevel` 减 / 加 1。 |
| `zX` / `zx` | 重新应用 `foldlevel`；后者再执行 `zv`。 |
| `zv` | 打开足够折叠以显示光标行。 |
| `zj` / `zk` | 下一折叠开始 / 前一折叠结束。 |
| `zh` / `zl` / `z<Left>` / `z<Right>` | `wrap` 关闭时右 / 左滚 `N` 字符。 |
| `zH` / `zL` | `wrap` 关闭时右 / 左滚半屏宽。 |
| `ze` / `zs` | 水平滚动使光标位于屏幕右 / 左侧。 |
| `zg` / `zG` | 永久 / 临时标记为拼写正确。 |
| `zw` / `zW` | 永久 / 临时标记为拼写错误。 |
| `zug` / `zuG` / `zuw` / `zuW` | 撤销对应 `zg` / `zG` / `zw` / `zW`。 |
| `zp` / `zP` | 块模式粘贴但不带尾随空格。 |
| `zy` | 复制但不带尾随空格。 |

## 9. Operator-pending 与 Visual 差异键

Operator-pending 中：`v` 强制字符方式，`V` 强制行方式，`CTRL-V` 强制块方式。

Visual 大多数键同 Normal；下表是索引明确列出的差异（文本对象见第 4 节）：

| 按键 | Visual/Select 用途 |
|---|---|
| `CTRL-\ CTRL-N` / `CTRL-\ CTRL-G` / `CTRL-C` / `<Esc>` | 停止 Visual 或回 Normal。 |
| `CTRL-A` / `CTRL-X` | 选区数字加 / 减 `N`；`g CTRL-A` / `g CTRL-X` 为逐项递增/递减形式。 |
| `CTRL-G` | Visual 与 Select 互换。 |
| `<BS>` / `CTRL-H` | Select 中删除高亮区。 |
| `CTRL-O` | Select 中临时执行一个 Visual 命令。 |
| `CTRL-V` / `V` / `v` | 切为块 / 行 / 字符 Visual，或停止同类模式。 |
| `CTRL-]` | 跳到高亮标签。 |
| `!` / `:` | 过滤选中行 / 以选中行为 Ex 范围。 |
| `<` / `=` / `>` | 左移 / 重缩进 / 右移选中行。 |
| `A` / `I` | 块 Visual：每行选区后追加 / 前插入相同文本。 |
| `C` / `R` / `S` | 删除高亮行并插入。 |
| `D` / `X` | 删除高亮行。 |
| `J` / `gJ` | 连接选中行（后者不插空格）。 |
| `K` | 对高亮区运行 `keywordprg`。 |
| `O` / `o` | 到选区另一角（`O` 水平角）。 |
| `P` | 用寄存器替换选区且寄存器不变。 |
| `p` | 用寄存器替换选区，删除文本进入 unnamed register。 |
| `U` / `u` / `~` | 选区大写 / 小写 / 切换大小写。 |
| `Y` / `y` | 按行复制 / 复制选区。 |
| `c` / `s` | 删除选区并插入。 |
| `d` / `x` | 删除选区。 |
| `r{char}` | 用字符替换选区。 |
| `gq` | 格式化选中行。 |
| `gv` | 交换当前与上次选区。 |
| `a"`、`a'`、`a(`/`a)`、`a<`/`a>`、`aB`、`aW`、`a[`/`a]`、`` a` ``、`ab`、`ap`、`as`、`at`、`aw`、`a{`/`a}` | 扩展到对应“a”文本对象。 |
| `i"`、`i'`、`i(`/`i)`、`i<`/`i>`、`iB`、`iW`、`i[`/`i]`、`` i` ``、`ib`、`ip`、`is`、`it`、`iw`、`i{`/`i}` | 扩展到对应 inner 文本对象。 |

## 10. Command-line 编辑与补全

| 按键 | 原生用途 |
|---|---|
| `CTRL-A` / `CTRL-D` / `CTRL-L` | 插入全部补全 / 列出匹配 / 插入最长公共部分。 |
| `<Tab>` / `CTRL-I` / `wildchar` | 上下文补全；`<S-Tab>` 同 `CTRL-P`。 |
| `CTRL-N` / `CTRL-P` | 补全后下 / 上一匹配；否则回忆较旧命令行。 |
| `CTRL-B` / `CTRL-E` | 到命令行首 / 尾。 |
| `CTRL-C` / `<Esc>` / `CTRL-[` | 放弃命令行。 |
| `CTRL-G` / `CTRL-T` | `incsearch` 时下 / 上一匹配。 |
| `<BS>` / `CTRL-H` / `<Del>` | 删除光标前 / 下字符。 |
| `{char1}<BS>{char2}` / `CTRL-K {char1} {char2}` | 输入二合字。 |
| `<NL>` / `CTRL-J` / `<CR>` / `CTRL-M` | 执行命令行。 |
| `CTRL-Q` / `CTRL-V` | 原样插入；数字形式输入十进制字节。 |
| `CTRL-R {regname}` | 像键入一样插入寄存器或光标对象；`CTRL-R CTRL-R`、`CTRL-R CTRL-O` 原样插入。 |
| `CTRL-U` / `CTRL-W` | 删到命令行开头 / 删除前一个词。 |
| `CTRL-\ e {expr}` | 用表达式结果替换整条命令行。 |
| `CTRL-\ CTRL-N` / `CTRL-\ CTRL-G` | 放弃命令行并到 Normal。 |
| `CTRL-]` / `CTRL-^` | 触发缩写 / 切换 `:lmap`。 |
| `<Left>` / `<Right>` | 左 / 右；Shift 或 Ctrl 版本按词移动。 |
| `<Up>` / `<Down>` | 回忆匹配当前前缀的旧 / 新命令；Shift 版本不按前缀。 |
| `<PageUp>` / `<PageDown>` | 同 `<S-Up>` / `<S-Down>`。 |
| `<Home>` / `<End>` | 命令行首 / 尾。 |
| `<Insert>` | 插入/覆盖切换；`<LeftMouse>` 到点击处。 |
| `CTRL-F` | 默认 `cedit`：打开命令行窗口。 |

wildmenu：`<Up>` 到父级，`<Down>` 到子菜单，`<Left>`/`<Right>` 前/后匹配，`<CR>` 进入菜单子级，`CTRL-E` 取消恢复，`CTRL-Y` 接受；`wildoptions=pum` 时 `<PageUp>`/`<PageDown>` 跨多项。

未使用/保留：`CTRL-@`、`CTRL-O` 未使用；`CTRL-S` 未使用或流控；`CTRL-X` 为补全保留，`CTRL-Z` 为挂起保留；`CTRL-Y` 复制 modeless selection；`CTRL-\ a-d`、`f-z` 为扩展保留，其他 `CTRL-\` 未使用（`e`、`CTRL-N/G` 已定义）。

## 11. Terminal 模式

终端缓冲区中，除 `CTRL-\` 外所有键都转发给终端作业。按 `CTRL-\` 后，下一键也会转发，例外：`CTRL-\ CTRL-N` 进入 Normal；`CTRL-\ CTRL-O` 执行一个 Normal 命令后返回 Terminal。

## 12. 实用组合与 Ex 语法

### 12.1 操作符 + 动作

格式：`["{register}][N]{operator}[N]{motion}`，两个计数相乘。常见操作符：`d` 删除、`c` 修改、`y` 复制、`>`/`<` 缩进、`=` 重缩进、`gq` 格式化、`gu`/`gU`/`g~` 大小写、`!` 外部过滤、`g@` 调用 `operatorfunc`。例：`daw` 删除一个词，`ci"` 修改双引号内部，`2d3w` 删除 6 个词，`"ayy` 复制当前行到寄存器 a。

### 12.2 Ex 范围与地址

| 写法 | 含义 |
|---|---|
| `:{number}` / `:.` / `:$` | 绝对行 / 当前行 / 末行。 |
| `:%` / `:*` | 全文件 `1,$` / 最近 Visual 区 `'<,'>`。 |
| `:'t` | 标记 t 所在行。 |
| `:/{pattern}/` / `:?{pattern}?` | 下 / 上一个匹配行。 |
| `:+[num]` / `:-[num]` | 相对前一地址加 / 减行数，默认 1。 |
| `:{a},{b}` | 两地址范围；第二地址按当前光标解析。 |
| `:{a};{b}` | 先把光标设到第一地址，再解析第二地址。 |

例：`:.,+5p` 打印当前到后 5 行；`:'<,'>sort` 排序 Visual 选区；`:/BEGIN/,/END/d` 删除两模式之间行。

### 12.3 寄存器

`"a`–`"z` 命名寄存器，大写追加；`"0` 最近复制，`"1`–`"9` 删除历史，`"-` 小删除，`""` unnamed，`"_` black-hole，`"+`/`"*` 系统剪贴板，`"%` 当前文件名，`"#` alternate file，`":` 最近 Ex，`"/` 最近搜索，`".` 最近插入，`"=` 表达式。`:registers` 查看；Insert/Command-line 用 `CTRL-R {register}` 插入。

### 12.4 搜索替换、`global` 与 `normal`

基本式：`:[range]s[ubstitute]/{pattern}/{replacement}/[flags] [count]`。常用 flag：`g` 每行全部，`c` 逐项确认，`i` 忽略大小写，`I` 强制区分，`n` 只计数，`e` 无匹配不报错，`p`/`#`/`l` 打印结果，`&` 复用旧 flag。替换中 `&` 代表完整匹配，`\1`…`\9` 为捕获组，`\r` 换行，`\=` 后接表达式。

- `:%s/foo/bar/gc`：全文件逐项确认替换。
- `:[range]g[lobal]/{pattern}/{cmd}`：对匹配行执行命令；`:v[global]` 或 `:g!` 对不匹配行执行。
- `:g/TODO/normal! 0f:x`：在匹配行执行不受映射影响的 Normal 键序列。
- `:[range]norm[al][!] {commands}`：逐行执行 Normal 命令；`!` 使用原生键而忽略映射。

### 12.5 批量 `do` 命令

| 命令 | 典型用法 |
|---|---|
| `:argdo {cmd}` | 对参数列表每项执行，如 `:argdo update`。 |
| `:bufdo {cmd}` | 对每个 listed buffer 执行，如 `:bufdo %s/a/b/ge \| update`。 |
| `:windo {cmd}` | 对当前标签页每个窗口执行。 |
| `:tabdo {cmd}` | 对每个标签页执行。 |
| `:cdo {cmd}` / `:cfdo {cmd}` | 对 quickfix 每个有效条目 / 每个文件执行。 |
| `:ldo {cmd}` / `:lfdo {cmd}` | 对当前窗口 location list 每个有效条目 / 每个文件执行。 |

## 13. 内置 Ex 命令完整索引

以下逐条对应 `index.txt` 的 `ex-cmd-index`。表中“完整 / 最短”保留大小写差异；`[]` 说明见第 1 节。命令是否接受范围、`!`、参数及修饰符，请继续用 `:help :命令名` 查完整语法。

### 13.1 标点、数字与 A–G

| 完整 / 最短 | 中文用途 |
|---|---|
| `:` / `:` | 空操作。 |
| `:{range}` / `:{range}` | 跳到范围最后一行。 |
| `:!` / `:!` | 过滤文本或执行外部命令。 |
| `:!!` / `:!!` | 重复最近 `:!`。 |
| `:#` / `:#` | 同 `:number`。 |
| `:&` / `:&` | 重复最近 `:substitute`。 |
| `:*` / `:*` | 使用最近 Visual 范围，同 `:'<,'>`。 |
| `:<` / `:<` | 左移行一个 `shiftwidth`。 |
| `:=` / `:=` | 打印末行行号。 |
| `:>` / `:>` | 右移行一个 `shiftwidth`。 |
| `:@` / `:@` | 执行寄存器内容。 |
| `:@@` / `:@@` | 重复前一个 `:@`。 |
| `:2match` / `:2mat` | 定义第二组匹配高亮。 |
| `:3match` / `:3mat` | 定义第三组匹配高亮。 |
| `:Next` / `:N` | 到参数列表前一个文件。 |
| `:append` / `:a` | 追加文本。 |
| `:abbreviate` / `:ab` | 定义或显示缩写。 |
| `:abclear` / `:abc` | 清除全部缩写。 |
| `:aboveleft` / `:abo` | 让拆分出现在左/上。 |
| `:all` / `:al` | 为参数列表每个文件开窗口。 |
| `:amenu` / `:am` | 为所有模式增加菜单项。 |
| `:anoremenu` / `:an` | 增加所有模式不重映射菜单项。 |
| `:args` / `:ar` | 显示参数列表。 |
| `:argadd` / `:arga` | 向参数列表添加项目。 |
| `:argdedupe` / `:argded` | 删除参数列表重复项。 |
| `:argdelete` / `:argd` | 删除参数列表项目。 |
| `:argedit` / `:arge` | 添加并编辑参数项目。 |
| `:argdo` / `:argdo` | 对参数列表每项执行命令。 |
| `:argglobal` / `:argg` | 定义全局参数列表。 |
| `:arglocal` / `:argl` | 定义局部参数列表。 |
| `:argument` / `:argu` | 到参数列表指定文件。 |
| `:ascii` / `:as` | 打印光标下字符值。 |
| `:autocmd` / `:au` | 定义或显示自动命令。 |
| `:augroup` / `:aug` | 选择自动命令组。 |
| `:aunmenu` / `:aun` | 删除所有模式菜单。 |
| `:buffer` / `:b` | 到指定缓冲区。 |
| `:bNext` / `:bN` | 到前一个缓冲区。 |
| `:ball` / `:ba` | 为 buffer list 每个缓冲区开窗口。 |
| `:badd` / `:bad` | 向 buffer list 添加缓冲区。 |
| `:balt` / `:balt` | 类似 `:badd`，并设为 alternate file。 |
| `:bdelete` / `:bd` | 从 buffer list 删除缓冲区。 |
| `:belowright` / `:bel` | 让拆分出现在右/下。 |
| `:bfirst` / `:bf` | 到首个缓冲区。 |
| `:blast` / `:bl` | 到末个缓冲区。 |
| `:bmodified` / `:bm` | 到下一个已修改缓冲区。 |
| `:bnext` / `:bn` | 到下一个缓冲区。 |
| `:botright` / `:bo` | 让拆分出现在底部/最右。 |
| `:bprevious` / `:bp` | 到前一个缓冲区。 |
| `:brewind` / `:br` | 到首个缓冲区。 |
| `:break` / `:brea` | 跳出 `:while` 循环。 |
| `:breakadd` / `:breaka` | 添加调试断点。 |
| `:breakdel` / `:breakd` | 删除调试断点。 |
| `:breaklist` / `:breakl` | 列出调试断点。 |
| `:browse` / `:bro` | 使用文件选择对话框。 |
| `:bufdo` / `:bufd` | 对每个 listed buffer 执行命令。 |
| `:buffers` / `:buffers` | 列出 buffer list 全部文件。 |
| `:bunload` / `:bun` | 卸载指定缓冲区。 |
| `:bwipeout` / `:bw` | 彻底删除缓冲区。 |
| `:change` / `:c` | 替换一行或多行。 |
| `:cNext` / `:cN` | 到前一个错误。 |
| `:cNfile` / `:cNf` | 到前一文件的最后一个错误。 |
| `:cabbrev` / `:ca` | 命令行模式缩写。 |
| `:cabclear` / `:cabc` | 清除命令行模式缩写。 |
| `:cabove` / `:cabo` | 到当前行上方的错误。 |
| `:caddbuffer` / `:cad` | 从缓冲区追加错误。 |
| `:caddexpr` / `:cadde` | 从表达式追加错误。 |
| `:caddfile` / `:caddf` | 从文件追加到 quickfix list。 |
| `:cafter` / `:caf` | 到光标之后的错误。 |
| `:call` / `:cal` | 调用函数。 |
| `:catch` / `:cat` | `:try` 的异常捕获部分。 |
| `:cbefore` / `:cbe` | 到光标之前的错误。 |
| `:cbelow` / `:cbel` | 到当前行下方的错误。 |
| `:cbottom` / `:cbo` | quickfix 窗口滚到底。 |
| `:cbuffer` / `:cb` | 解析缓冲区错误并跳到首项。 |
| `:cc` / `:cc` | 到指定 quickfix 错误。 |
| `:cclose` / `:ccl` | 关闭 quickfix 窗口。 |
| `:cd` / `:cd` | 更改当前目录。 |
| `:cdo` / `:cdo` | 对每个有效 quickfix 条目执行命令。 |
| `:cfdo` / `:cfd` | 对 quickfix 每个文件执行命令。 |
| `:center` / `:ce` | 居中对齐行。 |
| `:cexpr` / `:cex` | 从表达式读错误并跳到首项。 |
| `:cfile` / `:cf` | 从错误文件读取并跳到首项。 |
| `:cfirst` / `:cfir` | 到指定错误，默认首项。 |
| `:cgetbuffer` / `:cgetb` | 从缓冲区取得错误但不跳转。 |
| `:cgetexpr` / `:cgete` | 从表达式取得错误。 |
| `:cgetfile` / `:cg` | 从文件取得错误。 |
| `:changes` / `:changes` | 显示 change list。 |
| `:chdir` / `:chd` | 更改目录。 |
| `:checkhealth` / `:che` | 运行健康检查。 |
| `:checkpath` / `:checkp` | 列出 include 文件。 |
| `:checktime` / `:checkt` | 检查已加载缓冲区时间戳。 |
| `:chistory` / `:chi` | 列出 quickfix 历史。 |
| `:clast` / `:cla` | 到指定错误，默认末项。 |
| `:clearjumps` / `:cle` | 清空 jump list。 |
| `:clist` / `:cl` | 列出全部错误。 |
| `:close` / `:clo` | 关闭当前窗口。 |
| `:cmap` / `:cm` | 命令行模式映射。 |
| `:cmapclear` / `:cmapc` | 清除命令行模式映射。 |
| `:cmenu` / `:cme` | 增加命令行模式菜单。 |
| `:cnext` / `:cn` | 到下一个错误。 |
| `:cnewer` / `:cnew` | 到较新的 quickfix list。 |
| `:cnfile` / `:cnf` | 到下一文件首个错误。 |
| `:cnoremap` / `:cno` | 命令行模式非递归映射。 |
| `:cnoreabbrev` / `:cnorea` | 命令行模式非递归缩写。 |
| `:cnoremenu` / `:cnoreme` | 命令行模式非递归菜单。 |
| `:copy` / `:co` | 复制行。 |
| `:colder` / `:col` | 到较旧 quickfix list。 |
| `:colorscheme` / `:colo` | 加载配色方案。 |
| `:command` / `:com` | 创建用户命令。 |
| `:comclear` / `:comc` | 清除用户命令。 |
| `:compiler` / `:comp` | 应用指定编译器设置。 |
| `:continue` / `:con` | 回到循环条件。 |
| `:confirm` / `:conf` | 需要确认时提示用户。 |
| `:const` / `:cons` | 创建常量变量。 |
| `:copen` / `:cope` | 打开 quickfix 窗口。 |
| `:cprevious` / `:cp` | 到前一个错误。 |
| `:cpfile` / `:cpf` | 到前一文件最后错误。 |
| `:cquit` / `:cq` | 以错误码退出。 |
| `:crewind` / `:cr` | 到指定错误，默认首项。 |
| `:cunmap` / `:cu` | 删除命令行模式映射。 |
| `:cunabbrev` / `:cuna` | 删除命令行模式缩写。 |
| `:cunmenu` / `:cunme` | 删除命令行模式菜单。 |
| `:cwindow` / `:cw` | 按错误存在与否开/关 quickfix 窗口。 |
| `:delete` / `:d` | 删除行。 |
| `:debug` / `:deb` | 在调试模式运行命令。 |
| `:debuggreedy` / `:debugg` | 从普通输入读取调试命令。 |
| `:defer` / `:defe` | 当前函数结束时调用函数。 |
| `:delcommand` / `:delc` | 删除用户命令。 |
| `:delfunction` / `:delf` | 删除用户函数。 |
| `:delmarks` / `:delm` | 删除标记。 |
| `:detach` / `:detach` | 分离当前 UI。 |
| `:diffupdate` / `:dif` | 更新 diff 缓冲区。 |
| `:diffget` / `:diffg` | 把差异取到当前缓冲区。 |
| `:diffoff` / `:diffo` | 关闭 diff 模式。 |
| `:diffpatch` / `:diffp` | 应用补丁并显示差异。 |
| `:diffput` / `:diffpu` | 把差异放到另一缓冲区。 |
| `:diffsplit` / `:diffs` | 拆分并与另一文件比较。 |
| `:diffthis` / `:difft` | 当前窗口启用 diff。 |
| `:digraphs` / `:dig` | 显示或定义二合字。 |
| `:display` / `:di` | 显示寄存器。 |
| `:djump` / `:dj` | 跳到 `#define`。 |
| `:dl` / `:dl` | `:delete` 加 `l` flag 的简写。 |
| `:dlist` / `:dli` | 列出 `#define`。 |
| `:doautocmd` / `:do` | 对当前缓冲区应用自动命令。 |
| `:doautoall` / `:doautoa` | 对全部已加载缓冲区应用自动命令。 |
| `:deletep` / `:dp` | `:delete` 加 `p` flag 的简写。 |
| `:drop` / `:dr` | 跳到已编辑该文件的窗口或在当前窗口编辑。 |
| `:dsearch` / `:ds` | 显示一个 `#define`。 |
| `:dsplit` / `:dsp` | 拆分并跳到 `#define`。 |
| `:edit` / `:e` | 编辑文件。 |
| `:earlier` / `:ea` | 到更早变更状态。 |
| `:echo` / `:ec` | 显示表达式结果。 |
| `:echoerr` / `:echoe` | 以错误样式显示并写入消息历史。 |
| `:echohl` / `:echoh` | 设置后续 echo 高亮。 |
| `:echomsg` / `:echom` | 显示并写入消息历史。 |
| `:echon` / `:echon` | 显示但不加换行。 |
| `:else` / `:el` | `:if` 的 else 分支。 |
| `:elseif` / `:elsei` | `:if` 的 elseif 分支。 |
| `:emenu` / `:em` | 按名称执行菜单。 |
| `:endif` / `:en` | 结束 `:if`。 |
| `:endfor` / `:endfo` | 结束 `:for`。 |
| `:endfunction` / `:endf` | 结束用户函数定义。 |
| `:endtry` / `:endt` | 结束 `:try`。 |
| `:endwhile` / `:endw` | 结束 `:while`。 |
| `:enew` / `:ene` | 编辑新的未命名缓冲区。 |
| `:eval` / `:ev` | 求值并丢弃结果。 |
| `:ex` / `:ex` | 同 `:edit`。 |
| `:execute` / `:exe` | 执行表达式结果组成的命令。 |
| `:exit` / `:exi` | 同 `:xit`。 |
| `:exusage` / `:exu` | 显示 Ex 命令概览。 |
| `:fclose` / `:fc` | 关闭浮动窗口。 |
| `:file` / `:f` | 显示或设置当前文件名。 |
| `:files` / `:files` | 列出 buffer list 全部文件。 |
| `:filetype` / `:filet` | 开关文件类型检测。 |
| `:filter` / `:filt` | 过滤后续命令输出。 |
| `:find` / `:fin` | 在 `path` 中找文件并编辑。 |
| `:finally` / `:fina` | `:try` 的 finally 部分。 |
| `:finish` / `:fini` | 停止 source 当前脚本。 |
| `:first` / `:fir` | 到参数列表首个文件。 |
| `:fold` / `:fo` | 创建折叠。 |
| `:foldclose` / `:foldc` | 关闭折叠。 |
| `:folddoopen` / `:foldd` | 对未在关闭折叠内的行执行命令。 |
| `:folddoclosed` / `:folddoc` | 对关闭折叠内的行执行命令。 |
| `:foldopen` / `:foldo` | 打开折叠。 |
| `:for` / `:for` | `for` 循环。 |
| `:function` / `:fu` | 定义或显示用户函数。 |
| `:global` / `:g` | 对匹配行执行命令。 |
| `:goto` / `:go` | 到缓冲区字节偏移。 |
| `:grep` / `:gr` | 运行 `grepprg` 并跳到首项。 |
| `:grepadd` / `:grepa` | 运行 grep 并追加到当前列表。 |
| `:gui` / `:gu` | 启动 GUI。 |
| `:gvim` / `:gv` | 启动 GUI。 |

### 13.2 H–R

| 完整 / 最短 | 中文用途 |
|---|---|
| `:help` / `:h` | 打开帮助窗口。 |
| `:helpclose` / `:helpc` | 关闭一个帮助窗口。 |
| `:helpgrep` / `:helpg` | 在帮助文件中搜索。 |
| `:helptags` / `:helpt` | 为目录生成帮助标签。 |
| `:highlight` / `:hi` | 指定高亮方式。 |
| `:hide` / `:hid` | 隐藏当前缓冲区后执行命令。 |
| `:history` / `:his` | 打印历史列表。 |
| `:horizontal` / `:hor` | 让后续窗口命令水平拆分。 |
| `:insert` / `:i` | 插入文本行。 |
| `:iabbrev` / `:ia` | Insert 模式缩写。 |
| `:iabclear` / `:iabc` | 清除 Insert 模式缩写。 |
| `:if` / `:if` | 条件为真时执行命令。 |
| `:ijump` / `:ij` | 跳到标识符定义。 |
| `:ilist` / `:il` | 列出标识符匹配行。 |
| `:imap` / `:im` | Insert 模式映射。 |
| `:imapclear` / `:imapc` | 清除 Insert 模式映射。 |
| `:imenu` / `:ime` | 增加 Insert 模式菜单。 |
| `:inoremap` / `:ino` | Insert 模式非递归映射。 |
| `:inoreabbrev` / `:inorea` | Insert 模式非递归缩写。 |
| `:inoremenu` / `:inoreme` | Insert 模式非递归菜单。 |
| `:intro` / `:int` | 显示介绍信息。 |
| `:iput` / `:ip` | 类似 `:put`，按当前行修正缩进。 |
| `:isearch` / `:is` | 显示一条标识符匹配行。 |
| `:isplit` / `:isp` | 拆分并跳到标识符定义。 |
| `:iunmap` / `:iu` | 删除 Insert 模式映射。 |
| `:iunabbrev` / `:iuna` | 删除 Insert 模式缩写。 |
| `:iunmenu` / `:iunme` | 删除 Insert 模式菜单。 |
| `:join` / `:j` | 连接行。 |
| `:jumps` / `:ju` | 打印 jump list。 |
| `:k` / `:k` | 设置标记。 |
| `:keepalt` / `:keepa` | 后续命令保留 alternate file。 |
| `:keepmarks` / `:kee` | 后续命令保持标记位置。 |
| `:keepjumps` / `:keepj` | 后续命令保持 jumplist 和标记。 |
| `:keeppatterns` / `:keepp` | 后续命令不改搜索模式历史。 |
| `:lNext` / `:lN` | 到 location list 前一项。 |
| `:lNfile` / `:lNf` | 到前一文件最后 location。 |
| `:list` / `:l` | 以 list 形式打印行。 |
| `:labove` / `:lab` | 到当前行上方 location。 |
| `:laddexpr` / `:lad` | 从表达式追加 location。 |
| `:laddbuffer` / `:laddb` | 从缓冲区追加 location。 |
| `:laddfile` / `:laddf` | 从文件追加 location。 |
| `:lafter` / `:laf` | 到光标之后 location。 |
| `:last` / `:la` | 到参数列表末个文件。 |
| `:language` / `:lan` | 设置语言/locale。 |
| `:later` / `:lat` | 到较新变更状态。 |
| `:lbefore` / `:lbe` | 到光标之前 location。 |
| `:lbelow` / `:lbel` | 到当前行下方 location。 |
| `:lbottom` / `:lbo` | location 窗口滚到底。 |
| `:lbuffer` / `:lb` | 解析缓冲区 location 并跳首项。 |
| `:lcd` / `:lc` | 更改窗口局部目录。 |
| `:lchdir` / `:lch` | 更改窗口局部目录。 |
| `:lclose` / `:lcl` | 关闭 location 窗口。 |
| `:ldo` / `:ld` | 对有效 location 条目执行命令。 |
| `:lfdo` / `:lfd` | 对 location list 每个文件执行命令。 |
| `:left` / `:le` | 左对齐行。 |
| `:leftabove` / `:lefta` | 让拆分出现在左/上。 |
| `:let` / `:let` | 给变量或选项赋值。 |
| `:lexpr` / `:lex` | 从表达式读 location 并跳首项。 |
| `:lfile` / `:lf` | 从文件读 location 并跳首项。 |
| `:lfirst` / `:lfir` | 到指定 location，默认首项。 |
| `:lgetbuffer` / `:lgetb` | 从缓冲区取得 location。 |
| `:lgetexpr` / `:lgete` | 从表达式取得 location。 |
| `:lgetfile` / `:lg` | 从文件取得 location。 |
| `:lgrep` / `:lgr` | 运行 `grepprg`，结果进 location list。 |
| `:lgrepadd` / `:lgrepa` | grep 并追加 location list。 |
| `:lhelpgrep` / `:lh` | 在帮助中搜索到 location list。 |
| `:lhistory` / `:lhi` | 列出 location list 历史。 |
| `:ll` / `:ll` | 到指定 location。 |
| `:llast` / `:lla` | 到指定 location，默认末项。 |
| `:llist` / `:lli` | 列出全部 location。 |
| `:lmake` / `:lmak` | 运行 `makeprg`，错误进 location list。 |
| `:lmap` / `:lm` | 类似 `:map!`，含 Lang-Arg 模式。 |
| `:lmapclear` / `:lmapc` | 清除 Lang-Arg 相关映射。 |
| `:lnext` / `:lne` | 到下一 location。 |
| `:lnewer` / `:lnew` | 到较新 location list。 |
| `:lnfile` / `:lnf` | 到下一文件首个 location。 |
| `:lnoremap` / `:ln` | Lang-Arg 非递归映射。 |
| `:loadkeymap` / `:loadk` | 加载后续 keymap 到 EOF。 |
| `:loadview` / `:lo` | 从文件加载当前窗口 view。 |
| `:lockmarks` / `:loc` | 后续命令保持标记位置。 |
| `:lockvar` / `:lockv` | 锁定变量。 |
| `:lolder` / `:lol` | 到较旧 location list。 |
| `:lopen` / `:lop` | 打开 location 窗口。 |
| `:lprevious` / `:lp` | 到前一 location。 |
| `:lpfile` / `:lpf` | 到前一文件最后 location。 |
| `:lrewind` / `:lr` | 到指定 location，默认首项。 |
| `:ls` / `:ls` | 列出全部缓冲区。 |
| `:lsp` / `:lsp` | 语言服务器协议命令入口。 |
| `:ltag` / `:lt` | 跳标签并把匹配加入 location list。 |
| `:lunmap` / `:lu` | 删除 Lang-Arg 映射。 |
| `:lua` / `:lua` | 执行 Lua 命令。 |
| `:luado` / `:luad` | 对范围每行执行 Lua。 |
| `:luafile` / `:luaf` | 执行 Lua 脚本文件。 |
| `:lvimgrep` / `:lv` | 在文件中搜索，结果进 location list。 |
| `:lvimgrepadd` / `:lvimgrepa` | 搜索并追加 location list。 |
| `:lwindow` / `:lw` | 按 location 存在与否开/关窗口。 |
| `:move` / `:m` | 移动行。 |
| `:mark` / `:ma` | 设置标记。 |
| `:make` / `:mak` | 运行 `makeprg` 并解析错误。 |
| `:map` / `:map` | 显示或定义映射。 |
| `:mapclear` / `:mapc` | 清除 Normal/Visual 映射。 |
| `:marks` / `:marks` | 列出全部标记。 |
| `:match` / `:mat` | 定义匹配高亮。 |
| `:menu` / `:me` | 增加菜单项。 |
| `:menutranslate` / `:menut` | 增加菜单翻译。 |
| `:messages` / `:mes` | 查看历史消息。 |
| `:mkexrc` / `:mk` | 把映射和设置写入文件。 |
| `:mksession` / `:mks` | 写入会话信息。 |
| `:mkspell` / `:mksp` | 生成 `.spl` 拼写文件。 |
| `:mkvimrc` / `:mkv` | 把映射和设置写入文件。 |
| `:mkview` / `:mkvie` | 写当前窗口 view。 |
| `:mode` / `:mod` | 显示或更改屏幕模式。 |
| `:next` / `:n` | 到参数列表下一文件。 |
| `:new` / `:new` | 创建空窗口。 |
| `:nmap` / `:nm` | Normal 模式映射。 |
| `:nmapclear` / `:nmapc` | 清除 Normal 映射。 |
| `:nmenu` / `:nme` | 增加 Normal 菜单。 |
| `:nnoremap` / `:nn` | Normal 非递归映射。 |
| `:nnoremenu` / `:nnoreme` | Normal 非递归菜单。 |
| `:noautocmd` / `:noa` | 后续命令不触发自动命令。 |
| `:noremap` / `:no` | 定义非递归映射。 |
| `:nohlsearch` / `:noh` | 暂停搜索高亮。 |
| `:noreabbrev` / `:norea` | 定义非递归缩写。 |
| `:noremenu` / `:noreme` | 定义非递归菜单。 |
| `:normal` / `:norm` | 执行 Normal 模式命令。 |
| `:noswapfile` / `:nos` | 后续命令不创建 swap。 |
| `:number` / `:nu` | 带行号打印行。 |
| `:nunmap` / `:nun` | 删除 Normal 映射。 |
| `:nunmenu` / `:nunme` | 删除 Normal 菜单。 |
| `:oldfiles` / `:ol` | 列出 ShaDa 中有标记的文件。 |
| `:omap` / `:om` | Operator-pending 映射。 |
| `:omapclear` / `:omapc` | 清除 Operator-pending 映射。 |
| `:omenu` / `:ome` | 增加 Operator-pending 菜单。 |
| `:only` / `:on` | 关闭当前外所有窗口。 |
| `:onoremap` / `:ono` | Operator-pending 非递归映射。 |
| `:onoremenu` / `:onoreme` | Operator-pending 非递归菜单。 |
| `:options` / `:opt` | 打开选项窗口。 |
| `:ounmap` / `:ou` | 删除 Operator-pending 映射。 |
| `:ounmenu` / `:ounme` | 删除 Operator-pending 菜单。 |
| `:packadd` / `:pa` | 从 `packpath` 加载 package。 |
| `:packloadall` / `:packl` | 加载 `packpath` 下全部 package。 |
| `:pbuffer` / `:pb` | 在预览窗口编辑缓冲区。 |
| `:pclose` / `:pc` | 关闭预览窗口。 |
| `:pedit` / `:ped` | 在预览窗口编辑文件。 |
| `:perl` / `:pe` | 执行 Perl 命令。 |
| `:perldo` / `:perld` | 对每行执行 Perl。 |
| `:perlfile` / `:perlf` | 执行 Perl 脚本。 |
| `:print` / `:p` | 打印行。 |
| `:profdel` / `:profd` | 停止分析函数或脚本。 |
| `:profile` / `:prof` | 性能分析函数和脚本。 |
| `:pop` / `:po` | 标签栈后退。 |
| `:popup` / `:popu` | 按名称弹出菜单。 |
| `:ppop` / `:pp` | 在预览窗口执行 `:pop`。 |
| `:preserve` / `:pre` | 把全部文本写入 swap。 |
| `:previous` / `:prev` | 到参数列表前一文件。 |
| `:psearch` / `:ps` | 类似 `:ijump`，在预览窗口显示。 |
| `:ptag` / `:pt` | 在预览窗口显示标签。 |
| `:ptNext` / `:ptN` | 预览窗口中的 `:tNext`。 |
| `:ptfirst` / `:ptf` | 预览窗口中的 `:trewind`。 |
| `:ptjump` / `:ptj` | `:tjump` 并在预览窗口显示。 |
| `:ptlast` / `:ptl` | 预览窗口中的 `:tlast`。 |
| `:ptnext` / `:ptn` | 预览窗口中的 `:tnext`。 |
| `:ptprevious` / `:ptp` | 预览窗口中的 `:tprevious`。 |
| `:ptrewind` / `:ptr` | 预览窗口中的 `:trewind`。 |
| `:ptselect` / `:pts` | `:tselect` 并在预览窗口显示。 |
| `:put` / `:pu` | 插入寄存器内容。 |
| `:pwd` / `:pw` | 打印当前目录。 |
| `:py3` / `:py3` | 执行 Python 3 命令。 |
| `:python3` / `:python3` | 同 `:py3`。 |
| `:py3do` / `:py3d` | 对每行执行 Python 3。 |
| `:py3file` / `:py3f` | 执行 Python 3 脚本。 |
| `:python` / `:py` | 执行 Python 命令。 |
| `:pydo` / `:pyd` | 对每行执行 Python。 |
| `:pyfile` / `:pyf` | 执行 Python 脚本。 |
| `:pyx` / `:pyx` | 执行当前 Python 版本命令。 |
| `:pythonx` / `:pythonx` | 同 `:pyx`。 |
| `:pyxdo` / `:pyxd` | 对每行执行当前 Python 版本。 |
| `:pyxfile` / `:pyxf` | 执行当前 Python 版本脚本。 |
| `:quit` / `:q` | 退出当前窗口。 |
| `:quitall` / `:quita` | 退出 Neovim。 |
| `:qall` / `:qa` | 退出 Neovim。 |
| `:read` / `:r` | 把文件/命令输出读入文本。 |
| `:recover` / `:rec` | 从 swap 恢复文件。 |
| `:redo` / `:red` | 重做一次撤销。 |
| `:redir` / `:redi` | 重定向消息到文件/寄存器/变量。 |
| `:redraw` / `:redr` | 强制重绘。 |
| `:redrawstatus` / `:redraws` | 强制重绘状态行和窗口栏。 |
| `:redrawtabline` / `:redrawt` | 强制重绘标签栏。 |
| `:registers` / `:reg` | 显示寄存器内容。 |
| `:resize` / `:res` | 改当前窗口高度。 |
| `:restart` / `:restart` | 重启 Nvim server。 |
| `:retab` / `:ret` | 更改 tab 宽度并调整空白。 |
| `:return` / `:retu` | 从用户函数返回。 |
| `:rewind` / `:rew` | 到参数列表首个文件。 |
| `:right` / `:ri` | 右对齐文本。 |
| `:rightbelow` / `:rightb` | 让拆分出现在右/下。 |
| `:rshada` / `:rsh` | 读取 ShaDa 文件。 |
| `:ruby` / `:rub` | 执行 Ruby 命令。 |
| `:rubydo` / `:rubyd` | 对每行执行 Ruby。 |
| `:rubyfile` / `:rubyf` | 执行 Ruby 脚本。 |
| `:rundo` / `:rund` | 从文件读取 undo 信息。 |
| `:runtime` / `:ru` | source `runtimepath` 中脚本。 |

### 13.3 S–Z

| 完整 / 最短 | 中文用途 |
|---|---|
| `:substitute` / `:s` | 查找并替换文本。 |
| `:sNext` / `:sN` | 拆分并到参数列表前一文件。 |
| `:sandbox` / `:san` | 在 sandbox 中执行命令。 |
| `:sargument` / `:sa` | 拆分并到指定参数文件。 |
| `:sall` / `:sal` | 为参数列表每个文件开窗口。 |
| `:saveas` / `:sav` | 另存为。 |
| `:sbuffer` / `:sb` | 拆分并到指定缓冲区。 |
| `:sbNext` / `:sbN` | 拆分并到前一缓冲区。 |
| `:sball` / `:sba` | 为 buffer list 每项开窗口。 |
| `:sbfirst` / `:sbf` | 拆分并到首个缓冲区。 |
| `:sblast` / `:sbl` | 拆分并到末个缓冲区。 |
| `:sbmodified` / `:sbm` | 拆分并到已修改缓冲区。 |
| `:sbnext` / `:sbn` | 拆分并到下一缓冲区。 |
| `:sbprevious` / `:sbp` | 拆分并到前一缓冲区。 |
| `:sbrewind` / `:sbr` | 拆分并到首个缓冲区。 |
| `:scriptnames` / `:scr` | 列出已 source 脚本名。 |
| `:scriptencoding` / `:scripte` | 指定脚本编码。 |
| `:set` / `:se` | 显示或设置选项。 |
| `:setfiletype` / `:setf` | 尚未设置时设置 `filetype`。 |
| `:setglobal` / `:setg` | 显示/设置选项全局值。 |
| `:setlocal` / `:setl` | 显示/设置选项局部值。 |
| `:sfind` / `:sf` | 拆分并在 `path` 中找文件编辑。 |
| `:sfirst` / `:sfir` | 拆分并到参数列表首个文件。 |
| `:sign` / `:sig` | 操作 signs。 |
| `:silent` / `:sil` | 静默运行命令。 |
| `:sleep` / `:sl` | 暂停数秒。 |
| `:sleep!` / `:sl!` | 暂停且隐藏光标。 |
| `:slast` / `:sla` | 拆分并到参数列表末个文件。 |
| `:smagic` / `:sm` | 以 magic 模式执行替换。 |
| `:smap` / `:smap` | Select 模式映射。 |
| `:smapclear` / `:smapc` | 清除 Select 模式映射。 |
| `:smenu` / `:sme` | 增加 Select 模式菜单。 |
| `:snext` / `:sn` | 拆分并到参数列表下一文件。 |
| `:snomagic` / `:sno` | 以 nomagic 模式执行替换。 |
| `:snoremap` / `:snor` | Select 非递归映射。 |
| `:snoremenu` / `:snoreme` | Select 非递归菜单。 |
| `:sort` / `:sor` | 排序行。 |
| `:source` / `:so` | 从文件读取 Vim/Ex 命令。 |
| `:spelldump` / `:spelld` | 拆分并列出全部正确拼写词。 |
| `:spellgood` / `:spe` | 添加正确拼写词。 |
| `:spellinfo` / `:spelli` | 显示已加载拼写文件信息。 |
| `:spellrare` / `:spellra` | 添加罕见词。 |
| `:spellrepall` / `:spellr` | 像最近 `z=` 一样替换全部坏词。 |
| `:spellundo` / `:spellu` | 删除正确/错误词标记。 |
| `:spellwrong` / `:spellw` | 添加错误拼写词。 |
| `:split` / `:sp` | 拆分当前窗口。 |
| `:sprevious` / `:spr` | 拆分并到参数列表前一文件。 |
| `:srewind` / `:sre` | 拆分并到参数列表首个文件。 |
| `:stop` / `:st` | 挂起编辑器或进入 shell。 |
| `:stag` / `:sta` | 拆分并跳到标签。 |
| `:startinsert` / `:star` | 开始 Insert。 |
| `:startgreplace` / `:startg` | 开始 Virtual Replace。 |
| `:startreplace` / `:startr` | 开始 Replace。 |
| `:stopinsert` / `:stopi` | 停止 Insert。 |
| `:stjump` / `:stj` | 拆分后执行 `:tjump`。 |
| `:stselect` / `:sts` | 拆分后执行 `:tselect`。 |
| `:sunhide` / `:sun` | 同 `:unhide`。 |
| `:sunmap` / `:sunm` | 删除 Select 映射。 |
| `:sunmenu` / `:sunme` | 删除 Select 菜单。 |
| `:suspend` / `:sus` | 同 `:stop`。 |
| `:sview` / `:sv` | 拆分并只读编辑文件。 |
| `:swapname` / `:sw` | 显示当前 swap 文件名。 |
| `:syntax` / `:sy` | 管理语法高亮。 |
| `:syntime` / `:synti` | 测量语法高亮速度。 |
| `:syncbind` / `:sync` | 同步 scroll binding。 |
| `:t` / `:t` | 同 `:copy`。 |
| `:tNext` / `:tN` | 到前一个匹配标签。 |
| `:tabNext` / `:tabN` | 到前一标签页。 |
| `:tabclose` / `:tabc` | 关闭当前标签页。 |
| `:tabdo` / `:tabd` | 对每个标签页执行命令。 |
| `:tabedit` / `:tabe` | 在新标签页编辑文件。 |
| `:tabfind` / `:tabf` | 在 `path` 找文件并于新标签页编辑。 |
| `:tabfirst` / `:tabfir` | 到首个标签页。 |
| `:tablast` / `:tabl` | 到末个标签页。 |
| `:tabmove` / `:tabm` | 移动标签页位置。 |
| `:tabnew` / `:tabnew` | 在新标签页编辑文件。 |
| `:tabnext` / `:tabn` | 到下一标签页。 |
| `:tabonly` / `:tabo` | 关闭当前外所有标签页。 |
| `:tabprevious` / `:tabp` | 到前一标签页。 |
| `:tabrewind` / `:tabr` | 到首个标签页。 |
| `:tabs` / `:tabs` | 列出标签页及其窗口。 |
| `:tab` / `:tab` | 后续开窗口命令在新标签页执行。 |
| `:tag` / `:ta` | 跳到标签。 |
| `:tags` / `:tags` | 显示 tag stack。 |
| `:tcd` / `:tc` | 更改标签页局部目录。 |
| `:tchdir` / `:tch` | 更改标签页局部目录。 |
| `:terminal` / `:te` | 打开终端缓冲区。 |
| `:tfirst` / `:tf` | 到首个匹配标签。 |
| `:throw` / `:th` | 抛出异常。 |
| `:tjump` / `:tj` | 单一标签直接跳，多项时选择。 |
| `:tlast` / `:tl` | 到末个匹配标签。 |
| `:tlmenu` / `:tlm` | 增加 Terminal 模式菜单。 |
| `:tlnoremenu` / `:tln` | Terminal 非递归菜单。 |
| `:tlunmenu` / `:tlu` | 删除 Terminal 模式菜单。 |
| `:tmapclear` / `:tmapc` | 清除 Terminal 映射。 |
| `:tmap` / `:tma` | Terminal 模式映射。 |
| `:tmenu` / `:tm` | 定义菜单 tooltip。 |
| `:tnext` / `:tn` | 到下一匹配标签。 |
| `:tnoremap` / `:tno` | Terminal 非递归映射。 |
| `:topleft` / `:to` | 让拆分出现在顶部/最左。 |
| `:tprevious` / `:tp` | 到前一匹配标签。 |
| `:trewind` / `:tr` | 到首个匹配标签。 |
| `:trust` / `:trust` | 在 trust database 增删文件。 |
| `:try` / `:try` | 执行命令，错误/异常时中止。 |
| `:tselect` / `:ts` | 列出匹配标签并选择。 |
| `:tunmap` / `:tunma` | 删除 Terminal 映射。 |
| `:tunmenu` / `:tu` | 删除菜单 tooltip。 |
| `:undo` / `:u` | 撤销最近变更。 |
| `:undojoin` / `:undoj` | 把下一变更并入上一 undo block。 |
| `:undolist` / `:undol` | 列出 undo tree 叶节点。 |
| `:unabbreviate` / `:una` | 删除缩写。 |
| `:unhide` / `:unh` | 为每个已加载缓冲区开窗口。 |
| `:uniq` / `:uni` | 去除相邻重复行。 |
| `:unlet` / `:unl` | 删除变量。 |
| `:unlockvar` / `:unlo` | 解锁变量。 |
| `:unmap` / `:unm` | 删除映射。 |
| `:unmenu` / `:unme` | 删除菜单。 |
| `:unsilent` / `:uns` | 非静默运行命令。 |
| `:update` / `:up` | 缓冲区有改动时写入。 |
| `:vglobal` / `:v` | 对不匹配行执行命令。 |
| `:version` / `:ve` | 显示版本等信息。 |
| `:verbose` / `:verb` | 临时设置 verbose 执行命令。 |
| `:vertical` / `:vert` | 让后续命令垂直拆分。 |
| `:vimgrep` / `:vim` | 在文件中搜索到 quickfix list。 |
| `:vimgrepadd` / `:vimgrepa` | 搜索并追加 quickfix list。 |
| `:visual` / `:vi` | 同 `:edit`，并退出 Ex 模式。 |
| `:viusage` / `:viu` | 显示 Normal 命令概览。 |
| `:view` / `:vie` | 只读编辑文件。 |
| `:vmap` / `:vm` | Visual+Select 映射。 |
| `:vmapclear` / `:vmapc` | 清除 Visual+Select 映射。 |
| `:vmenu` / `:vme` | 增加 Visual+Select 菜单。 |
| `:vnew` / `:vne` | 垂直拆分并创建空窗口。 |
| `:vnoremap` / `:vn` | Visual+Select 非递归映射。 |
| `:vnoremenu` / `:vnoreme` | Visual+Select 非递归菜单。 |
| `:vsplit` / `:vs` | 垂直拆分当前窗口。 |
| `:vunmap` / `:vu` | 删除 Visual+Select 映射。 |
| `:vunmenu` / `:vunme` | 删除 Visual+Select 菜单。 |
| `:windo` / `:wind` | 对每个窗口执行命令。 |
| `:write` / `:w` | 写入文件。 |
| `:wNext` / `:wN` | 写入并到参数列表前一文件。 |
| `:wall` / `:wa` | 写入全部已修改缓冲区。 |
| `:while` / `:wh` | 条件为真时循环。 |
| `:winsize` / `:wi` | 取得/设置窗口大小（已过时）。 |
| `:wincmd` / `:winc` | 执行一个 `CTRL-W` 窗口命令。 |
| `:winpos` / `:winp` | 取得/设置窗口位置。 |
| `:wnext` / `:wn` | 写入并到参数列表下一文件。 |
| `:wprevious` / `:wp` | 写入并到参数列表前一文件。 |
| `:wq` / `:wq` | 写入并退出窗口/Neovim。 |
| `:wqall` / `:wqa` | 写入全部改动并退出。 |
| `:wshada` / `:wsh` | 写入 ShaDa 文件。 |
| `:wundo` / `:wu` | 把 undo 信息写入文件。 |
| `:xit` / `:x` | 有改动才写入并关闭窗口。 |
| `:xall` / `:xa` | 同 `:wqall`。 |
| `:xmapclear` / `:xmapc` | 清除 Visual 模式映射。 |
| `:xmap` / `:xm` | Visual 模式映射。 |
| `:xmenu` / `:xme` | 增加 Visual 模式菜单。 |
| `:xnoremap` / `:xn` | Visual 非递归映射。 |
| `:xnoremenu` / `:xnoreme` | Visual 非递归菜单。 |
| `:xunmap` / `:xu` | 删除 Visual 模式映射。 |
| `:xunmenu` / `:xunme` | 删除 Visual 模式菜单。 |
| `:yank` / `:y` | 把行复制到寄存器。 |
| `:z` / `:z` | 打印若干行。 |
| `:~` / `:~` | 重复最近 `:substitute`。 |

---

**来源与边界**：正文按本机 `index.txt` 的模式索引及 Ex 命令索引整理，`quickref.txt` 用于范围、替换、窗口和常用组合的补充说明。本文没有复制选项列表、函数列表或 API 列表，也没有读取工程内配置来推断任何映射。
