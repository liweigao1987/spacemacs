import json
import os

PROJECT_ROOT = "/home/liweigao/big/work/project/air04"  # 替换为你的项目根
COMPILE_CMD = "arm-elf-gcc -c {file} -I./include -std=c11"  # 替换为你的编译命令

def gen_compile_commands():
    entries = []
    # 遍历所有 .c/.h 文件，忽略以点号开头的目录
    for root, _, files in os.walk(PROJECT_ROOT):
        # 拆分当前路径的目录层级，检查是否有以点号开头的目录
        # 方式1：检查当前遍历到的根目录中是否包含以.开头的子目录
        # 提取当前路径相对于项目根的部分，拆分目录名逐一判断
        rel_root = os.path.relpath(root, PROJECT_ROOT)
        # 处理根目录本身（rel_root为.的情况）
        if rel_root == ".":
            dir_parts = []
        else:
            dir_parts = rel_root.split(os.sep)
        
        # 检查是否有目录名以.开头，若有则跳过该目录
        has_hidden_dir = any(part.startswith(".") for part in dir_parts)
        if has_hidden_dir:
            continue
        
        # 处理当前目录下的.c/.h文件
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
