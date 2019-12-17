# exe1

## 代码

> `alloc_proc` 函数（位于 `kern/process/proc.c` 中）负责分配并返回一个新的 `struct proc_struct` 结构，用于存储新建立的内核线程的管理信息。ucore 需要对这个结构进行最基本的初始化，你需要完成这个初始化过程。

## 问题

> 请说明 `proc_struct` 中 `struct context context` 和 `struct trapframe *tf` 成员变量含义和在 本实验中的作用是啥？（提示通过看代码和编程调试可以判断出来）

