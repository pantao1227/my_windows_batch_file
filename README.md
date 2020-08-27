# my_windows_batch_file

这些批处理脚本可以添加到 PATH，

**注意** 所有文件的编码都是 UTF-8，Windows 10 可以将默认代码页改为 UTF-8。命令行临时修改可以执行：

```cmd
chcp 65001
```

| Batch/Command | Description |
| :-----------: | ----------- |
| ls.cmd    | 将目录和文件用不同颜色列举出来 |
| echox.cmd | 把输入字符串中的 `\e` 替换为 ANSI 控制字符 0x1B |
| cdx.cmd   | 识别 `~` 字符，输入 `cd ~` 等价于 `cd %USERPROFILE%` |
