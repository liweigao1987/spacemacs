#shortcut for spacemacs

| emacs按键                             | 描述                                                                                                                   |
|:--------------------------------------|:-----------------------------------------------------------------------------------------------------------------------|
| leader t E e                          | 在holy和evil模式之间切换                                                                                               |
| C-\                                   | 切换输入法                                                                                                             |
| C-insert                              | 拷贝                                                                                                                   |
| S-insert                              | 粘贴                                                                                                                   |
| M-w ?                                 | easy-kill帮助                                                                                                          |
| C-x d                                 | 进入dired模式,可创建目录等操作                                                                                         |
| C-c C-w f                             | treemacs window, set default workspace                                                                                 |
| leader i k                            | 下方插入空行                                                                                                           |
| leader i j                            | 上方插入空行                                                                                                           |
| M-x M-n                               | 下一个输入命令记录                                                                                                     |
| M-x M-p                               | 上一个输入命令记录                                                                                                     |
| C-;                                   | 打开黏贴板                                                                                                             |
| leader F ...                          | frame操作                                                                                                              |
| M-.                                   | 查找定义                                                                                                               |
| M-?                                   | 查找引用                                                                                                               |
| M-y                                   | 列出kill-ring内容, n/p 切换条目                                                                                        |
| C-x z                                 | 重复前一条命令，之后可以只按z，不断重复                                                                                |
| leader s e                            | 进入、退出iedit-mode                                                                                                   |
| leader n r                            | 只显示当前函数，方便只在这一个函数上的操作或修改                                                                       |
| 输入框action                          | 执行命令弹出echo回显区的输入框后，如果右下提示C-c或者C-z说明可以执行action                                             |
| leader '                              | 弹出命令行界面                                                                                                         |
| M-s h .                               | 高亮光标所在位置的符号（不同颜色）                                                                                     |
| C-c C-l                               | 在snippet模式加载yasnippet模板                                                                                         |
| leader s o                            | overlay方式高亮显示当前符号                                                                                            |
| M-x list-faces-display                | customize face                                                                                                         |
| M-x list-colors-display               | scan colors                                                                                                            |
| M-x add-file-local-variable-prop-line | 在当前buffer中增加一个文件属性变量，例如：关闭当前文件的自动保存功能 variable: buffer-auto-save-file-name   value: nil |
| shift-enter                           | open file in other window                                                                                              |
| C-x ( commands C-x ) C-x e            | repeat commands                                                                                                        |

| mark-ring   | 描述                                                                       |
|:------------|:---------------------------------------------------------------------------|
| leader r m  | 显示所有的mark ring条目（global和buffer）                                  |
| C-spc       | 设置mark并激活，意味着移动光标会高亮选择区域，进入global和buffer rings     |
| C-spc C-spc | 设置mark不激活，意味着不高亮选择区域，压入global和buffer rings，形成回溯栈 |
| C-x C-x     | 在激活的mark也就是高亮区域的头尾跳转                                       |
| C-u C-spc   | 在buffer内的ring里面循环回溯                                               |
| C-x C-spc   | 在global内的ring里面循环回溯，每个文件只保留一个最后设置的mark供回溯       |
| C-@         | 设置mark标记，可以%跳转或者移动光标多选                                    |
| M-@         | 增量标记单词                                                               |
|             |                                                                      |

| register         | 描述                                     |
| :---             | :---                                     |
| leader r r       | 显示所有的寄存器条目                     |
| C-x r spc 单字符 | 把当前位置压入《单字符》指定的寄存器     |
| C-x r j 单字符   | 跳转到《单字符》指定的寄存器的位置       |
| C-x r s 单字符   | 把mark的文本拷贝到《单字符》指定的寄存器 |
| C-x r i 单字符   | 把《单字符》寄存器的内容复制到光标位置   |
| C-x r + mark     | 把mark的文本追加的文本寄存器里面         |
|                  |                            |

| bookmark       | 描述 |
| :---           | :--- |
| C-x r m 字符串 | 设置bookmark,bookmark是持久化存储的     |

| kill-ring | 描述                                                                                    |
| :---      | :---                                                                                    |
| C-u 0 C-k | 删除该行光标前的部分                                                                    |
| C-k       | 删除该行光标后的部分                                                                    |
| C-d       | 删除字符，不进入ring. delete的一般是小范围的，不进入ring;kill的一般是大范围的，进入ring |
|           |                                                          |

| dired模式 | 描述                   |
| （        | 仅显示文件名列表       |
| 0w        | 拷贝指定文件的绝对路径 |
|           |                        |

| treemacs                 | 描述                          |
|:-------------------------|:------------------------------|
| ?/advanced-helpful-hydra | 按键提示                      |
| P                        | peek,只看不切光标             |
| o h/o l/o a a            | 在其他窗口打开文件            |
| M-N/M-P                  | 配合peek,移动peek打开的buffer |
|                          |                               |

| evil按键                   | 描述                                    |
|:---------------------------|:----------------------------------------|
| C-[                        | evil退出编辑模式                        |
| spc w M window左上角的字母 | 切换窗口                                |
| .点号                      | evil mode重复执行前一次命令             |
| spc b . m-x                | 交换buffer内容                          |
| m-a                        | 光标到行首                              |
| m-e                        | 光标到行尾                              |
| m-w                        | 复制到kill-ring-buffer                  |
| m-m k p                    | 粘贴                                    |
| m-backspace                | 向前删除                                |
| tab                        | markdown模式自动对齐                    |
| {                          | 上移到函数头部                          |
| }                          | 下移到函数尾部                          |
| m 字母                     | 设置对应字母名的标记                    |
| ·（反引号） 字母           | 跳到字母标记的位置                      |
| ··                         | 跳到上次标记位置                        |
| ‘（单引号）字母           | 跳到字母标记的行首                      |
| C-o                        | 返回到上一次光标位置                    |
| C-l / z z                  | 当前行在可视窗口上中下位置显示          |

| git                      | 描述                          |
|:-------------------------|:------------------------------|
| magit-ediff-resolve-rest | 解决文件冲突                  |
| magit-status-mode        | git模式,支持多种git命令快捷键 |
| magit-reset-worktree     | 还原工程当前修改到head index  |
| magit-branch-checkout    | 切分支                        |

| minibuffer(helm界面最下方输入条，即M-x触发的窗口) | 描述                                     |
|:--------------------------------------------------|:-----------------------------------------|
| C-h m                                             | 显示minibuffer的介绍                     |
| C-j                                               | 显示当前命令的介绍（可以用来复制命令用） |
| C-o                                               | 切换不同的源组（分组）                                         |

| lsp          | 描述                                             |
|:-------------|:-------------------------------------------------|
| leader m r r | 基于语义重命名（变量或函数名），只修改语义范围的 |
| leader m g g | 跳转到符号定义                                   |
| leader m g r | 搜索该符号的引用                                 |
|              |                                                  |

| 搜索          | 描述                                                                              |
|:--------------|:----------------------------------------------------------------------------------|
| leader s d/D  | 在文件所在目录搜索符号                                                            |
| leader s P F3 | 把搜索结果保存到buffer里面，可以C-o逐个打开，类似occur,该action适用于所有搜索结果 |
| leader s f    | 在指定文件中搜索                                                                  |
| leader s s    | 在当前文件中搜索                                                                  |
| M-s o ...     | 打开occur搜索列表，ｏ, C-o                                                        |
| 批量编辑      | 搜索->C-c C-e->leader s e->C-c C-c                                                |
| 转义字符      | \b该位置为空，例如\bcl\b匹配单词cl                                                |
|           |                                                                       |
    
| 补全  | 描述                  |
|:------|:----------------------|
| M-/   | 触发自动补全          |
| C-M-i | 自动补全/自动修正拼写 |
| C-M-/ | 自动扩展拼写字符串    |

| 删除          | 描述                                     |
|:--------------|:-----------------------------------------|
| C-S-backspace | 删除整行                                 |
| leader k d x  | 删除当前光标所在表达式，括号范围         |
| leader k D x  | 删除光标前一个位置所在的表达式，括号范围 |
| leader k w    | 在当前位置的表达式增加括号               |
| leader k W    | 在当前位置的表达式删除括号               |
| M-d           | 向后删除单词                             |

| 选中  | 描述             |
|:------|:-----------------|
| C-x h | 全选             |
| C-M-h | 选中整个函数代码 |
| M-h   | 选中段           |

| 移动         | 描述                                 |
|:-------------|:-------------------------------------|
| M-<          | 跳到顶部                             |
| M->          | 跳到底部                             |
| M-{          | 跳到段顶部                           |
| M-}          | 跳到段底部                           |
| C-M-f        | 向前跳转一个语法单位，可类推其他移动 |
| leader x K/J | 上/下移动行                          |
| leader N k/j | 上/下滚动视图行                      |
| C-M-a        | 跳到函数开头                         |
| C-M-e        | 跳到函数结尾                         |
| leader j c   | 跳转到最近改动的位置                 |

| 复制         | 描述                     |
|:-------------|:-------------------------|
| leader f y y | 拷贝当前目录绝对路径     |
| leader f y n | 拷贝当前buffer的文件名   |
| leader f y D | 拷贝相对工程根目录的路径 |

| 注释            | 描述                                               |
|:----------------|:---------------------------------------------------|
| leader ; 数字 ; | 注释/反注释行，行数由数字决定，;;注释/反注释当前行 |

| layout       | 描述                           |
|:-------------|:-------------------------------|
| leader l 1-9 | 切换layout，支持多项目并行操作 |
| leader l d   | 删除layout                     |
|              |                              |

| 开关         | 描述               |
|:-------------|:-------------------|
| leader t TAB | 打开缩进列对齐符号 |

| org                   | 描述            |
|:----------------------|:----------------|
| org-agenda            | 搜索现有org文档 |
| org-capture           | 记录org文档     |
| M-x org-decrypt-entry | 解密当前org条目 |

