# exe1

### make

make命令执行需要一个makefile文件，以告诉make命令需要如何去编译和链接程序。

- 如果工程没有被编译过，所有的c文件都要编译并被链接。
- 如果某几个c文件被修改，那么只编译被修改的c文件，并链接目标程序。
- 如果工程的头文件被修改了，那么需要编译引用了这几个头文件的c文件，并链接目标程序

```
target... : prerequisites...
    command
    ...
    ...
```

target也就是一个目标文件，可以是object file,也可以是执行文件。还可以是一个label。prerequisites就是要生成target所需要的文件或是目标。command就是make需要执行的命令。target这一个或多个的目标文件依赖于prerequisites中的文件，其生成规则定义在command中。如果prerequisites中有一个以上的文件比target文件要新，那么command所定义的命令就会被执行。

### ucore.img

