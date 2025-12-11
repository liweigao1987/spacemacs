import json
import os

PROJECT_ROOT = "/home/liweigao/big/work/project/yunzhi_04_air"  # 替换为你的项目根
COMPILE_CMD = "arm-elf-gcc -c {file} -I./include -std=c11"  # 替换为你的编译命令

def gen_compile_commands():
    entries = []
    # 遍历所有 .c/.h 文件
    for root, _, files in os.walk(PROJECT_ROOT):
        for file in files:
            if file.endswith((".c", ".h")):
                file_path = os.path.join(root, file)
                # 相对路径（可选，也可用绝对路径）
                rel_path = os.path.relpath(file_path, PROJECT_ROOT)
                entries.append({
                    "directory": PROJECT_ROOT,
                    "command": COMPILE_CMD.format(file=rel_path),
                    "file": rel_path
                })
    # 写入 compile_commands.json
    with open(os.path.join(PROJECT_ROOT, "compile_commands.json"), "w") as f:
        json.dump(entries, f, indent=2)

if __name__ == "__main__":
    gen_compile_commands()

