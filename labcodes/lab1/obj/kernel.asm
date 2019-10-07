
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 cb 29 00 00       	call   1029f7 <memset>

    cons_init();                // init the console
  10002c:	e8 8c 14 00 00       	call   1014bd <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 00 32 10 00 	movl   $0x103200,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 1c 32 10 00 	movl   $0x10321c,(%esp)
  100046:	e8 11 02 00 00       	call   10025c <cprintf>

    print_kerninfo();
  10004b:	e8 b2 08 00 00       	call   100902 <print_kerninfo>

    grade_backtrace();
  100050:	e8 89 00 00 00       	call   1000de <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 72 26 00 00       	call   1026cc <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 9d 15 00 00       	call   1015fc <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 fd 16 00 00       	call   101761 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 35 0c 00 00       	call   100c9e <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 c8 16 00 00       	call   101736 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 fa 0b 00 00       	call   100c8c <mon_backtrace>
}
  100092:	90                   	nop
  100093:	c9                   	leave  
  100094:	c3                   	ret    

00100095 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100095:	55                   	push   %ebp
  100096:	89 e5                	mov    %esp,%ebp
  100098:	53                   	push   %ebx
  100099:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009c:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10009f:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a2:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000ac:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b4:	89 04 24             	mov    %eax,(%esp)
  1000b7:	e8 b4 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bc:	90                   	nop
  1000bd:	83 c4 14             	add    $0x14,%esp
  1000c0:	5b                   	pop    %ebx
  1000c1:	5d                   	pop    %ebp
  1000c2:	c3                   	ret    

001000c3 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c3:	55                   	push   %ebp
  1000c4:	89 e5                	mov    %esp,%ebp
  1000c6:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c9:	8b 45 10             	mov    0x10(%ebp),%eax
  1000cc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d3:	89 04 24             	mov    %eax,(%esp)
  1000d6:	e8 ba ff ff ff       	call   100095 <grade_backtrace1>
}
  1000db:	90                   	nop
  1000dc:	c9                   	leave  
  1000dd:	c3                   	ret    

001000de <grade_backtrace>:

void
grade_backtrace(void) {
  1000de:	55                   	push   %ebp
  1000df:	89 e5                	mov    %esp,%ebp
  1000e1:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e4:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e9:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f0:	ff 
  1000f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000fc:	e8 c2 ff ff ff       	call   1000c3 <grade_backtrace0>
}
  100101:	90                   	nop
  100102:	c9                   	leave  
  100103:	c3                   	ret    

00100104 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100104:	55                   	push   %ebp
  100105:	89 e5                	mov    %esp,%ebp
  100107:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010a:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  10010d:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100110:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100113:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100116:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011a:	83 e0 03             	and    $0x3,%eax
  10011d:	89 c2                	mov    %eax,%edx
  10011f:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100124:	89 54 24 08          	mov    %edx,0x8(%esp)
  100128:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012c:	c7 04 24 21 32 10 00 	movl   $0x103221,(%esp)
  100133:	e8 24 01 00 00       	call   10025c <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100138:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013c:	89 c2                	mov    %eax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 2f 32 10 00 	movl   $0x10322f,(%esp)
  100152:	e8 05 01 00 00       	call   10025c <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	89 c2                	mov    %eax,%edx
  10015d:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100162:	89 54 24 08          	mov    %edx,0x8(%esp)
  100166:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016a:	c7 04 24 3d 32 10 00 	movl   $0x10323d,(%esp)
  100171:	e8 e6 00 00 00       	call   10025c <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100176:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017a:	89 c2                	mov    %eax,%edx
  10017c:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100181:	89 54 24 08          	mov    %edx,0x8(%esp)
  100185:	89 44 24 04          	mov    %eax,0x4(%esp)
  100189:	c7 04 24 4b 32 10 00 	movl   $0x10324b,(%esp)
  100190:	e8 c7 00 00 00       	call   10025c <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100195:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100199:	89 c2                	mov    %eax,%edx
  10019b:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a0:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001a8:	c7 04 24 59 32 10 00 	movl   $0x103259,(%esp)
  1001af:	e8 a8 00 00 00       	call   10025c <cprintf>
    round ++;
  1001b4:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001b9:	40                   	inc    %eax
  1001ba:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001bf:	90                   	nop
  1001c0:	c9                   	leave  
  1001c1:	c3                   	ret    

001001c2 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c2:	55                   	push   %ebp
  1001c3:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c5:	90                   	nop
  1001c6:	5d                   	pop    %ebp
  1001c7:	c3                   	ret    

001001c8 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001c8:	55                   	push   %ebp
  1001c9:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001cb:	90                   	nop
  1001cc:	5d                   	pop    %ebp
  1001cd:	c3                   	ret    

001001ce <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ce:	55                   	push   %ebp
  1001cf:	89 e5                	mov    %esp,%ebp
  1001d1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d4:	e8 2b ff ff ff       	call   100104 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001d9:	c7 04 24 68 32 10 00 	movl   $0x103268,(%esp)
  1001e0:	e8 77 00 00 00       	call   10025c <cprintf>
    lab1_switch_to_user();
  1001e5:	e8 d8 ff ff ff       	call   1001c2 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ea:	e8 15 ff ff ff       	call   100104 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001ef:	c7 04 24 88 32 10 00 	movl   $0x103288,(%esp)
  1001f6:	e8 61 00 00 00       	call   10025c <cprintf>
    lab1_switch_to_kernel();
  1001fb:	e8 c8 ff ff ff       	call   1001c8 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100200:	e8 ff fe ff ff       	call   100104 <lab1_print_cur_status>
}
  100205:	90                   	nop
  100206:	c9                   	leave  
  100207:	c3                   	ret    

00100208 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100208:	55                   	push   %ebp
  100209:	89 e5                	mov    %esp,%ebp
  10020b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10020e:	8b 45 08             	mov    0x8(%ebp),%eax
  100211:	89 04 24             	mov    %eax,(%esp)
  100214:	e8 d1 12 00 00       	call   1014ea <cons_putc>
    (*cnt) ++;
  100219:	8b 45 0c             	mov    0xc(%ebp),%eax
  10021c:	8b 00                	mov    (%eax),%eax
  10021e:	8d 50 01             	lea    0x1(%eax),%edx
  100221:	8b 45 0c             	mov    0xc(%ebp),%eax
  100224:	89 10                	mov    %edx,(%eax)
}
  100226:	90                   	nop
  100227:	c9                   	leave  
  100228:	c3                   	ret    

00100229 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100229:	55                   	push   %ebp
  10022a:	89 e5                	mov    %esp,%ebp
  10022c:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10022f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100236:	8b 45 0c             	mov    0xc(%ebp),%eax
  100239:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10023d:	8b 45 08             	mov    0x8(%ebp),%eax
  100240:	89 44 24 08          	mov    %eax,0x8(%esp)
  100244:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100247:	89 44 24 04          	mov    %eax,0x4(%esp)
  10024b:	c7 04 24 08 02 10 00 	movl   $0x100208,(%esp)
  100252:	e8 f3 2a 00 00       	call   102d4a <vprintfmt>
    return cnt;
  100257:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10025a:	c9                   	leave  
  10025b:	c3                   	ret    

0010025c <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10025c:	55                   	push   %ebp
  10025d:	89 e5                	mov    %esp,%ebp
  10025f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100262:	8d 45 0c             	lea    0xc(%ebp),%eax
  100265:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100268:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10026b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10026f:	8b 45 08             	mov    0x8(%ebp),%eax
  100272:	89 04 24             	mov    %eax,(%esp)
  100275:	e8 af ff ff ff       	call   100229 <vcprintf>
  10027a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10027d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100280:	c9                   	leave  
  100281:	c3                   	ret    

00100282 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100282:	55                   	push   %ebp
  100283:	89 e5                	mov    %esp,%ebp
  100285:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100288:	8b 45 08             	mov    0x8(%ebp),%eax
  10028b:	89 04 24             	mov    %eax,(%esp)
  10028e:	e8 57 12 00 00       	call   1014ea <cons_putc>
}
  100293:	90                   	nop
  100294:	c9                   	leave  
  100295:	c3                   	ret    

00100296 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100296:	55                   	push   %ebp
  100297:	89 e5                	mov    %esp,%ebp
  100299:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10029c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002a3:	eb 13                	jmp    1002b8 <cputs+0x22>
        cputch(c, &cnt);
  1002a5:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002a9:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002ac:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002b0:	89 04 24             	mov    %eax,(%esp)
  1002b3:	e8 50 ff ff ff       	call   100208 <cputch>
    while ((c = *str ++) != '\0') {
  1002b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002bb:	8d 50 01             	lea    0x1(%eax),%edx
  1002be:	89 55 08             	mov    %edx,0x8(%ebp)
  1002c1:	0f b6 00             	movzbl (%eax),%eax
  1002c4:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002c7:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002cb:	75 d8                	jne    1002a5 <cputs+0xf>
    }
    cputch('\n', &cnt);
  1002cd:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002d0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002d4:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002db:	e8 28 ff ff ff       	call   100208 <cputch>
    return cnt;
  1002e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002e3:	c9                   	leave  
  1002e4:	c3                   	ret    

001002e5 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002e5:	55                   	push   %ebp
  1002e6:	89 e5                	mov    %esp,%ebp
  1002e8:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002eb:	e8 24 12 00 00       	call   101514 <cons_getc>
  1002f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002f7:	74 f2                	je     1002eb <getchar+0x6>
        /* do nothing */;
    return c;
  1002f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002fc:	c9                   	leave  
  1002fd:	c3                   	ret    

001002fe <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002fe:	55                   	push   %ebp
  1002ff:	89 e5                	mov    %esp,%ebp
  100301:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100304:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100308:	74 13                	je     10031d <readline+0x1f>
        cprintf("%s", prompt);
  10030a:	8b 45 08             	mov    0x8(%ebp),%eax
  10030d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100311:	c7 04 24 a7 32 10 00 	movl   $0x1032a7,(%esp)
  100318:	e8 3f ff ff ff       	call   10025c <cprintf>
    }
    int i = 0, c;
  10031d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100324:	e8 bc ff ff ff       	call   1002e5 <getchar>
  100329:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10032c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100330:	79 07                	jns    100339 <readline+0x3b>
            return NULL;
  100332:	b8 00 00 00 00       	mov    $0x0,%eax
  100337:	eb 78                	jmp    1003b1 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100339:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10033d:	7e 28                	jle    100367 <readline+0x69>
  10033f:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100346:	7f 1f                	jg     100367 <readline+0x69>
            cputchar(c);
  100348:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10034b:	89 04 24             	mov    %eax,(%esp)
  10034e:	e8 2f ff ff ff       	call   100282 <cputchar>
            buf[i ++] = c;
  100353:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100356:	8d 50 01             	lea    0x1(%eax),%edx
  100359:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10035c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10035f:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100365:	eb 45                	jmp    1003ac <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  100367:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10036b:	75 16                	jne    100383 <readline+0x85>
  10036d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100371:	7e 10                	jle    100383 <readline+0x85>
            cputchar(c);
  100373:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100376:	89 04 24             	mov    %eax,(%esp)
  100379:	e8 04 ff ff ff       	call   100282 <cputchar>
            i --;
  10037e:	ff 4d f4             	decl   -0xc(%ebp)
  100381:	eb 29                	jmp    1003ac <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100383:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100387:	74 06                	je     10038f <readline+0x91>
  100389:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10038d:	75 95                	jne    100324 <readline+0x26>
            cputchar(c);
  10038f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100392:	89 04 24             	mov    %eax,(%esp)
  100395:	e8 e8 fe ff ff       	call   100282 <cputchar>
            buf[i] = '\0';
  10039a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10039d:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1003a2:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003a5:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003aa:	eb 05                	jmp    1003b1 <readline+0xb3>
        c = getchar();
  1003ac:	e9 73 ff ff ff       	jmp    100324 <readline+0x26>
        }
    }
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003b9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003be:	85 c0                	test   %eax,%eax
  1003c0:	75 5b                	jne    10041d <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  1003c2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003c9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003cc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003d5:	89 44 24 08          	mov    %eax,0x8(%esp)
  1003d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1003dc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003e0:	c7 04 24 aa 32 10 00 	movl   $0x1032aa,(%esp)
  1003e7:	e8 70 fe ff ff       	call   10025c <cprintf>
    vcprintf(fmt, ap);
  1003ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003f3:	8b 45 10             	mov    0x10(%ebp),%eax
  1003f6:	89 04 24             	mov    %eax,(%esp)
  1003f9:	e8 2b fe ff ff       	call   100229 <vcprintf>
    cprintf("\n");
  1003fe:	c7 04 24 c6 32 10 00 	movl   $0x1032c6,(%esp)
  100405:	e8 52 fe ff ff       	call   10025c <cprintf>
    
    cprintf("stack trackback:\n");
  10040a:	c7 04 24 c8 32 10 00 	movl   $0x1032c8,(%esp)
  100411:	e8 46 fe ff ff       	call   10025c <cprintf>
    print_stackframe();
  100416:	e8 32 06 00 00       	call   100a4d <print_stackframe>
  10041b:	eb 01                	jmp    10041e <__panic+0x6b>
        goto panic_dead;
  10041d:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10041e:	e8 1a 13 00 00       	call   10173d <intr_disable>
    while (1) {
        kmonitor(NULL);
  100423:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10042a:	e8 90 07 00 00       	call   100bbf <kmonitor>
  10042f:	eb f2                	jmp    100423 <__panic+0x70>

00100431 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100431:	55                   	push   %ebp
  100432:	89 e5                	mov    %esp,%ebp
  100434:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100437:	8d 45 14             	lea    0x14(%ebp),%eax
  10043a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10043d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100440:	89 44 24 08          	mov    %eax,0x8(%esp)
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	89 44 24 04          	mov    %eax,0x4(%esp)
  10044b:	c7 04 24 da 32 10 00 	movl   $0x1032da,(%esp)
  100452:	e8 05 fe ff ff       	call   10025c <cprintf>
    vcprintf(fmt, ap);
  100457:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10045a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10045e:	8b 45 10             	mov    0x10(%ebp),%eax
  100461:	89 04 24             	mov    %eax,(%esp)
  100464:	e8 c0 fd ff ff       	call   100229 <vcprintf>
    cprintf("\n");
  100469:	c7 04 24 c6 32 10 00 	movl   $0x1032c6,(%esp)
  100470:	e8 e7 fd ff ff       	call   10025c <cprintf>
    va_end(ap);
}
  100475:	90                   	nop
  100476:	c9                   	leave  
  100477:	c3                   	ret    

00100478 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100478:	55                   	push   %ebp
  100479:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10047b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100480:	5d                   	pop    %ebp
  100481:	c3                   	ret    

00100482 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100482:	55                   	push   %ebp
  100483:	89 e5                	mov    %esp,%ebp
  100485:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100488:	8b 45 0c             	mov    0xc(%ebp),%eax
  10048b:	8b 00                	mov    (%eax),%eax
  10048d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100490:	8b 45 10             	mov    0x10(%ebp),%eax
  100493:	8b 00                	mov    (%eax),%eax
  100495:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100498:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  10049f:	e9 ca 00 00 00       	jmp    10056e <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1004a4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004aa:	01 d0                	add    %edx,%eax
  1004ac:	89 c2                	mov    %eax,%edx
  1004ae:	c1 ea 1f             	shr    $0x1f,%edx
  1004b1:	01 d0                	add    %edx,%eax
  1004b3:	d1 f8                	sar    %eax
  1004b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004bb:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004be:	eb 03                	jmp    1004c3 <stab_binsearch+0x41>
            m --;
  1004c0:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1004c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004c6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004c9:	7c 1f                	jl     1004ea <stab_binsearch+0x68>
  1004cb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004ce:	89 d0                	mov    %edx,%eax
  1004d0:	01 c0                	add    %eax,%eax
  1004d2:	01 d0                	add    %edx,%eax
  1004d4:	c1 e0 02             	shl    $0x2,%eax
  1004d7:	89 c2                	mov    %eax,%edx
  1004d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1004dc:	01 d0                	add    %edx,%eax
  1004de:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004e2:	0f b6 c0             	movzbl %al,%eax
  1004e5:	39 45 14             	cmp    %eax,0x14(%ebp)
  1004e8:	75 d6                	jne    1004c0 <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  1004ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004ed:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004f0:	7d 09                	jge    1004fb <stab_binsearch+0x79>
            l = true_m + 1;
  1004f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004f5:	40                   	inc    %eax
  1004f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004f9:	eb 73                	jmp    10056e <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  1004fb:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100502:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100505:	89 d0                	mov    %edx,%eax
  100507:	01 c0                	add    %eax,%eax
  100509:	01 d0                	add    %edx,%eax
  10050b:	c1 e0 02             	shl    $0x2,%eax
  10050e:	89 c2                	mov    %eax,%edx
  100510:	8b 45 08             	mov    0x8(%ebp),%eax
  100513:	01 d0                	add    %edx,%eax
  100515:	8b 40 08             	mov    0x8(%eax),%eax
  100518:	39 45 18             	cmp    %eax,0x18(%ebp)
  10051b:	76 11                	jbe    10052e <stab_binsearch+0xac>
            *region_left = m;
  10051d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100520:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100523:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100525:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100528:	40                   	inc    %eax
  100529:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10052c:	eb 40                	jmp    10056e <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10052e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100531:	89 d0                	mov    %edx,%eax
  100533:	01 c0                	add    %eax,%eax
  100535:	01 d0                	add    %edx,%eax
  100537:	c1 e0 02             	shl    $0x2,%eax
  10053a:	89 c2                	mov    %eax,%edx
  10053c:	8b 45 08             	mov    0x8(%ebp),%eax
  10053f:	01 d0                	add    %edx,%eax
  100541:	8b 40 08             	mov    0x8(%eax),%eax
  100544:	39 45 18             	cmp    %eax,0x18(%ebp)
  100547:	73 14                	jae    10055d <stab_binsearch+0xdb>
            *region_right = m - 1;
  100549:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10054c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10054f:	8b 45 10             	mov    0x10(%ebp),%eax
  100552:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100554:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100557:	48                   	dec    %eax
  100558:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10055b:	eb 11                	jmp    10056e <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10055d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100560:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100563:	89 10                	mov    %edx,(%eax)
            l = m;
  100565:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100568:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10056b:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  10056e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100571:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100574:	0f 8e 2a ff ff ff    	jle    1004a4 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  10057a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10057e:	75 0f                	jne    10058f <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  100580:	8b 45 0c             	mov    0xc(%ebp),%eax
  100583:	8b 00                	mov    (%eax),%eax
  100585:	8d 50 ff             	lea    -0x1(%eax),%edx
  100588:	8b 45 10             	mov    0x10(%ebp),%eax
  10058b:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10058d:	eb 3e                	jmp    1005cd <stab_binsearch+0x14b>
        l = *region_right;
  10058f:	8b 45 10             	mov    0x10(%ebp),%eax
  100592:	8b 00                	mov    (%eax),%eax
  100594:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  100597:	eb 03                	jmp    10059c <stab_binsearch+0x11a>
  100599:	ff 4d fc             	decl   -0x4(%ebp)
  10059c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10059f:	8b 00                	mov    (%eax),%eax
  1005a1:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005a4:	7e 1f                	jle    1005c5 <stab_binsearch+0x143>
  1005a6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005a9:	89 d0                	mov    %edx,%eax
  1005ab:	01 c0                	add    %eax,%eax
  1005ad:	01 d0                	add    %edx,%eax
  1005af:	c1 e0 02             	shl    $0x2,%eax
  1005b2:	89 c2                	mov    %eax,%edx
  1005b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005b7:	01 d0                	add    %edx,%eax
  1005b9:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005bd:	0f b6 c0             	movzbl %al,%eax
  1005c0:	39 45 14             	cmp    %eax,0x14(%ebp)
  1005c3:	75 d4                	jne    100599 <stab_binsearch+0x117>
        *region_left = l;
  1005c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005cb:	89 10                	mov    %edx,(%eax)
}
  1005cd:	90                   	nop
  1005ce:	c9                   	leave  
  1005cf:	c3                   	ret    

001005d0 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005d0:	55                   	push   %ebp
  1005d1:	89 e5                	mov    %esp,%ebp
  1005d3:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d9:	c7 00 f8 32 10 00    	movl   $0x1032f8,(%eax)
    info->eip_line = 0;
  1005df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	c7 40 08 f8 32 10 00 	movl   $0x1032f8,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005f3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f6:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100600:	8b 55 08             	mov    0x8(%ebp),%edx
  100603:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100606:	8b 45 0c             	mov    0xc(%ebp),%eax
  100609:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100610:	c7 45 f4 ec 3a 10 00 	movl   $0x103aec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100617:	c7 45 f0 a4 b5 10 00 	movl   $0x10b5a4,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10061e:	c7 45 ec a5 b5 10 00 	movl   $0x10b5a5,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100625:	c7 45 e8 57 d6 10 00 	movl   $0x10d657,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10062c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10062f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100632:	76 0b                	jbe    10063f <debuginfo_eip+0x6f>
  100634:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100637:	48                   	dec    %eax
  100638:	0f b6 00             	movzbl (%eax),%eax
  10063b:	84 c0                	test   %al,%al
  10063d:	74 0a                	je     100649 <debuginfo_eip+0x79>
        return -1;
  10063f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100644:	e9 b7 02 00 00       	jmp    100900 <debuginfo_eip+0x330>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100649:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100650:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100653:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100656:	29 c2                	sub    %eax,%edx
  100658:	89 d0                	mov    %edx,%eax
  10065a:	c1 f8 02             	sar    $0x2,%eax
  10065d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100663:	48                   	dec    %eax
  100664:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100667:	8b 45 08             	mov    0x8(%ebp),%eax
  10066a:	89 44 24 10          	mov    %eax,0x10(%esp)
  10066e:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  100675:	00 
  100676:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100679:	89 44 24 08          	mov    %eax,0x8(%esp)
  10067d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100680:	89 44 24 04          	mov    %eax,0x4(%esp)
  100684:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100687:	89 04 24             	mov    %eax,(%esp)
  10068a:	e8 f3 fd ff ff       	call   100482 <stab_binsearch>
    if (lfile == 0)
  10068f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100692:	85 c0                	test   %eax,%eax
  100694:	75 0a                	jne    1006a0 <debuginfo_eip+0xd0>
        return -1;
  100696:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10069b:	e9 60 02 00 00       	jmp    100900 <debuginfo_eip+0x330>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1006af:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006b3:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1006ba:	00 
  1006bb:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006be:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006c2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006c5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006cc:	89 04 24             	mov    %eax,(%esp)
  1006cf:	e8 ae fd ff ff       	call   100482 <stab_binsearch>

    if (lfun <= rfun) {
  1006d4:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006da:	39 c2                	cmp    %eax,%edx
  1006dc:	7f 7c                	jg     10075a <debuginfo_eip+0x18a>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006de:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006e1:	89 c2                	mov    %eax,%edx
  1006e3:	89 d0                	mov    %edx,%eax
  1006e5:	01 c0                	add    %eax,%eax
  1006e7:	01 d0                	add    %edx,%eax
  1006e9:	c1 e0 02             	shl    $0x2,%eax
  1006ec:	89 c2                	mov    %eax,%edx
  1006ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f1:	01 d0                	add    %edx,%eax
  1006f3:	8b 00                	mov    (%eax),%eax
  1006f5:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006f8:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006fb:	29 d1                	sub    %edx,%ecx
  1006fd:	89 ca                	mov    %ecx,%edx
  1006ff:	39 d0                	cmp    %edx,%eax
  100701:	73 22                	jae    100725 <debuginfo_eip+0x155>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100703:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100706:	89 c2                	mov    %eax,%edx
  100708:	89 d0                	mov    %edx,%eax
  10070a:	01 c0                	add    %eax,%eax
  10070c:	01 d0                	add    %edx,%eax
  10070e:	c1 e0 02             	shl    $0x2,%eax
  100711:	89 c2                	mov    %eax,%edx
  100713:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100716:	01 d0                	add    %edx,%eax
  100718:	8b 10                	mov    (%eax),%edx
  10071a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10071d:	01 c2                	add    %eax,%edx
  10071f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100722:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100725:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100728:	89 c2                	mov    %eax,%edx
  10072a:	89 d0                	mov    %edx,%eax
  10072c:	01 c0                	add    %eax,%eax
  10072e:	01 d0                	add    %edx,%eax
  100730:	c1 e0 02             	shl    $0x2,%eax
  100733:	89 c2                	mov    %eax,%edx
  100735:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100738:	01 d0                	add    %edx,%eax
  10073a:	8b 50 08             	mov    0x8(%eax),%edx
  10073d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100740:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100743:	8b 45 0c             	mov    0xc(%ebp),%eax
  100746:	8b 40 10             	mov    0x10(%eax),%eax
  100749:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10074c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10074f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100752:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100755:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100758:	eb 15                	jmp    10076f <debuginfo_eip+0x19f>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10075a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10075d:	8b 55 08             	mov    0x8(%ebp),%edx
  100760:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100763:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100766:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100769:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10076c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10076f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100772:	8b 40 08             	mov    0x8(%eax),%eax
  100775:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  10077c:	00 
  10077d:	89 04 24             	mov    %eax,(%esp)
  100780:	e8 ee 20 00 00       	call   102873 <strfind>
  100785:	89 c2                	mov    %eax,%edx
  100787:	8b 45 0c             	mov    0xc(%ebp),%eax
  10078a:	8b 40 08             	mov    0x8(%eax),%eax
  10078d:	29 c2                	sub    %eax,%edx
  10078f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100792:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100795:	8b 45 08             	mov    0x8(%ebp),%eax
  100798:	89 44 24 10          	mov    %eax,0x10(%esp)
  10079c:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007a3:	00 
  1007a4:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007a7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007ab:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007ae:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b5:	89 04 24             	mov    %eax,(%esp)
  1007b8:	e8 c5 fc ff ff       	call   100482 <stab_binsearch>
    if (lline <= rline) {
  1007bd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007c3:	39 c2                	cmp    %eax,%edx
  1007c5:	7f 23                	jg     1007ea <debuginfo_eip+0x21a>
        info->eip_line = stabs[rline].n_desc;
  1007c7:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007ca:	89 c2                	mov    %eax,%edx
  1007cc:	89 d0                	mov    %edx,%eax
  1007ce:	01 c0                	add    %eax,%eax
  1007d0:	01 d0                	add    %edx,%eax
  1007d2:	c1 e0 02             	shl    $0x2,%eax
  1007d5:	89 c2                	mov    %eax,%edx
  1007d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007da:	01 d0                	add    %edx,%eax
  1007dc:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007e0:	89 c2                	mov    %eax,%edx
  1007e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e5:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007e8:	eb 11                	jmp    1007fb <debuginfo_eip+0x22b>
        return -1;
  1007ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007ef:	e9 0c 01 00 00       	jmp    100900 <debuginfo_eip+0x330>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007f7:	48                   	dec    %eax
  1007f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  1007fb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100801:	39 c2                	cmp    %eax,%edx
  100803:	7c 56                	jl     10085b <debuginfo_eip+0x28b>
           && stabs[lline].n_type != N_SOL
  100805:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100808:	89 c2                	mov    %eax,%edx
  10080a:	89 d0                	mov    %edx,%eax
  10080c:	01 c0                	add    %eax,%eax
  10080e:	01 d0                	add    %edx,%eax
  100810:	c1 e0 02             	shl    $0x2,%eax
  100813:	89 c2                	mov    %eax,%edx
  100815:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100818:	01 d0                	add    %edx,%eax
  10081a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10081e:	3c 84                	cmp    $0x84,%al
  100820:	74 39                	je     10085b <debuginfo_eip+0x28b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c 64                	cmp    $0x64,%al
  10083d:	75 b5                	jne    1007f4 <debuginfo_eip+0x224>
  10083f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100842:	89 c2                	mov    %eax,%edx
  100844:	89 d0                	mov    %edx,%eax
  100846:	01 c0                	add    %eax,%eax
  100848:	01 d0                	add    %edx,%eax
  10084a:	c1 e0 02             	shl    $0x2,%eax
  10084d:	89 c2                	mov    %eax,%edx
  10084f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100852:	01 d0                	add    %edx,%eax
  100854:	8b 40 08             	mov    0x8(%eax),%eax
  100857:	85 c0                	test   %eax,%eax
  100859:	74 99                	je     1007f4 <debuginfo_eip+0x224>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10085b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10085e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100861:	39 c2                	cmp    %eax,%edx
  100863:	7c 46                	jl     1008ab <debuginfo_eip+0x2db>
  100865:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100868:	89 c2                	mov    %eax,%edx
  10086a:	89 d0                	mov    %edx,%eax
  10086c:	01 c0                	add    %eax,%eax
  10086e:	01 d0                	add    %edx,%eax
  100870:	c1 e0 02             	shl    $0x2,%eax
  100873:	89 c2                	mov    %eax,%edx
  100875:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100878:	01 d0                	add    %edx,%eax
  10087a:	8b 00                	mov    (%eax),%eax
  10087c:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10087f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100882:	29 d1                	sub    %edx,%ecx
  100884:	89 ca                	mov    %ecx,%edx
  100886:	39 d0                	cmp    %edx,%eax
  100888:	73 21                	jae    1008ab <debuginfo_eip+0x2db>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10088a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10088d:	89 c2                	mov    %eax,%edx
  10088f:	89 d0                	mov    %edx,%eax
  100891:	01 c0                	add    %eax,%eax
  100893:	01 d0                	add    %edx,%eax
  100895:	c1 e0 02             	shl    $0x2,%eax
  100898:	89 c2                	mov    %eax,%edx
  10089a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10089d:	01 d0                	add    %edx,%eax
  10089f:	8b 10                	mov    (%eax),%edx
  1008a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008a4:	01 c2                	add    %eax,%edx
  1008a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008a9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008ab:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008ae:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008b1:	39 c2                	cmp    %eax,%edx
  1008b3:	7d 46                	jge    1008fb <debuginfo_eip+0x32b>
        for (lline = lfun + 1;
  1008b5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008b8:	40                   	inc    %eax
  1008b9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008bc:	eb 16                	jmp    1008d4 <debuginfo_eip+0x304>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008c1:	8b 40 14             	mov    0x14(%eax),%eax
  1008c4:	8d 50 01             	lea    0x1(%eax),%edx
  1008c7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ca:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1008cd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008d0:	40                   	inc    %eax
  1008d1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008d4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1008da:	39 c2                	cmp    %eax,%edx
  1008dc:	7d 1d                	jge    1008fb <debuginfo_eip+0x32b>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008e1:	89 c2                	mov    %eax,%edx
  1008e3:	89 d0                	mov    %edx,%eax
  1008e5:	01 c0                	add    %eax,%eax
  1008e7:	01 d0                	add    %edx,%eax
  1008e9:	c1 e0 02             	shl    $0x2,%eax
  1008ec:	89 c2                	mov    %eax,%edx
  1008ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008f1:	01 d0                	add    %edx,%eax
  1008f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008f7:	3c a0                	cmp    $0xa0,%al
  1008f9:	74 c3                	je     1008be <debuginfo_eip+0x2ee>
        }
    }
    return 0;
  1008fb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100900:	c9                   	leave  
  100901:	c3                   	ret    

00100902 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100902:	55                   	push   %ebp
  100903:	89 e5                	mov    %esp,%ebp
  100905:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100908:	c7 04 24 02 33 10 00 	movl   $0x103302,(%esp)
  10090f:	e8 48 f9 ff ff       	call   10025c <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100914:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10091b:	00 
  10091c:	c7 04 24 1b 33 10 00 	movl   $0x10331b,(%esp)
  100923:	e8 34 f9 ff ff       	call   10025c <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100928:	c7 44 24 04 f1 31 10 	movl   $0x1031f1,0x4(%esp)
  10092f:	00 
  100930:	c7 04 24 33 33 10 00 	movl   $0x103333,(%esp)
  100937:	e8 20 f9 ff ff       	call   10025c <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10093c:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100943:	00 
  100944:	c7 04 24 4b 33 10 00 	movl   $0x10334b,(%esp)
  10094b:	e8 0c f9 ff ff       	call   10025c <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100950:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  100957:	00 
  100958:	c7 04 24 63 33 10 00 	movl   $0x103363,(%esp)
  10095f:	e8 f8 f8 ff ff       	call   10025c <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100964:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  100969:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10096f:	b8 00 00 10 00       	mov    $0x100000,%eax
  100974:	29 c2                	sub    %eax,%edx
  100976:	89 d0                	mov    %edx,%eax
  100978:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10097e:	85 c0                	test   %eax,%eax
  100980:	0f 48 c2             	cmovs  %edx,%eax
  100983:	c1 f8 0a             	sar    $0xa,%eax
  100986:	89 44 24 04          	mov    %eax,0x4(%esp)
  10098a:	c7 04 24 7c 33 10 00 	movl   $0x10337c,(%esp)
  100991:	e8 c6 f8 ff ff       	call   10025c <cprintf>
}
  100996:	90                   	nop
  100997:	c9                   	leave  
  100998:	c3                   	ret    

00100999 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100999:	55                   	push   %ebp
  10099a:	89 e5                	mov    %esp,%ebp
  10099c:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009a2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009a5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1009ac:	89 04 24             	mov    %eax,(%esp)
  1009af:	e8 1c fc ff ff       	call   1005d0 <debuginfo_eip>
  1009b4:	85 c0                	test   %eax,%eax
  1009b6:	74 15                	je     1009cd <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1009bb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009bf:	c7 04 24 a6 33 10 00 	movl   $0x1033a6,(%esp)
  1009c6:	e8 91 f8 ff ff       	call   10025c <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009cb:	eb 6c                	jmp    100a39 <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009d4:	eb 1b                	jmp    1009f1 <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  1009d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009dc:	01 d0                	add    %edx,%eax
  1009de:	0f b6 00             	movzbl (%eax),%eax
  1009e1:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009ea:	01 ca                	add    %ecx,%edx
  1009ec:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009ee:	ff 45 f4             	incl   -0xc(%ebp)
  1009f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009f4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1009f7:	7c dd                	jl     1009d6 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  1009f9:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a02:	01 d0                	add    %edx,%eax
  100a04:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a07:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a0a:	8b 55 08             	mov    0x8(%ebp),%edx
  100a0d:	89 d1                	mov    %edx,%ecx
  100a0f:	29 c1                	sub    %eax,%ecx
  100a11:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a14:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a17:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a1b:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a21:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a25:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a29:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a2d:	c7 04 24 c2 33 10 00 	movl   $0x1033c2,(%esp)
  100a34:	e8 23 f8 ff ff       	call   10025c <cprintf>
}
  100a39:	90                   	nop
  100a3a:	c9                   	leave  
  100a3b:	c3                   	ret    

00100a3c <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a3c:	55                   	push   %ebp
  100a3d:	89 e5                	mov    %esp,%ebp
  100a3f:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a42:	8b 45 04             	mov    0x4(%ebp),%eax
  100a45:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a48:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a4b:	c9                   	leave  
  100a4c:	c3                   	ret    

00100a4d <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a4d:	55                   	push   %ebp
  100a4e:	89 e5                	mov    %esp,%ebp
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
}
  100a50:	90                   	nop
  100a51:	5d                   	pop    %ebp
  100a52:	c3                   	ret    

00100a53 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a53:	55                   	push   %ebp
  100a54:	89 e5                	mov    %esp,%ebp
  100a56:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a59:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a60:	eb 0c                	jmp    100a6e <parse+0x1b>
            *buf ++ = '\0';
  100a62:	8b 45 08             	mov    0x8(%ebp),%eax
  100a65:	8d 50 01             	lea    0x1(%eax),%edx
  100a68:	89 55 08             	mov    %edx,0x8(%ebp)
  100a6b:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a6e:	8b 45 08             	mov    0x8(%ebp),%eax
  100a71:	0f b6 00             	movzbl (%eax),%eax
  100a74:	84 c0                	test   %al,%al
  100a76:	74 1d                	je     100a95 <parse+0x42>
  100a78:	8b 45 08             	mov    0x8(%ebp),%eax
  100a7b:	0f b6 00             	movzbl (%eax),%eax
  100a7e:	0f be c0             	movsbl %al,%eax
  100a81:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a85:	c7 04 24 54 34 10 00 	movl   $0x103454,(%esp)
  100a8c:	e8 b0 1d 00 00       	call   102841 <strchr>
  100a91:	85 c0                	test   %eax,%eax
  100a93:	75 cd                	jne    100a62 <parse+0xf>
        }
        if (*buf == '\0') {
  100a95:	8b 45 08             	mov    0x8(%ebp),%eax
  100a98:	0f b6 00             	movzbl (%eax),%eax
  100a9b:	84 c0                	test   %al,%al
  100a9d:	74 65                	je     100b04 <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a9f:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100aa3:	75 14                	jne    100ab9 <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100aa5:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100aac:	00 
  100aad:	c7 04 24 59 34 10 00 	movl   $0x103459,(%esp)
  100ab4:	e8 a3 f7 ff ff       	call   10025c <cprintf>
        }
        argv[argc ++] = buf;
  100ab9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100abc:	8d 50 01             	lea    0x1(%eax),%edx
  100abf:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ac2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ac9:	8b 45 0c             	mov    0xc(%ebp),%eax
  100acc:	01 c2                	add    %eax,%edx
  100ace:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad1:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ad3:	eb 03                	jmp    100ad8 <parse+0x85>
            buf ++;
  100ad5:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ad8:	8b 45 08             	mov    0x8(%ebp),%eax
  100adb:	0f b6 00             	movzbl (%eax),%eax
  100ade:	84 c0                	test   %al,%al
  100ae0:	74 8c                	je     100a6e <parse+0x1b>
  100ae2:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae5:	0f b6 00             	movzbl (%eax),%eax
  100ae8:	0f be c0             	movsbl %al,%eax
  100aeb:	89 44 24 04          	mov    %eax,0x4(%esp)
  100aef:	c7 04 24 54 34 10 00 	movl   $0x103454,(%esp)
  100af6:	e8 46 1d 00 00       	call   102841 <strchr>
  100afb:	85 c0                	test   %eax,%eax
  100afd:	74 d6                	je     100ad5 <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100aff:	e9 6a ff ff ff       	jmp    100a6e <parse+0x1b>
            break;
  100b04:	90                   	nop
        }
    }
    return argc;
  100b05:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b08:	c9                   	leave  
  100b09:	c3                   	ret    

00100b0a <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b0a:	55                   	push   %ebp
  100b0b:	89 e5                	mov    %esp,%ebp
  100b0d:	53                   	push   %ebx
  100b0e:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b11:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b14:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b18:	8b 45 08             	mov    0x8(%ebp),%eax
  100b1b:	89 04 24             	mov    %eax,(%esp)
  100b1e:	e8 30 ff ff ff       	call   100a53 <parse>
  100b23:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b26:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b2a:	75 0a                	jne    100b36 <runcmd+0x2c>
        return 0;
  100b2c:	b8 00 00 00 00       	mov    $0x0,%eax
  100b31:	e9 83 00 00 00       	jmp    100bb9 <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b36:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b3d:	eb 5a                	jmp    100b99 <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b3f:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b42:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b45:	89 d0                	mov    %edx,%eax
  100b47:	01 c0                	add    %eax,%eax
  100b49:	01 d0                	add    %edx,%eax
  100b4b:	c1 e0 02             	shl    $0x2,%eax
  100b4e:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b53:	8b 00                	mov    (%eax),%eax
  100b55:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b59:	89 04 24             	mov    %eax,(%esp)
  100b5c:	e8 43 1c 00 00       	call   1027a4 <strcmp>
  100b61:	85 c0                	test   %eax,%eax
  100b63:	75 31                	jne    100b96 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b65:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b68:	89 d0                	mov    %edx,%eax
  100b6a:	01 c0                	add    %eax,%eax
  100b6c:	01 d0                	add    %edx,%eax
  100b6e:	c1 e0 02             	shl    $0x2,%eax
  100b71:	05 08 e0 10 00       	add    $0x10e008,%eax
  100b76:	8b 10                	mov    (%eax),%edx
  100b78:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b7b:	83 c0 04             	add    $0x4,%eax
  100b7e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100b81:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100b84:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100b87:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100b8b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b8f:	89 1c 24             	mov    %ebx,(%esp)
  100b92:	ff d2                	call   *%edx
  100b94:	eb 23                	jmp    100bb9 <runcmd+0xaf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100b96:	ff 45 f4             	incl   -0xc(%ebp)
  100b99:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b9c:	83 f8 02             	cmp    $0x2,%eax
  100b9f:	76 9e                	jbe    100b3f <runcmd+0x35>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100ba1:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100ba4:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ba8:	c7 04 24 77 34 10 00 	movl   $0x103477,(%esp)
  100baf:	e8 a8 f6 ff ff       	call   10025c <cprintf>
    return 0;
  100bb4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bb9:	83 c4 64             	add    $0x64,%esp
  100bbc:	5b                   	pop    %ebx
  100bbd:	5d                   	pop    %ebp
  100bbe:	c3                   	ret    

00100bbf <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bbf:	55                   	push   %ebp
  100bc0:	89 e5                	mov    %esp,%ebp
  100bc2:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bc5:	c7 04 24 90 34 10 00 	movl   $0x103490,(%esp)
  100bcc:	e8 8b f6 ff ff       	call   10025c <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bd1:	c7 04 24 b8 34 10 00 	movl   $0x1034b8,(%esp)
  100bd8:	e8 7f f6 ff ff       	call   10025c <cprintf>

    if (tf != NULL) {
  100bdd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100be1:	74 0b                	je     100bee <kmonitor+0x2f>
        print_trapframe(tf);
  100be3:	8b 45 08             	mov    0x8(%ebp),%eax
  100be6:	89 04 24             	mov    %eax,(%esp)
  100be9:	e8 bf 0b 00 00       	call   1017ad <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bee:	c7 04 24 dd 34 10 00 	movl   $0x1034dd,(%esp)
  100bf5:	e8 04 f7 ff ff       	call   1002fe <readline>
  100bfa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bfd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c01:	74 eb                	je     100bee <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100c03:	8b 45 08             	mov    0x8(%ebp),%eax
  100c06:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c0d:	89 04 24             	mov    %eax,(%esp)
  100c10:	e8 f5 fe ff ff       	call   100b0a <runcmd>
  100c15:	85 c0                	test   %eax,%eax
  100c17:	78 02                	js     100c1b <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100c19:	eb d3                	jmp    100bee <kmonitor+0x2f>
                break;
  100c1b:	90                   	nop
            }
        }
    }
}
  100c1c:	90                   	nop
  100c1d:	c9                   	leave  
  100c1e:	c3                   	ret    

00100c1f <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c1f:	55                   	push   %ebp
  100c20:	89 e5                	mov    %esp,%ebp
  100c22:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c25:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c2c:	eb 3d                	jmp    100c6b <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c2e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c31:	89 d0                	mov    %edx,%eax
  100c33:	01 c0                	add    %eax,%eax
  100c35:	01 d0                	add    %edx,%eax
  100c37:	c1 e0 02             	shl    $0x2,%eax
  100c3a:	05 04 e0 10 00       	add    $0x10e004,%eax
  100c3f:	8b 08                	mov    (%eax),%ecx
  100c41:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c44:	89 d0                	mov    %edx,%eax
  100c46:	01 c0                	add    %eax,%eax
  100c48:	01 d0                	add    %edx,%eax
  100c4a:	c1 e0 02             	shl    $0x2,%eax
  100c4d:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c52:	8b 00                	mov    (%eax),%eax
  100c54:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c58:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c5c:	c7 04 24 e1 34 10 00 	movl   $0x1034e1,(%esp)
  100c63:	e8 f4 f5 ff ff       	call   10025c <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c68:	ff 45 f4             	incl   -0xc(%ebp)
  100c6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c6e:	83 f8 02             	cmp    $0x2,%eax
  100c71:	76 bb                	jbe    100c2e <mon_help+0xf>
    }
    return 0;
  100c73:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c78:	c9                   	leave  
  100c79:	c3                   	ret    

00100c7a <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c7a:	55                   	push   %ebp
  100c7b:	89 e5                	mov    %esp,%ebp
  100c7d:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c80:	e8 7d fc ff ff       	call   100902 <print_kerninfo>
    return 0;
  100c85:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c8a:	c9                   	leave  
  100c8b:	c3                   	ret    

00100c8c <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c8c:	55                   	push   %ebp
  100c8d:	89 e5                	mov    %esp,%ebp
  100c8f:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c92:	e8 b6 fd ff ff       	call   100a4d <print_stackframe>
    return 0;
  100c97:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c9c:	c9                   	leave  
  100c9d:	c3                   	ret    

00100c9e <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100c9e:	55                   	push   %ebp
  100c9f:	89 e5                	mov    %esp,%ebp
  100ca1:	83 ec 28             	sub    $0x28,%esp
  100ca4:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100caa:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100cae:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100cb2:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100cb6:	ee                   	out    %al,(%dx)
  100cb7:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100cbd:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100cc1:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100cc5:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100cc9:	ee                   	out    %al,(%dx)
  100cca:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100cd0:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
  100cd4:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100cd8:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100cdc:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100cdd:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100ce4:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100ce7:	c7 04 24 ea 34 10 00 	movl   $0x1034ea,(%esp)
  100cee:	e8 69 f5 ff ff       	call   10025c <cprintf>
    pic_enable(IRQ_TIMER);
  100cf3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100cfa:	e8 ca 08 00 00       	call   1015c9 <pic_enable>
}
  100cff:	90                   	nop
  100d00:	c9                   	leave  
  100d01:	c3                   	ret    

00100d02 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d02:	55                   	push   %ebp
  100d03:	89 e5                	mov    %esp,%ebp
  100d05:	83 ec 10             	sub    $0x10,%esp
  100d08:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100d0e:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100d12:	89 c2                	mov    %eax,%edx
  100d14:	ec                   	in     (%dx),%al
  100d15:	88 45 f1             	mov    %al,-0xf(%ebp)
  100d18:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100d1e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100d22:	89 c2                	mov    %eax,%edx
  100d24:	ec                   	in     (%dx),%al
  100d25:	88 45 f5             	mov    %al,-0xb(%ebp)
  100d28:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100d2e:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100d32:	89 c2                	mov    %eax,%edx
  100d34:	ec                   	in     (%dx),%al
  100d35:	88 45 f9             	mov    %al,-0x7(%ebp)
  100d38:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100d3e:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100d42:	89 c2                	mov    %eax,%edx
  100d44:	ec                   	in     (%dx),%al
  100d45:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100d48:	90                   	nop
  100d49:	c9                   	leave  
  100d4a:	c3                   	ret    

00100d4b <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100d4b:	55                   	push   %ebp
  100d4c:	89 e5                	mov    %esp,%ebp
  100d4e:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100d51:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100d58:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d5b:	0f b7 00             	movzwl (%eax),%eax
  100d5e:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100d62:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d65:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100d6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d6d:	0f b7 00             	movzwl (%eax),%eax
  100d70:	0f b7 c0             	movzwl %ax,%eax
  100d73:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100d78:	74 12                	je     100d8c <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100d7a:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100d81:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100d88:	b4 03 
  100d8a:	eb 13                	jmp    100d9f <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100d8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d8f:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100d93:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100d96:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100d9d:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100d9f:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100da6:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100daa:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dae:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100db2:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100db6:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100db7:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100dbe:	40                   	inc    %eax
  100dbf:	0f b7 c0             	movzwl %ax,%eax
  100dc2:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dc6:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100dca:	89 c2                	mov    %eax,%edx
  100dcc:	ec                   	in     (%dx),%al
  100dcd:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100dd0:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100dd4:	0f b6 c0             	movzbl %al,%eax
  100dd7:	c1 e0 08             	shl    $0x8,%eax
  100dda:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ddd:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100de4:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100de8:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dec:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100df0:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100df4:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100df5:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100dfc:	40                   	inc    %eax
  100dfd:	0f b7 c0             	movzwl %ax,%eax
  100e00:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e04:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e08:	89 c2                	mov    %eax,%edx
  100e0a:	ec                   	in     (%dx),%al
  100e0b:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100e0e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e12:	0f b6 c0             	movzbl %al,%eax
  100e15:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100e18:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e1b:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100e20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e23:	0f b7 c0             	movzwl %ax,%eax
  100e26:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100e2c:	90                   	nop
  100e2d:	c9                   	leave  
  100e2e:	c3                   	ret    

00100e2f <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100e2f:	55                   	push   %ebp
  100e30:	89 e5                	mov    %esp,%ebp
  100e32:	83 ec 48             	sub    $0x48,%esp
  100e35:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100e3b:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e3f:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100e43:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100e47:	ee                   	out    %al,(%dx)
  100e48:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100e4e:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
  100e52:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100e56:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100e5a:	ee                   	out    %al,(%dx)
  100e5b:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100e61:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
  100e65:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100e69:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100e6d:	ee                   	out    %al,(%dx)
  100e6e:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100e74:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100e78:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100e7c:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100e80:	ee                   	out    %al,(%dx)
  100e81:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100e87:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
  100e8b:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100e8f:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100e93:	ee                   	out    %al,(%dx)
  100e94:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100e9a:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
  100e9e:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ea2:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ea6:	ee                   	out    %al,(%dx)
  100ea7:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100ead:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
  100eb1:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100eb5:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100eb9:	ee                   	out    %al,(%dx)
  100eba:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ec0:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ec4:	89 c2                	mov    %eax,%edx
  100ec6:	ec                   	in     (%dx),%al
  100ec7:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100eca:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100ece:	3c ff                	cmp    $0xff,%al
  100ed0:	0f 95 c0             	setne  %al
  100ed3:	0f b6 c0             	movzbl %al,%eax
  100ed6:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100edb:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ee1:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100ee5:	89 c2                	mov    %eax,%edx
  100ee7:	ec                   	in     (%dx),%al
  100ee8:	88 45 f1             	mov    %al,-0xf(%ebp)
  100eeb:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100ef1:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100ef5:	89 c2                	mov    %eax,%edx
  100ef7:	ec                   	in     (%dx),%al
  100ef8:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100efb:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100f00:	85 c0                	test   %eax,%eax
  100f02:	74 0c                	je     100f10 <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100f04:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100f0b:	e8 b9 06 00 00       	call   1015c9 <pic_enable>
    }
}
  100f10:	90                   	nop
  100f11:	c9                   	leave  
  100f12:	c3                   	ret    

00100f13 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100f13:	55                   	push   %ebp
  100f14:	89 e5                	mov    %esp,%ebp
  100f16:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100f19:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100f20:	eb 08                	jmp    100f2a <lpt_putc_sub+0x17>
        delay();
  100f22:	e8 db fd ff ff       	call   100d02 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100f27:	ff 45 fc             	incl   -0x4(%ebp)
  100f2a:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100f30:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100f34:	89 c2                	mov    %eax,%edx
  100f36:	ec                   	in     (%dx),%al
  100f37:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100f3a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100f3e:	84 c0                	test   %al,%al
  100f40:	78 09                	js     100f4b <lpt_putc_sub+0x38>
  100f42:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100f49:	7e d7                	jle    100f22 <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  100f4b:	8b 45 08             	mov    0x8(%ebp),%eax
  100f4e:	0f b6 c0             	movzbl %al,%eax
  100f51:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  100f57:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f5a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f5e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f62:	ee                   	out    %al,(%dx)
  100f63:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  100f69:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  100f6d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f71:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f75:	ee                   	out    %al,(%dx)
  100f76:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  100f7c:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
  100f80:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f84:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f88:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  100f89:	90                   	nop
  100f8a:	c9                   	leave  
  100f8b:	c3                   	ret    

00100f8c <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  100f8c:	55                   	push   %ebp
  100f8d:	89 e5                	mov    %esp,%ebp
  100f8f:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  100f92:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  100f96:	74 0d                	je     100fa5 <lpt_putc+0x19>
        lpt_putc_sub(c);
  100f98:	8b 45 08             	mov    0x8(%ebp),%eax
  100f9b:	89 04 24             	mov    %eax,(%esp)
  100f9e:	e8 70 ff ff ff       	call   100f13 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  100fa3:	eb 24                	jmp    100fc9 <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  100fa5:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  100fac:	e8 62 ff ff ff       	call   100f13 <lpt_putc_sub>
        lpt_putc_sub(' ');
  100fb1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100fb8:	e8 56 ff ff ff       	call   100f13 <lpt_putc_sub>
        lpt_putc_sub('\b');
  100fbd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  100fc4:	e8 4a ff ff ff       	call   100f13 <lpt_putc_sub>
}
  100fc9:	90                   	nop
  100fca:	c9                   	leave  
  100fcb:	c3                   	ret    

00100fcc <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  100fcc:	55                   	push   %ebp
  100fcd:	89 e5                	mov    %esp,%ebp
  100fcf:	53                   	push   %ebx
  100fd0:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  100fd3:	8b 45 08             	mov    0x8(%ebp),%eax
  100fd6:	25 00 ff ff ff       	and    $0xffffff00,%eax
  100fdb:	85 c0                	test   %eax,%eax
  100fdd:	75 07                	jne    100fe6 <cga_putc+0x1a>
        c |= 0x0700;
  100fdf:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  100fe6:	8b 45 08             	mov    0x8(%ebp),%eax
  100fe9:	0f b6 c0             	movzbl %al,%eax
  100fec:	83 f8 0a             	cmp    $0xa,%eax
  100fef:	74 55                	je     101046 <cga_putc+0x7a>
  100ff1:	83 f8 0d             	cmp    $0xd,%eax
  100ff4:	74 63                	je     101059 <cga_putc+0x8d>
  100ff6:	83 f8 08             	cmp    $0x8,%eax
  100ff9:	0f 85 94 00 00 00    	jne    101093 <cga_putc+0xc7>
    case '\b':
        if (crt_pos > 0) {
  100fff:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101006:	85 c0                	test   %eax,%eax
  101008:	0f 84 af 00 00 00    	je     1010bd <cga_putc+0xf1>
            crt_pos --;
  10100e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101015:	48                   	dec    %eax
  101016:	0f b7 c0             	movzwl %ax,%eax
  101019:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10101f:	8b 45 08             	mov    0x8(%ebp),%eax
  101022:	98                   	cwtl   
  101023:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101028:	98                   	cwtl   
  101029:	83 c8 20             	or     $0x20,%eax
  10102c:	98                   	cwtl   
  10102d:	8b 15 60 ee 10 00    	mov    0x10ee60,%edx
  101033:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  10103a:	01 c9                	add    %ecx,%ecx
  10103c:	01 ca                	add    %ecx,%edx
  10103e:	0f b7 c0             	movzwl %ax,%eax
  101041:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101044:	eb 77                	jmp    1010bd <cga_putc+0xf1>
    case '\n':
        crt_pos += CRT_COLS;
  101046:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10104d:	83 c0 50             	add    $0x50,%eax
  101050:	0f b7 c0             	movzwl %ax,%eax
  101053:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101059:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101060:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101067:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  10106c:	89 c8                	mov    %ecx,%eax
  10106e:	f7 e2                	mul    %edx
  101070:	c1 ea 06             	shr    $0x6,%edx
  101073:	89 d0                	mov    %edx,%eax
  101075:	c1 e0 02             	shl    $0x2,%eax
  101078:	01 d0                	add    %edx,%eax
  10107a:	c1 e0 04             	shl    $0x4,%eax
  10107d:	29 c1                	sub    %eax,%ecx
  10107f:	89 c8                	mov    %ecx,%eax
  101081:	0f b7 c0             	movzwl %ax,%eax
  101084:	29 c3                	sub    %eax,%ebx
  101086:	89 d8                	mov    %ebx,%eax
  101088:	0f b7 c0             	movzwl %ax,%eax
  10108b:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101091:	eb 2b                	jmp    1010be <cga_putc+0xf2>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101093:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101099:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010a0:	8d 50 01             	lea    0x1(%eax),%edx
  1010a3:	0f b7 d2             	movzwl %dx,%edx
  1010a6:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  1010ad:	01 c0                	add    %eax,%eax
  1010af:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1010b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b5:	0f b7 c0             	movzwl %ax,%eax
  1010b8:	66 89 02             	mov    %ax,(%edx)
        break;
  1010bb:	eb 01                	jmp    1010be <cga_putc+0xf2>
        break;
  1010bd:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1010be:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010c5:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1010ca:	76 5d                	jbe    101129 <cga_putc+0x15d>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1010cc:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010d1:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1010d7:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010dc:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1010e3:	00 
  1010e4:	89 54 24 04          	mov    %edx,0x4(%esp)
  1010e8:	89 04 24             	mov    %eax,(%esp)
  1010eb:	e8 47 19 00 00       	call   102a37 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1010f0:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1010f7:	eb 14                	jmp    10110d <cga_putc+0x141>
            crt_buf[i] = 0x0700 | ' ';
  1010f9:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101101:	01 d2                	add    %edx,%edx
  101103:	01 d0                	add    %edx,%eax
  101105:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10110a:	ff 45 f4             	incl   -0xc(%ebp)
  10110d:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101114:	7e e3                	jle    1010f9 <cga_putc+0x12d>
        }
        crt_pos -= CRT_COLS;
  101116:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10111d:	83 e8 50             	sub    $0x50,%eax
  101120:	0f b7 c0             	movzwl %ax,%eax
  101123:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101129:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101130:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101134:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
  101138:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10113c:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101140:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  101141:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101148:	c1 e8 08             	shr    $0x8,%eax
  10114b:	0f b7 c0             	movzwl %ax,%eax
  10114e:	0f b6 c0             	movzbl %al,%eax
  101151:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101158:	42                   	inc    %edx
  101159:	0f b7 d2             	movzwl %dx,%edx
  10115c:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101160:	88 45 e9             	mov    %al,-0x17(%ebp)
  101163:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101167:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10116b:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  10116c:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101173:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101177:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
  10117b:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10117f:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101183:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101184:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10118b:	0f b6 c0             	movzbl %al,%eax
  10118e:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101195:	42                   	inc    %edx
  101196:	0f b7 d2             	movzwl %dx,%edx
  101199:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  10119d:	88 45 f1             	mov    %al,-0xf(%ebp)
  1011a0:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011a4:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011a8:	ee                   	out    %al,(%dx)
}
  1011a9:	90                   	nop
  1011aa:	83 c4 34             	add    $0x34,%esp
  1011ad:	5b                   	pop    %ebx
  1011ae:	5d                   	pop    %ebp
  1011af:	c3                   	ret    

001011b0 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1011b0:	55                   	push   %ebp
  1011b1:	89 e5                	mov    %esp,%ebp
  1011b3:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1011b6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1011bd:	eb 08                	jmp    1011c7 <serial_putc_sub+0x17>
        delay();
  1011bf:	e8 3e fb ff ff       	call   100d02 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1011c4:	ff 45 fc             	incl   -0x4(%ebp)
  1011c7:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1011cd:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1011d1:	89 c2                	mov    %eax,%edx
  1011d3:	ec                   	in     (%dx),%al
  1011d4:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1011d7:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1011db:	0f b6 c0             	movzbl %al,%eax
  1011de:	83 e0 20             	and    $0x20,%eax
  1011e1:	85 c0                	test   %eax,%eax
  1011e3:	75 09                	jne    1011ee <serial_putc_sub+0x3e>
  1011e5:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1011ec:	7e d1                	jle    1011bf <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1011ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1011f1:	0f b6 c0             	movzbl %al,%eax
  1011f4:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1011fa:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1011fd:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101201:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101205:	ee                   	out    %al,(%dx)
}
  101206:	90                   	nop
  101207:	c9                   	leave  
  101208:	c3                   	ret    

00101209 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101209:	55                   	push   %ebp
  10120a:	89 e5                	mov    %esp,%ebp
  10120c:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10120f:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101213:	74 0d                	je     101222 <serial_putc+0x19>
        serial_putc_sub(c);
  101215:	8b 45 08             	mov    0x8(%ebp),%eax
  101218:	89 04 24             	mov    %eax,(%esp)
  10121b:	e8 90 ff ff ff       	call   1011b0 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101220:	eb 24                	jmp    101246 <serial_putc+0x3d>
        serial_putc_sub('\b');
  101222:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101229:	e8 82 ff ff ff       	call   1011b0 <serial_putc_sub>
        serial_putc_sub(' ');
  10122e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101235:	e8 76 ff ff ff       	call   1011b0 <serial_putc_sub>
        serial_putc_sub('\b');
  10123a:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101241:	e8 6a ff ff ff       	call   1011b0 <serial_putc_sub>
}
  101246:	90                   	nop
  101247:	c9                   	leave  
  101248:	c3                   	ret    

00101249 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101249:	55                   	push   %ebp
  10124a:	89 e5                	mov    %esp,%ebp
  10124c:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  10124f:	eb 33                	jmp    101284 <cons_intr+0x3b>
        if (c != 0) {
  101251:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101255:	74 2d                	je     101284 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101257:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10125c:	8d 50 01             	lea    0x1(%eax),%edx
  10125f:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101265:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101268:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10126e:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101273:	3d 00 02 00 00       	cmp    $0x200,%eax
  101278:	75 0a                	jne    101284 <cons_intr+0x3b>
                cons.wpos = 0;
  10127a:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101281:	00 00 00 
    while ((c = (*proc)()) != -1) {
  101284:	8b 45 08             	mov    0x8(%ebp),%eax
  101287:	ff d0                	call   *%eax
  101289:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10128c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101290:	75 bf                	jne    101251 <cons_intr+0x8>
            }
        }
    }
}
  101292:	90                   	nop
  101293:	c9                   	leave  
  101294:	c3                   	ret    

00101295 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101295:	55                   	push   %ebp
  101296:	89 e5                	mov    %esp,%ebp
  101298:	83 ec 10             	sub    $0x10,%esp
  10129b:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012a1:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1012a5:	89 c2                	mov    %eax,%edx
  1012a7:	ec                   	in     (%dx),%al
  1012a8:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012ab:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1012af:	0f b6 c0             	movzbl %al,%eax
  1012b2:	83 e0 01             	and    $0x1,%eax
  1012b5:	85 c0                	test   %eax,%eax
  1012b7:	75 07                	jne    1012c0 <serial_proc_data+0x2b>
        return -1;
  1012b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1012be:	eb 2a                	jmp    1012ea <serial_proc_data+0x55>
  1012c0:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012c6:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1012ca:	89 c2                	mov    %eax,%edx
  1012cc:	ec                   	in     (%dx),%al
  1012cd:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1012d0:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1012d4:	0f b6 c0             	movzbl %al,%eax
  1012d7:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1012da:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1012de:	75 07                	jne    1012e7 <serial_proc_data+0x52>
        c = '\b';
  1012e0:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1012e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1012ea:	c9                   	leave  
  1012eb:	c3                   	ret    

001012ec <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1012ec:	55                   	push   %ebp
  1012ed:	89 e5                	mov    %esp,%ebp
  1012ef:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1012f2:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1012f7:	85 c0                	test   %eax,%eax
  1012f9:	74 0c                	je     101307 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1012fb:	c7 04 24 95 12 10 00 	movl   $0x101295,(%esp)
  101302:	e8 42 ff ff ff       	call   101249 <cons_intr>
    }
}
  101307:	90                   	nop
  101308:	c9                   	leave  
  101309:	c3                   	ret    

0010130a <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  10130a:	55                   	push   %ebp
  10130b:	89 e5                	mov    %esp,%ebp
  10130d:	83 ec 38             	sub    $0x38,%esp
  101310:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101316:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101319:	89 c2                	mov    %eax,%edx
  10131b:	ec                   	in     (%dx),%al
  10131c:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  10131f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101323:	0f b6 c0             	movzbl %al,%eax
  101326:	83 e0 01             	and    $0x1,%eax
  101329:	85 c0                	test   %eax,%eax
  10132b:	75 0a                	jne    101337 <kbd_proc_data+0x2d>
        return -1;
  10132d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101332:	e9 55 01 00 00       	jmp    10148c <kbd_proc_data+0x182>
  101337:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10133d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101340:	89 c2                	mov    %eax,%edx
  101342:	ec                   	in     (%dx),%al
  101343:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101346:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  10134a:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10134d:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101351:	75 17                	jne    10136a <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  101353:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101358:	83 c8 40             	or     $0x40,%eax
  10135b:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101360:	b8 00 00 00 00       	mov    $0x0,%eax
  101365:	e9 22 01 00 00       	jmp    10148c <kbd_proc_data+0x182>
    } else if (data & 0x80) {
  10136a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10136e:	84 c0                	test   %al,%al
  101370:	79 45                	jns    1013b7 <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101372:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101377:	83 e0 40             	and    $0x40,%eax
  10137a:	85 c0                	test   %eax,%eax
  10137c:	75 08                	jne    101386 <kbd_proc_data+0x7c>
  10137e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101382:	24 7f                	and    $0x7f,%al
  101384:	eb 04                	jmp    10138a <kbd_proc_data+0x80>
  101386:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10138a:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10138d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101391:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101398:	0c 40                	or     $0x40,%al
  10139a:	0f b6 c0             	movzbl %al,%eax
  10139d:	f7 d0                	not    %eax
  10139f:	89 c2                	mov    %eax,%edx
  1013a1:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013a6:	21 d0                	and    %edx,%eax
  1013a8:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1013ad:	b8 00 00 00 00       	mov    $0x0,%eax
  1013b2:	e9 d5 00 00 00       	jmp    10148c <kbd_proc_data+0x182>
    } else if (shift & E0ESC) {
  1013b7:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013bc:	83 e0 40             	and    $0x40,%eax
  1013bf:	85 c0                	test   %eax,%eax
  1013c1:	74 11                	je     1013d4 <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1013c3:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1013c7:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013cc:	83 e0 bf             	and    $0xffffffbf,%eax
  1013cf:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  1013d4:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013d8:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1013df:	0f b6 d0             	movzbl %al,%edx
  1013e2:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013e7:	09 d0                	or     %edx,%eax
  1013e9:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1013ee:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013f2:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1013f9:	0f b6 d0             	movzbl %al,%edx
  1013fc:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101401:	31 d0                	xor    %edx,%eax
  101403:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  101408:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10140d:	83 e0 03             	and    $0x3,%eax
  101410:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101417:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10141b:	01 d0                	add    %edx,%eax
  10141d:	0f b6 00             	movzbl (%eax),%eax
  101420:	0f b6 c0             	movzbl %al,%eax
  101423:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101426:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10142b:	83 e0 08             	and    $0x8,%eax
  10142e:	85 c0                	test   %eax,%eax
  101430:	74 22                	je     101454 <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  101432:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101436:	7e 0c                	jle    101444 <kbd_proc_data+0x13a>
  101438:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10143c:	7f 06                	jg     101444 <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  10143e:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101442:	eb 10                	jmp    101454 <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  101444:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101448:	7e 0a                	jle    101454 <kbd_proc_data+0x14a>
  10144a:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10144e:	7f 04                	jg     101454 <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  101450:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101454:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101459:	f7 d0                	not    %eax
  10145b:	83 e0 06             	and    $0x6,%eax
  10145e:	85 c0                	test   %eax,%eax
  101460:	75 27                	jne    101489 <kbd_proc_data+0x17f>
  101462:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101469:	75 1e                	jne    101489 <kbd_proc_data+0x17f>
        cprintf("Rebooting!\n");
  10146b:	c7 04 24 05 35 10 00 	movl   $0x103505,(%esp)
  101472:	e8 e5 ed ff ff       	call   10025c <cprintf>
  101477:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10147d:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101481:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101485:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101488:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101489:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10148c:	c9                   	leave  
  10148d:	c3                   	ret    

0010148e <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10148e:	55                   	push   %ebp
  10148f:	89 e5                	mov    %esp,%ebp
  101491:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101494:	c7 04 24 0a 13 10 00 	movl   $0x10130a,(%esp)
  10149b:	e8 a9 fd ff ff       	call   101249 <cons_intr>
}
  1014a0:	90                   	nop
  1014a1:	c9                   	leave  
  1014a2:	c3                   	ret    

001014a3 <kbd_init>:

static void
kbd_init(void) {
  1014a3:	55                   	push   %ebp
  1014a4:	89 e5                	mov    %esp,%ebp
  1014a6:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  1014a9:	e8 e0 ff ff ff       	call   10148e <kbd_intr>
    pic_enable(IRQ_KBD);
  1014ae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1014b5:	e8 0f 01 00 00       	call   1015c9 <pic_enable>
}
  1014ba:	90                   	nop
  1014bb:	c9                   	leave  
  1014bc:	c3                   	ret    

001014bd <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1014bd:	55                   	push   %ebp
  1014be:	89 e5                	mov    %esp,%ebp
  1014c0:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  1014c3:	e8 83 f8 ff ff       	call   100d4b <cga_init>
    serial_init();
  1014c8:	e8 62 f9 ff ff       	call   100e2f <serial_init>
    kbd_init();
  1014cd:	e8 d1 ff ff ff       	call   1014a3 <kbd_init>
    if (!serial_exists) {
  1014d2:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1014d7:	85 c0                	test   %eax,%eax
  1014d9:	75 0c                	jne    1014e7 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1014db:	c7 04 24 11 35 10 00 	movl   $0x103511,(%esp)
  1014e2:	e8 75 ed ff ff       	call   10025c <cprintf>
    }
}
  1014e7:	90                   	nop
  1014e8:	c9                   	leave  
  1014e9:	c3                   	ret    

001014ea <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1014ea:	55                   	push   %ebp
  1014eb:	89 e5                	mov    %esp,%ebp
  1014ed:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1014f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1014f3:	89 04 24             	mov    %eax,(%esp)
  1014f6:	e8 91 fa ff ff       	call   100f8c <lpt_putc>
    cga_putc(c);
  1014fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1014fe:	89 04 24             	mov    %eax,(%esp)
  101501:	e8 c6 fa ff ff       	call   100fcc <cga_putc>
    serial_putc(c);
  101506:	8b 45 08             	mov    0x8(%ebp),%eax
  101509:	89 04 24             	mov    %eax,(%esp)
  10150c:	e8 f8 fc ff ff       	call   101209 <serial_putc>
}
  101511:	90                   	nop
  101512:	c9                   	leave  
  101513:	c3                   	ret    

00101514 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101514:	55                   	push   %ebp
  101515:	89 e5                	mov    %esp,%ebp
  101517:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  10151a:	e8 cd fd ff ff       	call   1012ec <serial_intr>
    kbd_intr();
  10151f:	e8 6a ff ff ff       	call   10148e <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101524:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  10152a:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10152f:	39 c2                	cmp    %eax,%edx
  101531:	74 36                	je     101569 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  101533:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101538:	8d 50 01             	lea    0x1(%eax),%edx
  10153b:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  101541:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  101548:	0f b6 c0             	movzbl %al,%eax
  10154b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  10154e:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101553:	3d 00 02 00 00       	cmp    $0x200,%eax
  101558:	75 0a                	jne    101564 <cons_getc+0x50>
            cons.rpos = 0;
  10155a:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101561:	00 00 00 
        }
        return c;
  101564:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101567:	eb 05                	jmp    10156e <cons_getc+0x5a>
    }
    return 0;
  101569:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10156e:	c9                   	leave  
  10156f:	c3                   	ret    

00101570 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101570:	55                   	push   %ebp
  101571:	89 e5                	mov    %esp,%ebp
  101573:	83 ec 14             	sub    $0x14,%esp
  101576:	8b 45 08             	mov    0x8(%ebp),%eax
  101579:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10157d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101580:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101586:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  10158b:	85 c0                	test   %eax,%eax
  10158d:	74 37                	je     1015c6 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  10158f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101592:	0f b6 c0             	movzbl %al,%eax
  101595:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  10159b:	88 45 f9             	mov    %al,-0x7(%ebp)
  10159e:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1015a2:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1015a6:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  1015a7:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1015ab:	c1 e8 08             	shr    $0x8,%eax
  1015ae:	0f b7 c0             	movzwl %ax,%eax
  1015b1:	0f b6 c0             	movzbl %al,%eax
  1015b4:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  1015ba:	88 45 fd             	mov    %al,-0x3(%ebp)
  1015bd:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1015c1:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1015c5:	ee                   	out    %al,(%dx)
    }
}
  1015c6:	90                   	nop
  1015c7:	c9                   	leave  
  1015c8:	c3                   	ret    

001015c9 <pic_enable>:

void
pic_enable(unsigned int irq) {
  1015c9:	55                   	push   %ebp
  1015ca:	89 e5                	mov    %esp,%ebp
  1015cc:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1015cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1015d2:	ba 01 00 00 00       	mov    $0x1,%edx
  1015d7:	88 c1                	mov    %al,%cl
  1015d9:	d3 e2                	shl    %cl,%edx
  1015db:	89 d0                	mov    %edx,%eax
  1015dd:	98                   	cwtl   
  1015de:	f7 d0                	not    %eax
  1015e0:	0f bf d0             	movswl %ax,%edx
  1015e3:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1015ea:	98                   	cwtl   
  1015eb:	21 d0                	and    %edx,%eax
  1015ed:	98                   	cwtl   
  1015ee:	0f b7 c0             	movzwl %ax,%eax
  1015f1:	89 04 24             	mov    %eax,(%esp)
  1015f4:	e8 77 ff ff ff       	call   101570 <pic_setmask>
}
  1015f9:	90                   	nop
  1015fa:	c9                   	leave  
  1015fb:	c3                   	ret    

001015fc <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1015fc:	55                   	push   %ebp
  1015fd:	89 e5                	mov    %esp,%ebp
  1015ff:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101602:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  101609:	00 00 00 
  10160c:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  101612:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
  101616:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  10161a:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  10161e:	ee                   	out    %al,(%dx)
  10161f:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  101625:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
  101629:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  10162d:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101631:	ee                   	out    %al,(%dx)
  101632:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101638:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
  10163c:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101640:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101644:	ee                   	out    %al,(%dx)
  101645:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  10164b:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
  10164f:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101653:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101657:	ee                   	out    %al,(%dx)
  101658:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  10165e:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
  101662:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101666:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10166a:	ee                   	out    %al,(%dx)
  10166b:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101671:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
  101675:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101679:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10167d:	ee                   	out    %al,(%dx)
  10167e:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101684:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
  101688:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10168c:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101690:	ee                   	out    %al,(%dx)
  101691:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101697:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
  10169b:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10169f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1016a3:	ee                   	out    %al,(%dx)
  1016a4:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  1016aa:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
  1016ae:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1016b2:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1016b6:	ee                   	out    %al,(%dx)
  1016b7:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  1016bd:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
  1016c1:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1016c5:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1016c9:	ee                   	out    %al,(%dx)
  1016ca:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  1016d0:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
  1016d4:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1016d8:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1016dc:	ee                   	out    %al,(%dx)
  1016dd:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016e3:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
  1016e7:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016eb:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016ef:	ee                   	out    %al,(%dx)
  1016f0:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1016f6:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
  1016fa:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016fe:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101702:	ee                   	out    %al,(%dx)
  101703:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  101709:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
  10170d:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101711:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101715:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101716:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10171d:	3d ff ff 00 00       	cmp    $0xffff,%eax
  101722:	74 0f                	je     101733 <pic_init+0x137>
        pic_setmask(irq_mask);
  101724:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10172b:	89 04 24             	mov    %eax,(%esp)
  10172e:	e8 3d fe ff ff       	call   101570 <pic_setmask>
    }
}
  101733:	90                   	nop
  101734:	c9                   	leave  
  101735:	c3                   	ret    

00101736 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101736:	55                   	push   %ebp
  101737:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101739:	fb                   	sti    
    sti();
}
  10173a:	90                   	nop
  10173b:	5d                   	pop    %ebp
  10173c:	c3                   	ret    

0010173d <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  10173d:	55                   	push   %ebp
  10173e:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101740:	fa                   	cli    
    cli();
}
  101741:	90                   	nop
  101742:	5d                   	pop    %ebp
  101743:	c3                   	ret    

00101744 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101744:	55                   	push   %ebp
  101745:	89 e5                	mov    %esp,%ebp
  101747:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10174a:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101751:	00 
  101752:	c7 04 24 40 35 10 00 	movl   $0x103540,(%esp)
  101759:	e8 fe ea ff ff       	call   10025c <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  10175e:	90                   	nop
  10175f:	c9                   	leave  
  101760:	c3                   	ret    

00101761 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101761:	55                   	push   %ebp
  101762:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  101764:	90                   	nop
  101765:	5d                   	pop    %ebp
  101766:	c3                   	ret    

00101767 <trapname>:

static const char *
trapname(int trapno) {
  101767:	55                   	push   %ebp
  101768:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  10176a:	8b 45 08             	mov    0x8(%ebp),%eax
  10176d:	83 f8 13             	cmp    $0x13,%eax
  101770:	77 0c                	ja     10177e <trapname+0x17>
        return excnames[trapno];
  101772:	8b 45 08             	mov    0x8(%ebp),%eax
  101775:	8b 04 85 a0 38 10 00 	mov    0x1038a0(,%eax,4),%eax
  10177c:	eb 18                	jmp    101796 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  10177e:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101782:	7e 0d                	jle    101791 <trapname+0x2a>
  101784:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101788:	7f 07                	jg     101791 <trapname+0x2a>
        return "Hardware Interrupt";
  10178a:	b8 4a 35 10 00       	mov    $0x10354a,%eax
  10178f:	eb 05                	jmp    101796 <trapname+0x2f>
    }
    return "(unknown trap)";
  101791:	b8 5d 35 10 00       	mov    $0x10355d,%eax
}
  101796:	5d                   	pop    %ebp
  101797:	c3                   	ret    

00101798 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101798:	55                   	push   %ebp
  101799:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  10179b:	8b 45 08             	mov    0x8(%ebp),%eax
  10179e:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1017a2:	83 f8 08             	cmp    $0x8,%eax
  1017a5:	0f 94 c0             	sete   %al
  1017a8:	0f b6 c0             	movzbl %al,%eax
}
  1017ab:	5d                   	pop    %ebp
  1017ac:	c3                   	ret    

001017ad <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1017ad:	55                   	push   %ebp
  1017ae:	89 e5                	mov    %esp,%ebp
  1017b0:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1017b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1017b6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1017ba:	c7 04 24 9e 35 10 00 	movl   $0x10359e,(%esp)
  1017c1:	e8 96 ea ff ff       	call   10025c <cprintf>
    print_regs(&tf->tf_regs);
  1017c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1017c9:	89 04 24             	mov    %eax,(%esp)
  1017cc:	e8 8f 01 00 00       	call   101960 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1017d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1017d4:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1017d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1017dc:	c7 04 24 af 35 10 00 	movl   $0x1035af,(%esp)
  1017e3:	e8 74 ea ff ff       	call   10025c <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1017e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1017eb:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1017ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1017f3:	c7 04 24 c2 35 10 00 	movl   $0x1035c2,(%esp)
  1017fa:	e8 5d ea ff ff       	call   10025c <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1017ff:	8b 45 08             	mov    0x8(%ebp),%eax
  101802:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101806:	89 44 24 04          	mov    %eax,0x4(%esp)
  10180a:	c7 04 24 d5 35 10 00 	movl   $0x1035d5,(%esp)
  101811:	e8 46 ea ff ff       	call   10025c <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101816:	8b 45 08             	mov    0x8(%ebp),%eax
  101819:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  10181d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101821:	c7 04 24 e8 35 10 00 	movl   $0x1035e8,(%esp)
  101828:	e8 2f ea ff ff       	call   10025c <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  10182d:	8b 45 08             	mov    0x8(%ebp),%eax
  101830:	8b 40 30             	mov    0x30(%eax),%eax
  101833:	89 04 24             	mov    %eax,(%esp)
  101836:	e8 2c ff ff ff       	call   101767 <trapname>
  10183b:	89 c2                	mov    %eax,%edx
  10183d:	8b 45 08             	mov    0x8(%ebp),%eax
  101840:	8b 40 30             	mov    0x30(%eax),%eax
  101843:	89 54 24 08          	mov    %edx,0x8(%esp)
  101847:	89 44 24 04          	mov    %eax,0x4(%esp)
  10184b:	c7 04 24 fb 35 10 00 	movl   $0x1035fb,(%esp)
  101852:	e8 05 ea ff ff       	call   10025c <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101857:	8b 45 08             	mov    0x8(%ebp),%eax
  10185a:	8b 40 34             	mov    0x34(%eax),%eax
  10185d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101861:	c7 04 24 0d 36 10 00 	movl   $0x10360d,(%esp)
  101868:	e8 ef e9 ff ff       	call   10025c <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  10186d:	8b 45 08             	mov    0x8(%ebp),%eax
  101870:	8b 40 38             	mov    0x38(%eax),%eax
  101873:	89 44 24 04          	mov    %eax,0x4(%esp)
  101877:	c7 04 24 1c 36 10 00 	movl   $0x10361c,(%esp)
  10187e:	e8 d9 e9 ff ff       	call   10025c <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101883:	8b 45 08             	mov    0x8(%ebp),%eax
  101886:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10188a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10188e:	c7 04 24 2b 36 10 00 	movl   $0x10362b,(%esp)
  101895:	e8 c2 e9 ff ff       	call   10025c <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  10189a:	8b 45 08             	mov    0x8(%ebp),%eax
  10189d:	8b 40 40             	mov    0x40(%eax),%eax
  1018a0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018a4:	c7 04 24 3e 36 10 00 	movl   $0x10363e,(%esp)
  1018ab:	e8 ac e9 ff ff       	call   10025c <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  1018b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1018b7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  1018be:	eb 3d                	jmp    1018fd <print_trapframe+0x150>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  1018c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1018c3:	8b 50 40             	mov    0x40(%eax),%edx
  1018c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1018c9:	21 d0                	and    %edx,%eax
  1018cb:	85 c0                	test   %eax,%eax
  1018cd:	74 28                	je     1018f7 <print_trapframe+0x14a>
  1018cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018d2:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  1018d9:	85 c0                	test   %eax,%eax
  1018db:	74 1a                	je     1018f7 <print_trapframe+0x14a>
            cprintf("%s,", IA32flags[i]);
  1018dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018e0:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  1018e7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018eb:	c7 04 24 4d 36 10 00 	movl   $0x10364d,(%esp)
  1018f2:	e8 65 e9 ff ff       	call   10025c <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  1018f7:	ff 45 f4             	incl   -0xc(%ebp)
  1018fa:	d1 65 f0             	shll   -0x10(%ebp)
  1018fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101900:	83 f8 17             	cmp    $0x17,%eax
  101903:	76 bb                	jbe    1018c0 <print_trapframe+0x113>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101905:	8b 45 08             	mov    0x8(%ebp),%eax
  101908:	8b 40 40             	mov    0x40(%eax),%eax
  10190b:	c1 e8 0c             	shr    $0xc,%eax
  10190e:	83 e0 03             	and    $0x3,%eax
  101911:	89 44 24 04          	mov    %eax,0x4(%esp)
  101915:	c7 04 24 51 36 10 00 	movl   $0x103651,(%esp)
  10191c:	e8 3b e9 ff ff       	call   10025c <cprintf>

    if (!trap_in_kernel(tf)) {
  101921:	8b 45 08             	mov    0x8(%ebp),%eax
  101924:	89 04 24             	mov    %eax,(%esp)
  101927:	e8 6c fe ff ff       	call   101798 <trap_in_kernel>
  10192c:	85 c0                	test   %eax,%eax
  10192e:	75 2d                	jne    10195d <print_trapframe+0x1b0>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101930:	8b 45 08             	mov    0x8(%ebp),%eax
  101933:	8b 40 44             	mov    0x44(%eax),%eax
  101936:	89 44 24 04          	mov    %eax,0x4(%esp)
  10193a:	c7 04 24 5a 36 10 00 	movl   $0x10365a,(%esp)
  101941:	e8 16 e9 ff ff       	call   10025c <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101946:	8b 45 08             	mov    0x8(%ebp),%eax
  101949:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  10194d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101951:	c7 04 24 69 36 10 00 	movl   $0x103669,(%esp)
  101958:	e8 ff e8 ff ff       	call   10025c <cprintf>
    }
}
  10195d:	90                   	nop
  10195e:	c9                   	leave  
  10195f:	c3                   	ret    

00101960 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101960:	55                   	push   %ebp
  101961:	89 e5                	mov    %esp,%ebp
  101963:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101966:	8b 45 08             	mov    0x8(%ebp),%eax
  101969:	8b 00                	mov    (%eax),%eax
  10196b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10196f:	c7 04 24 7c 36 10 00 	movl   $0x10367c,(%esp)
  101976:	e8 e1 e8 ff ff       	call   10025c <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  10197b:	8b 45 08             	mov    0x8(%ebp),%eax
  10197e:	8b 40 04             	mov    0x4(%eax),%eax
  101981:	89 44 24 04          	mov    %eax,0x4(%esp)
  101985:	c7 04 24 8b 36 10 00 	movl   $0x10368b,(%esp)
  10198c:	e8 cb e8 ff ff       	call   10025c <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101991:	8b 45 08             	mov    0x8(%ebp),%eax
  101994:	8b 40 08             	mov    0x8(%eax),%eax
  101997:	89 44 24 04          	mov    %eax,0x4(%esp)
  10199b:	c7 04 24 9a 36 10 00 	movl   $0x10369a,(%esp)
  1019a2:	e8 b5 e8 ff ff       	call   10025c <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  1019a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1019aa:	8b 40 0c             	mov    0xc(%eax),%eax
  1019ad:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019b1:	c7 04 24 a9 36 10 00 	movl   $0x1036a9,(%esp)
  1019b8:	e8 9f e8 ff ff       	call   10025c <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  1019bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1019c0:	8b 40 10             	mov    0x10(%eax),%eax
  1019c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019c7:	c7 04 24 b8 36 10 00 	movl   $0x1036b8,(%esp)
  1019ce:	e8 89 e8 ff ff       	call   10025c <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  1019d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d6:	8b 40 14             	mov    0x14(%eax),%eax
  1019d9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019dd:	c7 04 24 c7 36 10 00 	movl   $0x1036c7,(%esp)
  1019e4:	e8 73 e8 ff ff       	call   10025c <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  1019e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ec:	8b 40 18             	mov    0x18(%eax),%eax
  1019ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019f3:	c7 04 24 d6 36 10 00 	movl   $0x1036d6,(%esp)
  1019fa:	e8 5d e8 ff ff       	call   10025c <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  1019ff:	8b 45 08             	mov    0x8(%ebp),%eax
  101a02:	8b 40 1c             	mov    0x1c(%eax),%eax
  101a05:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a09:	c7 04 24 e5 36 10 00 	movl   $0x1036e5,(%esp)
  101a10:	e8 47 e8 ff ff       	call   10025c <cprintf>
}
  101a15:	90                   	nop
  101a16:	c9                   	leave  
  101a17:	c3                   	ret    

00101a18 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101a18:	55                   	push   %ebp
  101a19:	89 e5                	mov    %esp,%ebp
  101a1b:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101a1e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a21:	8b 40 30             	mov    0x30(%eax),%eax
  101a24:	83 f8 2f             	cmp    $0x2f,%eax
  101a27:	77 1e                	ja     101a47 <trap_dispatch+0x2f>
  101a29:	83 f8 2e             	cmp    $0x2e,%eax
  101a2c:	0f 83 bc 00 00 00    	jae    101aee <trap_dispatch+0xd6>
  101a32:	83 f8 21             	cmp    $0x21,%eax
  101a35:	74 40                	je     101a77 <trap_dispatch+0x5f>
  101a37:	83 f8 24             	cmp    $0x24,%eax
  101a3a:	74 15                	je     101a51 <trap_dispatch+0x39>
  101a3c:	83 f8 20             	cmp    $0x20,%eax
  101a3f:	0f 84 ac 00 00 00    	je     101af1 <trap_dispatch+0xd9>
  101a45:	eb 72                	jmp    101ab9 <trap_dispatch+0xa1>
  101a47:	83 e8 78             	sub    $0x78,%eax
  101a4a:	83 f8 01             	cmp    $0x1,%eax
  101a4d:	77 6a                	ja     101ab9 <trap_dispatch+0xa1>
  101a4f:	eb 4c                	jmp    101a9d <trap_dispatch+0x85>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101a51:	e8 be fa ff ff       	call   101514 <cons_getc>
  101a56:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101a59:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101a5d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101a61:	89 54 24 08          	mov    %edx,0x8(%esp)
  101a65:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a69:	c7 04 24 f4 36 10 00 	movl   $0x1036f4,(%esp)
  101a70:	e8 e7 e7 ff ff       	call   10025c <cprintf>
        break;
  101a75:	eb 7b                	jmp    101af2 <trap_dispatch+0xda>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101a77:	e8 98 fa ff ff       	call   101514 <cons_getc>
  101a7c:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101a7f:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101a83:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101a87:	89 54 24 08          	mov    %edx,0x8(%esp)
  101a8b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a8f:	c7 04 24 06 37 10 00 	movl   $0x103706,(%esp)
  101a96:	e8 c1 e7 ff ff       	call   10025c <cprintf>
        break;
  101a9b:	eb 55                	jmp    101af2 <trap_dispatch+0xda>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101a9d:	c7 44 24 08 15 37 10 	movl   $0x103715,0x8(%esp)
  101aa4:	00 
  101aa5:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101aac:	00 
  101aad:	c7 04 24 25 37 10 00 	movl   $0x103725,(%esp)
  101ab4:	e8 fa e8 ff ff       	call   1003b3 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101ab9:	8b 45 08             	mov    0x8(%ebp),%eax
  101abc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ac0:	83 e0 03             	and    $0x3,%eax
  101ac3:	85 c0                	test   %eax,%eax
  101ac5:	75 2b                	jne    101af2 <trap_dispatch+0xda>
            print_trapframe(tf);
  101ac7:	8b 45 08             	mov    0x8(%ebp),%eax
  101aca:	89 04 24             	mov    %eax,(%esp)
  101acd:	e8 db fc ff ff       	call   1017ad <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101ad2:	c7 44 24 08 36 37 10 	movl   $0x103736,0x8(%esp)
  101ad9:	00 
  101ada:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101ae1:	00 
  101ae2:	c7 04 24 25 37 10 00 	movl   $0x103725,(%esp)
  101ae9:	e8 c5 e8 ff ff       	call   1003b3 <__panic>
        break;
  101aee:	90                   	nop
  101aef:	eb 01                	jmp    101af2 <trap_dispatch+0xda>
        break;
  101af1:	90                   	nop
        }
    }
}
  101af2:	90                   	nop
  101af3:	c9                   	leave  
  101af4:	c3                   	ret    

00101af5 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101af5:	55                   	push   %ebp
  101af6:	89 e5                	mov    %esp,%ebp
  101af8:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101afb:	8b 45 08             	mov    0x8(%ebp),%eax
  101afe:	89 04 24             	mov    %eax,(%esp)
  101b01:	e8 12 ff ff ff       	call   101a18 <trap_dispatch>
}
  101b06:	90                   	nop
  101b07:	c9                   	leave  
  101b08:	c3                   	ret    

00101b09 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101b09:	6a 00                	push   $0x0
  pushl $0
  101b0b:	6a 00                	push   $0x0
  jmp __alltraps
  101b0d:	e9 69 0a 00 00       	jmp    10257b <__alltraps>

00101b12 <vector1>:
.globl vector1
vector1:
  pushl $0
  101b12:	6a 00                	push   $0x0
  pushl $1
  101b14:	6a 01                	push   $0x1
  jmp __alltraps
  101b16:	e9 60 0a 00 00       	jmp    10257b <__alltraps>

00101b1b <vector2>:
.globl vector2
vector2:
  pushl $0
  101b1b:	6a 00                	push   $0x0
  pushl $2
  101b1d:	6a 02                	push   $0x2
  jmp __alltraps
  101b1f:	e9 57 0a 00 00       	jmp    10257b <__alltraps>

00101b24 <vector3>:
.globl vector3
vector3:
  pushl $0
  101b24:	6a 00                	push   $0x0
  pushl $3
  101b26:	6a 03                	push   $0x3
  jmp __alltraps
  101b28:	e9 4e 0a 00 00       	jmp    10257b <__alltraps>

00101b2d <vector4>:
.globl vector4
vector4:
  pushl $0
  101b2d:	6a 00                	push   $0x0
  pushl $4
  101b2f:	6a 04                	push   $0x4
  jmp __alltraps
  101b31:	e9 45 0a 00 00       	jmp    10257b <__alltraps>

00101b36 <vector5>:
.globl vector5
vector5:
  pushl $0
  101b36:	6a 00                	push   $0x0
  pushl $5
  101b38:	6a 05                	push   $0x5
  jmp __alltraps
  101b3a:	e9 3c 0a 00 00       	jmp    10257b <__alltraps>

00101b3f <vector6>:
.globl vector6
vector6:
  pushl $0
  101b3f:	6a 00                	push   $0x0
  pushl $6
  101b41:	6a 06                	push   $0x6
  jmp __alltraps
  101b43:	e9 33 0a 00 00       	jmp    10257b <__alltraps>

00101b48 <vector7>:
.globl vector7
vector7:
  pushl $0
  101b48:	6a 00                	push   $0x0
  pushl $7
  101b4a:	6a 07                	push   $0x7
  jmp __alltraps
  101b4c:	e9 2a 0a 00 00       	jmp    10257b <__alltraps>

00101b51 <vector8>:
.globl vector8
vector8:
  pushl $8
  101b51:	6a 08                	push   $0x8
  jmp __alltraps
  101b53:	e9 23 0a 00 00       	jmp    10257b <__alltraps>

00101b58 <vector9>:
.globl vector9
vector9:
  pushl $0
  101b58:	6a 00                	push   $0x0
  pushl $9
  101b5a:	6a 09                	push   $0x9
  jmp __alltraps
  101b5c:	e9 1a 0a 00 00       	jmp    10257b <__alltraps>

00101b61 <vector10>:
.globl vector10
vector10:
  pushl $10
  101b61:	6a 0a                	push   $0xa
  jmp __alltraps
  101b63:	e9 13 0a 00 00       	jmp    10257b <__alltraps>

00101b68 <vector11>:
.globl vector11
vector11:
  pushl $11
  101b68:	6a 0b                	push   $0xb
  jmp __alltraps
  101b6a:	e9 0c 0a 00 00       	jmp    10257b <__alltraps>

00101b6f <vector12>:
.globl vector12
vector12:
  pushl $12
  101b6f:	6a 0c                	push   $0xc
  jmp __alltraps
  101b71:	e9 05 0a 00 00       	jmp    10257b <__alltraps>

00101b76 <vector13>:
.globl vector13
vector13:
  pushl $13
  101b76:	6a 0d                	push   $0xd
  jmp __alltraps
  101b78:	e9 fe 09 00 00       	jmp    10257b <__alltraps>

00101b7d <vector14>:
.globl vector14
vector14:
  pushl $14
  101b7d:	6a 0e                	push   $0xe
  jmp __alltraps
  101b7f:	e9 f7 09 00 00       	jmp    10257b <__alltraps>

00101b84 <vector15>:
.globl vector15
vector15:
  pushl $0
  101b84:	6a 00                	push   $0x0
  pushl $15
  101b86:	6a 0f                	push   $0xf
  jmp __alltraps
  101b88:	e9 ee 09 00 00       	jmp    10257b <__alltraps>

00101b8d <vector16>:
.globl vector16
vector16:
  pushl $0
  101b8d:	6a 00                	push   $0x0
  pushl $16
  101b8f:	6a 10                	push   $0x10
  jmp __alltraps
  101b91:	e9 e5 09 00 00       	jmp    10257b <__alltraps>

00101b96 <vector17>:
.globl vector17
vector17:
  pushl $17
  101b96:	6a 11                	push   $0x11
  jmp __alltraps
  101b98:	e9 de 09 00 00       	jmp    10257b <__alltraps>

00101b9d <vector18>:
.globl vector18
vector18:
  pushl $0
  101b9d:	6a 00                	push   $0x0
  pushl $18
  101b9f:	6a 12                	push   $0x12
  jmp __alltraps
  101ba1:	e9 d5 09 00 00       	jmp    10257b <__alltraps>

00101ba6 <vector19>:
.globl vector19
vector19:
  pushl $0
  101ba6:	6a 00                	push   $0x0
  pushl $19
  101ba8:	6a 13                	push   $0x13
  jmp __alltraps
  101baa:	e9 cc 09 00 00       	jmp    10257b <__alltraps>

00101baf <vector20>:
.globl vector20
vector20:
  pushl $0
  101baf:	6a 00                	push   $0x0
  pushl $20
  101bb1:	6a 14                	push   $0x14
  jmp __alltraps
  101bb3:	e9 c3 09 00 00       	jmp    10257b <__alltraps>

00101bb8 <vector21>:
.globl vector21
vector21:
  pushl $0
  101bb8:	6a 00                	push   $0x0
  pushl $21
  101bba:	6a 15                	push   $0x15
  jmp __alltraps
  101bbc:	e9 ba 09 00 00       	jmp    10257b <__alltraps>

00101bc1 <vector22>:
.globl vector22
vector22:
  pushl $0
  101bc1:	6a 00                	push   $0x0
  pushl $22
  101bc3:	6a 16                	push   $0x16
  jmp __alltraps
  101bc5:	e9 b1 09 00 00       	jmp    10257b <__alltraps>

00101bca <vector23>:
.globl vector23
vector23:
  pushl $0
  101bca:	6a 00                	push   $0x0
  pushl $23
  101bcc:	6a 17                	push   $0x17
  jmp __alltraps
  101bce:	e9 a8 09 00 00       	jmp    10257b <__alltraps>

00101bd3 <vector24>:
.globl vector24
vector24:
  pushl $0
  101bd3:	6a 00                	push   $0x0
  pushl $24
  101bd5:	6a 18                	push   $0x18
  jmp __alltraps
  101bd7:	e9 9f 09 00 00       	jmp    10257b <__alltraps>

00101bdc <vector25>:
.globl vector25
vector25:
  pushl $0
  101bdc:	6a 00                	push   $0x0
  pushl $25
  101bde:	6a 19                	push   $0x19
  jmp __alltraps
  101be0:	e9 96 09 00 00       	jmp    10257b <__alltraps>

00101be5 <vector26>:
.globl vector26
vector26:
  pushl $0
  101be5:	6a 00                	push   $0x0
  pushl $26
  101be7:	6a 1a                	push   $0x1a
  jmp __alltraps
  101be9:	e9 8d 09 00 00       	jmp    10257b <__alltraps>

00101bee <vector27>:
.globl vector27
vector27:
  pushl $0
  101bee:	6a 00                	push   $0x0
  pushl $27
  101bf0:	6a 1b                	push   $0x1b
  jmp __alltraps
  101bf2:	e9 84 09 00 00       	jmp    10257b <__alltraps>

00101bf7 <vector28>:
.globl vector28
vector28:
  pushl $0
  101bf7:	6a 00                	push   $0x0
  pushl $28
  101bf9:	6a 1c                	push   $0x1c
  jmp __alltraps
  101bfb:	e9 7b 09 00 00       	jmp    10257b <__alltraps>

00101c00 <vector29>:
.globl vector29
vector29:
  pushl $0
  101c00:	6a 00                	push   $0x0
  pushl $29
  101c02:	6a 1d                	push   $0x1d
  jmp __alltraps
  101c04:	e9 72 09 00 00       	jmp    10257b <__alltraps>

00101c09 <vector30>:
.globl vector30
vector30:
  pushl $0
  101c09:	6a 00                	push   $0x0
  pushl $30
  101c0b:	6a 1e                	push   $0x1e
  jmp __alltraps
  101c0d:	e9 69 09 00 00       	jmp    10257b <__alltraps>

00101c12 <vector31>:
.globl vector31
vector31:
  pushl $0
  101c12:	6a 00                	push   $0x0
  pushl $31
  101c14:	6a 1f                	push   $0x1f
  jmp __alltraps
  101c16:	e9 60 09 00 00       	jmp    10257b <__alltraps>

00101c1b <vector32>:
.globl vector32
vector32:
  pushl $0
  101c1b:	6a 00                	push   $0x0
  pushl $32
  101c1d:	6a 20                	push   $0x20
  jmp __alltraps
  101c1f:	e9 57 09 00 00       	jmp    10257b <__alltraps>

00101c24 <vector33>:
.globl vector33
vector33:
  pushl $0
  101c24:	6a 00                	push   $0x0
  pushl $33
  101c26:	6a 21                	push   $0x21
  jmp __alltraps
  101c28:	e9 4e 09 00 00       	jmp    10257b <__alltraps>

00101c2d <vector34>:
.globl vector34
vector34:
  pushl $0
  101c2d:	6a 00                	push   $0x0
  pushl $34
  101c2f:	6a 22                	push   $0x22
  jmp __alltraps
  101c31:	e9 45 09 00 00       	jmp    10257b <__alltraps>

00101c36 <vector35>:
.globl vector35
vector35:
  pushl $0
  101c36:	6a 00                	push   $0x0
  pushl $35
  101c38:	6a 23                	push   $0x23
  jmp __alltraps
  101c3a:	e9 3c 09 00 00       	jmp    10257b <__alltraps>

00101c3f <vector36>:
.globl vector36
vector36:
  pushl $0
  101c3f:	6a 00                	push   $0x0
  pushl $36
  101c41:	6a 24                	push   $0x24
  jmp __alltraps
  101c43:	e9 33 09 00 00       	jmp    10257b <__alltraps>

00101c48 <vector37>:
.globl vector37
vector37:
  pushl $0
  101c48:	6a 00                	push   $0x0
  pushl $37
  101c4a:	6a 25                	push   $0x25
  jmp __alltraps
  101c4c:	e9 2a 09 00 00       	jmp    10257b <__alltraps>

00101c51 <vector38>:
.globl vector38
vector38:
  pushl $0
  101c51:	6a 00                	push   $0x0
  pushl $38
  101c53:	6a 26                	push   $0x26
  jmp __alltraps
  101c55:	e9 21 09 00 00       	jmp    10257b <__alltraps>

00101c5a <vector39>:
.globl vector39
vector39:
  pushl $0
  101c5a:	6a 00                	push   $0x0
  pushl $39
  101c5c:	6a 27                	push   $0x27
  jmp __alltraps
  101c5e:	e9 18 09 00 00       	jmp    10257b <__alltraps>

00101c63 <vector40>:
.globl vector40
vector40:
  pushl $0
  101c63:	6a 00                	push   $0x0
  pushl $40
  101c65:	6a 28                	push   $0x28
  jmp __alltraps
  101c67:	e9 0f 09 00 00       	jmp    10257b <__alltraps>

00101c6c <vector41>:
.globl vector41
vector41:
  pushl $0
  101c6c:	6a 00                	push   $0x0
  pushl $41
  101c6e:	6a 29                	push   $0x29
  jmp __alltraps
  101c70:	e9 06 09 00 00       	jmp    10257b <__alltraps>

00101c75 <vector42>:
.globl vector42
vector42:
  pushl $0
  101c75:	6a 00                	push   $0x0
  pushl $42
  101c77:	6a 2a                	push   $0x2a
  jmp __alltraps
  101c79:	e9 fd 08 00 00       	jmp    10257b <__alltraps>

00101c7e <vector43>:
.globl vector43
vector43:
  pushl $0
  101c7e:	6a 00                	push   $0x0
  pushl $43
  101c80:	6a 2b                	push   $0x2b
  jmp __alltraps
  101c82:	e9 f4 08 00 00       	jmp    10257b <__alltraps>

00101c87 <vector44>:
.globl vector44
vector44:
  pushl $0
  101c87:	6a 00                	push   $0x0
  pushl $44
  101c89:	6a 2c                	push   $0x2c
  jmp __alltraps
  101c8b:	e9 eb 08 00 00       	jmp    10257b <__alltraps>

00101c90 <vector45>:
.globl vector45
vector45:
  pushl $0
  101c90:	6a 00                	push   $0x0
  pushl $45
  101c92:	6a 2d                	push   $0x2d
  jmp __alltraps
  101c94:	e9 e2 08 00 00       	jmp    10257b <__alltraps>

00101c99 <vector46>:
.globl vector46
vector46:
  pushl $0
  101c99:	6a 00                	push   $0x0
  pushl $46
  101c9b:	6a 2e                	push   $0x2e
  jmp __alltraps
  101c9d:	e9 d9 08 00 00       	jmp    10257b <__alltraps>

00101ca2 <vector47>:
.globl vector47
vector47:
  pushl $0
  101ca2:	6a 00                	push   $0x0
  pushl $47
  101ca4:	6a 2f                	push   $0x2f
  jmp __alltraps
  101ca6:	e9 d0 08 00 00       	jmp    10257b <__alltraps>

00101cab <vector48>:
.globl vector48
vector48:
  pushl $0
  101cab:	6a 00                	push   $0x0
  pushl $48
  101cad:	6a 30                	push   $0x30
  jmp __alltraps
  101caf:	e9 c7 08 00 00       	jmp    10257b <__alltraps>

00101cb4 <vector49>:
.globl vector49
vector49:
  pushl $0
  101cb4:	6a 00                	push   $0x0
  pushl $49
  101cb6:	6a 31                	push   $0x31
  jmp __alltraps
  101cb8:	e9 be 08 00 00       	jmp    10257b <__alltraps>

00101cbd <vector50>:
.globl vector50
vector50:
  pushl $0
  101cbd:	6a 00                	push   $0x0
  pushl $50
  101cbf:	6a 32                	push   $0x32
  jmp __alltraps
  101cc1:	e9 b5 08 00 00       	jmp    10257b <__alltraps>

00101cc6 <vector51>:
.globl vector51
vector51:
  pushl $0
  101cc6:	6a 00                	push   $0x0
  pushl $51
  101cc8:	6a 33                	push   $0x33
  jmp __alltraps
  101cca:	e9 ac 08 00 00       	jmp    10257b <__alltraps>

00101ccf <vector52>:
.globl vector52
vector52:
  pushl $0
  101ccf:	6a 00                	push   $0x0
  pushl $52
  101cd1:	6a 34                	push   $0x34
  jmp __alltraps
  101cd3:	e9 a3 08 00 00       	jmp    10257b <__alltraps>

00101cd8 <vector53>:
.globl vector53
vector53:
  pushl $0
  101cd8:	6a 00                	push   $0x0
  pushl $53
  101cda:	6a 35                	push   $0x35
  jmp __alltraps
  101cdc:	e9 9a 08 00 00       	jmp    10257b <__alltraps>

00101ce1 <vector54>:
.globl vector54
vector54:
  pushl $0
  101ce1:	6a 00                	push   $0x0
  pushl $54
  101ce3:	6a 36                	push   $0x36
  jmp __alltraps
  101ce5:	e9 91 08 00 00       	jmp    10257b <__alltraps>

00101cea <vector55>:
.globl vector55
vector55:
  pushl $0
  101cea:	6a 00                	push   $0x0
  pushl $55
  101cec:	6a 37                	push   $0x37
  jmp __alltraps
  101cee:	e9 88 08 00 00       	jmp    10257b <__alltraps>

00101cf3 <vector56>:
.globl vector56
vector56:
  pushl $0
  101cf3:	6a 00                	push   $0x0
  pushl $56
  101cf5:	6a 38                	push   $0x38
  jmp __alltraps
  101cf7:	e9 7f 08 00 00       	jmp    10257b <__alltraps>

00101cfc <vector57>:
.globl vector57
vector57:
  pushl $0
  101cfc:	6a 00                	push   $0x0
  pushl $57
  101cfe:	6a 39                	push   $0x39
  jmp __alltraps
  101d00:	e9 76 08 00 00       	jmp    10257b <__alltraps>

00101d05 <vector58>:
.globl vector58
vector58:
  pushl $0
  101d05:	6a 00                	push   $0x0
  pushl $58
  101d07:	6a 3a                	push   $0x3a
  jmp __alltraps
  101d09:	e9 6d 08 00 00       	jmp    10257b <__alltraps>

00101d0e <vector59>:
.globl vector59
vector59:
  pushl $0
  101d0e:	6a 00                	push   $0x0
  pushl $59
  101d10:	6a 3b                	push   $0x3b
  jmp __alltraps
  101d12:	e9 64 08 00 00       	jmp    10257b <__alltraps>

00101d17 <vector60>:
.globl vector60
vector60:
  pushl $0
  101d17:	6a 00                	push   $0x0
  pushl $60
  101d19:	6a 3c                	push   $0x3c
  jmp __alltraps
  101d1b:	e9 5b 08 00 00       	jmp    10257b <__alltraps>

00101d20 <vector61>:
.globl vector61
vector61:
  pushl $0
  101d20:	6a 00                	push   $0x0
  pushl $61
  101d22:	6a 3d                	push   $0x3d
  jmp __alltraps
  101d24:	e9 52 08 00 00       	jmp    10257b <__alltraps>

00101d29 <vector62>:
.globl vector62
vector62:
  pushl $0
  101d29:	6a 00                	push   $0x0
  pushl $62
  101d2b:	6a 3e                	push   $0x3e
  jmp __alltraps
  101d2d:	e9 49 08 00 00       	jmp    10257b <__alltraps>

00101d32 <vector63>:
.globl vector63
vector63:
  pushl $0
  101d32:	6a 00                	push   $0x0
  pushl $63
  101d34:	6a 3f                	push   $0x3f
  jmp __alltraps
  101d36:	e9 40 08 00 00       	jmp    10257b <__alltraps>

00101d3b <vector64>:
.globl vector64
vector64:
  pushl $0
  101d3b:	6a 00                	push   $0x0
  pushl $64
  101d3d:	6a 40                	push   $0x40
  jmp __alltraps
  101d3f:	e9 37 08 00 00       	jmp    10257b <__alltraps>

00101d44 <vector65>:
.globl vector65
vector65:
  pushl $0
  101d44:	6a 00                	push   $0x0
  pushl $65
  101d46:	6a 41                	push   $0x41
  jmp __alltraps
  101d48:	e9 2e 08 00 00       	jmp    10257b <__alltraps>

00101d4d <vector66>:
.globl vector66
vector66:
  pushl $0
  101d4d:	6a 00                	push   $0x0
  pushl $66
  101d4f:	6a 42                	push   $0x42
  jmp __alltraps
  101d51:	e9 25 08 00 00       	jmp    10257b <__alltraps>

00101d56 <vector67>:
.globl vector67
vector67:
  pushl $0
  101d56:	6a 00                	push   $0x0
  pushl $67
  101d58:	6a 43                	push   $0x43
  jmp __alltraps
  101d5a:	e9 1c 08 00 00       	jmp    10257b <__alltraps>

00101d5f <vector68>:
.globl vector68
vector68:
  pushl $0
  101d5f:	6a 00                	push   $0x0
  pushl $68
  101d61:	6a 44                	push   $0x44
  jmp __alltraps
  101d63:	e9 13 08 00 00       	jmp    10257b <__alltraps>

00101d68 <vector69>:
.globl vector69
vector69:
  pushl $0
  101d68:	6a 00                	push   $0x0
  pushl $69
  101d6a:	6a 45                	push   $0x45
  jmp __alltraps
  101d6c:	e9 0a 08 00 00       	jmp    10257b <__alltraps>

00101d71 <vector70>:
.globl vector70
vector70:
  pushl $0
  101d71:	6a 00                	push   $0x0
  pushl $70
  101d73:	6a 46                	push   $0x46
  jmp __alltraps
  101d75:	e9 01 08 00 00       	jmp    10257b <__alltraps>

00101d7a <vector71>:
.globl vector71
vector71:
  pushl $0
  101d7a:	6a 00                	push   $0x0
  pushl $71
  101d7c:	6a 47                	push   $0x47
  jmp __alltraps
  101d7e:	e9 f8 07 00 00       	jmp    10257b <__alltraps>

00101d83 <vector72>:
.globl vector72
vector72:
  pushl $0
  101d83:	6a 00                	push   $0x0
  pushl $72
  101d85:	6a 48                	push   $0x48
  jmp __alltraps
  101d87:	e9 ef 07 00 00       	jmp    10257b <__alltraps>

00101d8c <vector73>:
.globl vector73
vector73:
  pushl $0
  101d8c:	6a 00                	push   $0x0
  pushl $73
  101d8e:	6a 49                	push   $0x49
  jmp __alltraps
  101d90:	e9 e6 07 00 00       	jmp    10257b <__alltraps>

00101d95 <vector74>:
.globl vector74
vector74:
  pushl $0
  101d95:	6a 00                	push   $0x0
  pushl $74
  101d97:	6a 4a                	push   $0x4a
  jmp __alltraps
  101d99:	e9 dd 07 00 00       	jmp    10257b <__alltraps>

00101d9e <vector75>:
.globl vector75
vector75:
  pushl $0
  101d9e:	6a 00                	push   $0x0
  pushl $75
  101da0:	6a 4b                	push   $0x4b
  jmp __alltraps
  101da2:	e9 d4 07 00 00       	jmp    10257b <__alltraps>

00101da7 <vector76>:
.globl vector76
vector76:
  pushl $0
  101da7:	6a 00                	push   $0x0
  pushl $76
  101da9:	6a 4c                	push   $0x4c
  jmp __alltraps
  101dab:	e9 cb 07 00 00       	jmp    10257b <__alltraps>

00101db0 <vector77>:
.globl vector77
vector77:
  pushl $0
  101db0:	6a 00                	push   $0x0
  pushl $77
  101db2:	6a 4d                	push   $0x4d
  jmp __alltraps
  101db4:	e9 c2 07 00 00       	jmp    10257b <__alltraps>

00101db9 <vector78>:
.globl vector78
vector78:
  pushl $0
  101db9:	6a 00                	push   $0x0
  pushl $78
  101dbb:	6a 4e                	push   $0x4e
  jmp __alltraps
  101dbd:	e9 b9 07 00 00       	jmp    10257b <__alltraps>

00101dc2 <vector79>:
.globl vector79
vector79:
  pushl $0
  101dc2:	6a 00                	push   $0x0
  pushl $79
  101dc4:	6a 4f                	push   $0x4f
  jmp __alltraps
  101dc6:	e9 b0 07 00 00       	jmp    10257b <__alltraps>

00101dcb <vector80>:
.globl vector80
vector80:
  pushl $0
  101dcb:	6a 00                	push   $0x0
  pushl $80
  101dcd:	6a 50                	push   $0x50
  jmp __alltraps
  101dcf:	e9 a7 07 00 00       	jmp    10257b <__alltraps>

00101dd4 <vector81>:
.globl vector81
vector81:
  pushl $0
  101dd4:	6a 00                	push   $0x0
  pushl $81
  101dd6:	6a 51                	push   $0x51
  jmp __alltraps
  101dd8:	e9 9e 07 00 00       	jmp    10257b <__alltraps>

00101ddd <vector82>:
.globl vector82
vector82:
  pushl $0
  101ddd:	6a 00                	push   $0x0
  pushl $82
  101ddf:	6a 52                	push   $0x52
  jmp __alltraps
  101de1:	e9 95 07 00 00       	jmp    10257b <__alltraps>

00101de6 <vector83>:
.globl vector83
vector83:
  pushl $0
  101de6:	6a 00                	push   $0x0
  pushl $83
  101de8:	6a 53                	push   $0x53
  jmp __alltraps
  101dea:	e9 8c 07 00 00       	jmp    10257b <__alltraps>

00101def <vector84>:
.globl vector84
vector84:
  pushl $0
  101def:	6a 00                	push   $0x0
  pushl $84
  101df1:	6a 54                	push   $0x54
  jmp __alltraps
  101df3:	e9 83 07 00 00       	jmp    10257b <__alltraps>

00101df8 <vector85>:
.globl vector85
vector85:
  pushl $0
  101df8:	6a 00                	push   $0x0
  pushl $85
  101dfa:	6a 55                	push   $0x55
  jmp __alltraps
  101dfc:	e9 7a 07 00 00       	jmp    10257b <__alltraps>

00101e01 <vector86>:
.globl vector86
vector86:
  pushl $0
  101e01:	6a 00                	push   $0x0
  pushl $86
  101e03:	6a 56                	push   $0x56
  jmp __alltraps
  101e05:	e9 71 07 00 00       	jmp    10257b <__alltraps>

00101e0a <vector87>:
.globl vector87
vector87:
  pushl $0
  101e0a:	6a 00                	push   $0x0
  pushl $87
  101e0c:	6a 57                	push   $0x57
  jmp __alltraps
  101e0e:	e9 68 07 00 00       	jmp    10257b <__alltraps>

00101e13 <vector88>:
.globl vector88
vector88:
  pushl $0
  101e13:	6a 00                	push   $0x0
  pushl $88
  101e15:	6a 58                	push   $0x58
  jmp __alltraps
  101e17:	e9 5f 07 00 00       	jmp    10257b <__alltraps>

00101e1c <vector89>:
.globl vector89
vector89:
  pushl $0
  101e1c:	6a 00                	push   $0x0
  pushl $89
  101e1e:	6a 59                	push   $0x59
  jmp __alltraps
  101e20:	e9 56 07 00 00       	jmp    10257b <__alltraps>

00101e25 <vector90>:
.globl vector90
vector90:
  pushl $0
  101e25:	6a 00                	push   $0x0
  pushl $90
  101e27:	6a 5a                	push   $0x5a
  jmp __alltraps
  101e29:	e9 4d 07 00 00       	jmp    10257b <__alltraps>

00101e2e <vector91>:
.globl vector91
vector91:
  pushl $0
  101e2e:	6a 00                	push   $0x0
  pushl $91
  101e30:	6a 5b                	push   $0x5b
  jmp __alltraps
  101e32:	e9 44 07 00 00       	jmp    10257b <__alltraps>

00101e37 <vector92>:
.globl vector92
vector92:
  pushl $0
  101e37:	6a 00                	push   $0x0
  pushl $92
  101e39:	6a 5c                	push   $0x5c
  jmp __alltraps
  101e3b:	e9 3b 07 00 00       	jmp    10257b <__alltraps>

00101e40 <vector93>:
.globl vector93
vector93:
  pushl $0
  101e40:	6a 00                	push   $0x0
  pushl $93
  101e42:	6a 5d                	push   $0x5d
  jmp __alltraps
  101e44:	e9 32 07 00 00       	jmp    10257b <__alltraps>

00101e49 <vector94>:
.globl vector94
vector94:
  pushl $0
  101e49:	6a 00                	push   $0x0
  pushl $94
  101e4b:	6a 5e                	push   $0x5e
  jmp __alltraps
  101e4d:	e9 29 07 00 00       	jmp    10257b <__alltraps>

00101e52 <vector95>:
.globl vector95
vector95:
  pushl $0
  101e52:	6a 00                	push   $0x0
  pushl $95
  101e54:	6a 5f                	push   $0x5f
  jmp __alltraps
  101e56:	e9 20 07 00 00       	jmp    10257b <__alltraps>

00101e5b <vector96>:
.globl vector96
vector96:
  pushl $0
  101e5b:	6a 00                	push   $0x0
  pushl $96
  101e5d:	6a 60                	push   $0x60
  jmp __alltraps
  101e5f:	e9 17 07 00 00       	jmp    10257b <__alltraps>

00101e64 <vector97>:
.globl vector97
vector97:
  pushl $0
  101e64:	6a 00                	push   $0x0
  pushl $97
  101e66:	6a 61                	push   $0x61
  jmp __alltraps
  101e68:	e9 0e 07 00 00       	jmp    10257b <__alltraps>

00101e6d <vector98>:
.globl vector98
vector98:
  pushl $0
  101e6d:	6a 00                	push   $0x0
  pushl $98
  101e6f:	6a 62                	push   $0x62
  jmp __alltraps
  101e71:	e9 05 07 00 00       	jmp    10257b <__alltraps>

00101e76 <vector99>:
.globl vector99
vector99:
  pushl $0
  101e76:	6a 00                	push   $0x0
  pushl $99
  101e78:	6a 63                	push   $0x63
  jmp __alltraps
  101e7a:	e9 fc 06 00 00       	jmp    10257b <__alltraps>

00101e7f <vector100>:
.globl vector100
vector100:
  pushl $0
  101e7f:	6a 00                	push   $0x0
  pushl $100
  101e81:	6a 64                	push   $0x64
  jmp __alltraps
  101e83:	e9 f3 06 00 00       	jmp    10257b <__alltraps>

00101e88 <vector101>:
.globl vector101
vector101:
  pushl $0
  101e88:	6a 00                	push   $0x0
  pushl $101
  101e8a:	6a 65                	push   $0x65
  jmp __alltraps
  101e8c:	e9 ea 06 00 00       	jmp    10257b <__alltraps>

00101e91 <vector102>:
.globl vector102
vector102:
  pushl $0
  101e91:	6a 00                	push   $0x0
  pushl $102
  101e93:	6a 66                	push   $0x66
  jmp __alltraps
  101e95:	e9 e1 06 00 00       	jmp    10257b <__alltraps>

00101e9a <vector103>:
.globl vector103
vector103:
  pushl $0
  101e9a:	6a 00                	push   $0x0
  pushl $103
  101e9c:	6a 67                	push   $0x67
  jmp __alltraps
  101e9e:	e9 d8 06 00 00       	jmp    10257b <__alltraps>

00101ea3 <vector104>:
.globl vector104
vector104:
  pushl $0
  101ea3:	6a 00                	push   $0x0
  pushl $104
  101ea5:	6a 68                	push   $0x68
  jmp __alltraps
  101ea7:	e9 cf 06 00 00       	jmp    10257b <__alltraps>

00101eac <vector105>:
.globl vector105
vector105:
  pushl $0
  101eac:	6a 00                	push   $0x0
  pushl $105
  101eae:	6a 69                	push   $0x69
  jmp __alltraps
  101eb0:	e9 c6 06 00 00       	jmp    10257b <__alltraps>

00101eb5 <vector106>:
.globl vector106
vector106:
  pushl $0
  101eb5:	6a 00                	push   $0x0
  pushl $106
  101eb7:	6a 6a                	push   $0x6a
  jmp __alltraps
  101eb9:	e9 bd 06 00 00       	jmp    10257b <__alltraps>

00101ebe <vector107>:
.globl vector107
vector107:
  pushl $0
  101ebe:	6a 00                	push   $0x0
  pushl $107
  101ec0:	6a 6b                	push   $0x6b
  jmp __alltraps
  101ec2:	e9 b4 06 00 00       	jmp    10257b <__alltraps>

00101ec7 <vector108>:
.globl vector108
vector108:
  pushl $0
  101ec7:	6a 00                	push   $0x0
  pushl $108
  101ec9:	6a 6c                	push   $0x6c
  jmp __alltraps
  101ecb:	e9 ab 06 00 00       	jmp    10257b <__alltraps>

00101ed0 <vector109>:
.globl vector109
vector109:
  pushl $0
  101ed0:	6a 00                	push   $0x0
  pushl $109
  101ed2:	6a 6d                	push   $0x6d
  jmp __alltraps
  101ed4:	e9 a2 06 00 00       	jmp    10257b <__alltraps>

00101ed9 <vector110>:
.globl vector110
vector110:
  pushl $0
  101ed9:	6a 00                	push   $0x0
  pushl $110
  101edb:	6a 6e                	push   $0x6e
  jmp __alltraps
  101edd:	e9 99 06 00 00       	jmp    10257b <__alltraps>

00101ee2 <vector111>:
.globl vector111
vector111:
  pushl $0
  101ee2:	6a 00                	push   $0x0
  pushl $111
  101ee4:	6a 6f                	push   $0x6f
  jmp __alltraps
  101ee6:	e9 90 06 00 00       	jmp    10257b <__alltraps>

00101eeb <vector112>:
.globl vector112
vector112:
  pushl $0
  101eeb:	6a 00                	push   $0x0
  pushl $112
  101eed:	6a 70                	push   $0x70
  jmp __alltraps
  101eef:	e9 87 06 00 00       	jmp    10257b <__alltraps>

00101ef4 <vector113>:
.globl vector113
vector113:
  pushl $0
  101ef4:	6a 00                	push   $0x0
  pushl $113
  101ef6:	6a 71                	push   $0x71
  jmp __alltraps
  101ef8:	e9 7e 06 00 00       	jmp    10257b <__alltraps>

00101efd <vector114>:
.globl vector114
vector114:
  pushl $0
  101efd:	6a 00                	push   $0x0
  pushl $114
  101eff:	6a 72                	push   $0x72
  jmp __alltraps
  101f01:	e9 75 06 00 00       	jmp    10257b <__alltraps>

00101f06 <vector115>:
.globl vector115
vector115:
  pushl $0
  101f06:	6a 00                	push   $0x0
  pushl $115
  101f08:	6a 73                	push   $0x73
  jmp __alltraps
  101f0a:	e9 6c 06 00 00       	jmp    10257b <__alltraps>

00101f0f <vector116>:
.globl vector116
vector116:
  pushl $0
  101f0f:	6a 00                	push   $0x0
  pushl $116
  101f11:	6a 74                	push   $0x74
  jmp __alltraps
  101f13:	e9 63 06 00 00       	jmp    10257b <__alltraps>

00101f18 <vector117>:
.globl vector117
vector117:
  pushl $0
  101f18:	6a 00                	push   $0x0
  pushl $117
  101f1a:	6a 75                	push   $0x75
  jmp __alltraps
  101f1c:	e9 5a 06 00 00       	jmp    10257b <__alltraps>

00101f21 <vector118>:
.globl vector118
vector118:
  pushl $0
  101f21:	6a 00                	push   $0x0
  pushl $118
  101f23:	6a 76                	push   $0x76
  jmp __alltraps
  101f25:	e9 51 06 00 00       	jmp    10257b <__alltraps>

00101f2a <vector119>:
.globl vector119
vector119:
  pushl $0
  101f2a:	6a 00                	push   $0x0
  pushl $119
  101f2c:	6a 77                	push   $0x77
  jmp __alltraps
  101f2e:	e9 48 06 00 00       	jmp    10257b <__alltraps>

00101f33 <vector120>:
.globl vector120
vector120:
  pushl $0
  101f33:	6a 00                	push   $0x0
  pushl $120
  101f35:	6a 78                	push   $0x78
  jmp __alltraps
  101f37:	e9 3f 06 00 00       	jmp    10257b <__alltraps>

00101f3c <vector121>:
.globl vector121
vector121:
  pushl $0
  101f3c:	6a 00                	push   $0x0
  pushl $121
  101f3e:	6a 79                	push   $0x79
  jmp __alltraps
  101f40:	e9 36 06 00 00       	jmp    10257b <__alltraps>

00101f45 <vector122>:
.globl vector122
vector122:
  pushl $0
  101f45:	6a 00                	push   $0x0
  pushl $122
  101f47:	6a 7a                	push   $0x7a
  jmp __alltraps
  101f49:	e9 2d 06 00 00       	jmp    10257b <__alltraps>

00101f4e <vector123>:
.globl vector123
vector123:
  pushl $0
  101f4e:	6a 00                	push   $0x0
  pushl $123
  101f50:	6a 7b                	push   $0x7b
  jmp __alltraps
  101f52:	e9 24 06 00 00       	jmp    10257b <__alltraps>

00101f57 <vector124>:
.globl vector124
vector124:
  pushl $0
  101f57:	6a 00                	push   $0x0
  pushl $124
  101f59:	6a 7c                	push   $0x7c
  jmp __alltraps
  101f5b:	e9 1b 06 00 00       	jmp    10257b <__alltraps>

00101f60 <vector125>:
.globl vector125
vector125:
  pushl $0
  101f60:	6a 00                	push   $0x0
  pushl $125
  101f62:	6a 7d                	push   $0x7d
  jmp __alltraps
  101f64:	e9 12 06 00 00       	jmp    10257b <__alltraps>

00101f69 <vector126>:
.globl vector126
vector126:
  pushl $0
  101f69:	6a 00                	push   $0x0
  pushl $126
  101f6b:	6a 7e                	push   $0x7e
  jmp __alltraps
  101f6d:	e9 09 06 00 00       	jmp    10257b <__alltraps>

00101f72 <vector127>:
.globl vector127
vector127:
  pushl $0
  101f72:	6a 00                	push   $0x0
  pushl $127
  101f74:	6a 7f                	push   $0x7f
  jmp __alltraps
  101f76:	e9 00 06 00 00       	jmp    10257b <__alltraps>

00101f7b <vector128>:
.globl vector128
vector128:
  pushl $0
  101f7b:	6a 00                	push   $0x0
  pushl $128
  101f7d:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  101f82:	e9 f4 05 00 00       	jmp    10257b <__alltraps>

00101f87 <vector129>:
.globl vector129
vector129:
  pushl $0
  101f87:	6a 00                	push   $0x0
  pushl $129
  101f89:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  101f8e:	e9 e8 05 00 00       	jmp    10257b <__alltraps>

00101f93 <vector130>:
.globl vector130
vector130:
  pushl $0
  101f93:	6a 00                	push   $0x0
  pushl $130
  101f95:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  101f9a:	e9 dc 05 00 00       	jmp    10257b <__alltraps>

00101f9f <vector131>:
.globl vector131
vector131:
  pushl $0
  101f9f:	6a 00                	push   $0x0
  pushl $131
  101fa1:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  101fa6:	e9 d0 05 00 00       	jmp    10257b <__alltraps>

00101fab <vector132>:
.globl vector132
vector132:
  pushl $0
  101fab:	6a 00                	push   $0x0
  pushl $132
  101fad:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  101fb2:	e9 c4 05 00 00       	jmp    10257b <__alltraps>

00101fb7 <vector133>:
.globl vector133
vector133:
  pushl $0
  101fb7:	6a 00                	push   $0x0
  pushl $133
  101fb9:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  101fbe:	e9 b8 05 00 00       	jmp    10257b <__alltraps>

00101fc3 <vector134>:
.globl vector134
vector134:
  pushl $0
  101fc3:	6a 00                	push   $0x0
  pushl $134
  101fc5:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  101fca:	e9 ac 05 00 00       	jmp    10257b <__alltraps>

00101fcf <vector135>:
.globl vector135
vector135:
  pushl $0
  101fcf:	6a 00                	push   $0x0
  pushl $135
  101fd1:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  101fd6:	e9 a0 05 00 00       	jmp    10257b <__alltraps>

00101fdb <vector136>:
.globl vector136
vector136:
  pushl $0
  101fdb:	6a 00                	push   $0x0
  pushl $136
  101fdd:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  101fe2:	e9 94 05 00 00       	jmp    10257b <__alltraps>

00101fe7 <vector137>:
.globl vector137
vector137:
  pushl $0
  101fe7:	6a 00                	push   $0x0
  pushl $137
  101fe9:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  101fee:	e9 88 05 00 00       	jmp    10257b <__alltraps>

00101ff3 <vector138>:
.globl vector138
vector138:
  pushl $0
  101ff3:	6a 00                	push   $0x0
  pushl $138
  101ff5:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  101ffa:	e9 7c 05 00 00       	jmp    10257b <__alltraps>

00101fff <vector139>:
.globl vector139
vector139:
  pushl $0
  101fff:	6a 00                	push   $0x0
  pushl $139
  102001:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102006:	e9 70 05 00 00       	jmp    10257b <__alltraps>

0010200b <vector140>:
.globl vector140
vector140:
  pushl $0
  10200b:	6a 00                	push   $0x0
  pushl $140
  10200d:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102012:	e9 64 05 00 00       	jmp    10257b <__alltraps>

00102017 <vector141>:
.globl vector141
vector141:
  pushl $0
  102017:	6a 00                	push   $0x0
  pushl $141
  102019:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10201e:	e9 58 05 00 00       	jmp    10257b <__alltraps>

00102023 <vector142>:
.globl vector142
vector142:
  pushl $0
  102023:	6a 00                	push   $0x0
  pushl $142
  102025:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  10202a:	e9 4c 05 00 00       	jmp    10257b <__alltraps>

0010202f <vector143>:
.globl vector143
vector143:
  pushl $0
  10202f:	6a 00                	push   $0x0
  pushl $143
  102031:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102036:	e9 40 05 00 00       	jmp    10257b <__alltraps>

0010203b <vector144>:
.globl vector144
vector144:
  pushl $0
  10203b:	6a 00                	push   $0x0
  pushl $144
  10203d:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102042:	e9 34 05 00 00       	jmp    10257b <__alltraps>

00102047 <vector145>:
.globl vector145
vector145:
  pushl $0
  102047:	6a 00                	push   $0x0
  pushl $145
  102049:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10204e:	e9 28 05 00 00       	jmp    10257b <__alltraps>

00102053 <vector146>:
.globl vector146
vector146:
  pushl $0
  102053:	6a 00                	push   $0x0
  pushl $146
  102055:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10205a:	e9 1c 05 00 00       	jmp    10257b <__alltraps>

0010205f <vector147>:
.globl vector147
vector147:
  pushl $0
  10205f:	6a 00                	push   $0x0
  pushl $147
  102061:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102066:	e9 10 05 00 00       	jmp    10257b <__alltraps>

0010206b <vector148>:
.globl vector148
vector148:
  pushl $0
  10206b:	6a 00                	push   $0x0
  pushl $148
  10206d:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102072:	e9 04 05 00 00       	jmp    10257b <__alltraps>

00102077 <vector149>:
.globl vector149
vector149:
  pushl $0
  102077:	6a 00                	push   $0x0
  pushl $149
  102079:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10207e:	e9 f8 04 00 00       	jmp    10257b <__alltraps>

00102083 <vector150>:
.globl vector150
vector150:
  pushl $0
  102083:	6a 00                	push   $0x0
  pushl $150
  102085:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10208a:	e9 ec 04 00 00       	jmp    10257b <__alltraps>

0010208f <vector151>:
.globl vector151
vector151:
  pushl $0
  10208f:	6a 00                	push   $0x0
  pushl $151
  102091:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102096:	e9 e0 04 00 00       	jmp    10257b <__alltraps>

0010209b <vector152>:
.globl vector152
vector152:
  pushl $0
  10209b:	6a 00                	push   $0x0
  pushl $152
  10209d:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1020a2:	e9 d4 04 00 00       	jmp    10257b <__alltraps>

001020a7 <vector153>:
.globl vector153
vector153:
  pushl $0
  1020a7:	6a 00                	push   $0x0
  pushl $153
  1020a9:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1020ae:	e9 c8 04 00 00       	jmp    10257b <__alltraps>

001020b3 <vector154>:
.globl vector154
vector154:
  pushl $0
  1020b3:	6a 00                	push   $0x0
  pushl $154
  1020b5:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1020ba:	e9 bc 04 00 00       	jmp    10257b <__alltraps>

001020bf <vector155>:
.globl vector155
vector155:
  pushl $0
  1020bf:	6a 00                	push   $0x0
  pushl $155
  1020c1:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1020c6:	e9 b0 04 00 00       	jmp    10257b <__alltraps>

001020cb <vector156>:
.globl vector156
vector156:
  pushl $0
  1020cb:	6a 00                	push   $0x0
  pushl $156
  1020cd:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1020d2:	e9 a4 04 00 00       	jmp    10257b <__alltraps>

001020d7 <vector157>:
.globl vector157
vector157:
  pushl $0
  1020d7:	6a 00                	push   $0x0
  pushl $157
  1020d9:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1020de:	e9 98 04 00 00       	jmp    10257b <__alltraps>

001020e3 <vector158>:
.globl vector158
vector158:
  pushl $0
  1020e3:	6a 00                	push   $0x0
  pushl $158
  1020e5:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1020ea:	e9 8c 04 00 00       	jmp    10257b <__alltraps>

001020ef <vector159>:
.globl vector159
vector159:
  pushl $0
  1020ef:	6a 00                	push   $0x0
  pushl $159
  1020f1:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1020f6:	e9 80 04 00 00       	jmp    10257b <__alltraps>

001020fb <vector160>:
.globl vector160
vector160:
  pushl $0
  1020fb:	6a 00                	push   $0x0
  pushl $160
  1020fd:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102102:	e9 74 04 00 00       	jmp    10257b <__alltraps>

00102107 <vector161>:
.globl vector161
vector161:
  pushl $0
  102107:	6a 00                	push   $0x0
  pushl $161
  102109:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10210e:	e9 68 04 00 00       	jmp    10257b <__alltraps>

00102113 <vector162>:
.globl vector162
vector162:
  pushl $0
  102113:	6a 00                	push   $0x0
  pushl $162
  102115:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10211a:	e9 5c 04 00 00       	jmp    10257b <__alltraps>

0010211f <vector163>:
.globl vector163
vector163:
  pushl $0
  10211f:	6a 00                	push   $0x0
  pushl $163
  102121:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102126:	e9 50 04 00 00       	jmp    10257b <__alltraps>

0010212b <vector164>:
.globl vector164
vector164:
  pushl $0
  10212b:	6a 00                	push   $0x0
  pushl $164
  10212d:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102132:	e9 44 04 00 00       	jmp    10257b <__alltraps>

00102137 <vector165>:
.globl vector165
vector165:
  pushl $0
  102137:	6a 00                	push   $0x0
  pushl $165
  102139:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10213e:	e9 38 04 00 00       	jmp    10257b <__alltraps>

00102143 <vector166>:
.globl vector166
vector166:
  pushl $0
  102143:	6a 00                	push   $0x0
  pushl $166
  102145:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  10214a:	e9 2c 04 00 00       	jmp    10257b <__alltraps>

0010214f <vector167>:
.globl vector167
vector167:
  pushl $0
  10214f:	6a 00                	push   $0x0
  pushl $167
  102151:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102156:	e9 20 04 00 00       	jmp    10257b <__alltraps>

0010215b <vector168>:
.globl vector168
vector168:
  pushl $0
  10215b:	6a 00                	push   $0x0
  pushl $168
  10215d:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102162:	e9 14 04 00 00       	jmp    10257b <__alltraps>

00102167 <vector169>:
.globl vector169
vector169:
  pushl $0
  102167:	6a 00                	push   $0x0
  pushl $169
  102169:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10216e:	e9 08 04 00 00       	jmp    10257b <__alltraps>

00102173 <vector170>:
.globl vector170
vector170:
  pushl $0
  102173:	6a 00                	push   $0x0
  pushl $170
  102175:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10217a:	e9 fc 03 00 00       	jmp    10257b <__alltraps>

0010217f <vector171>:
.globl vector171
vector171:
  pushl $0
  10217f:	6a 00                	push   $0x0
  pushl $171
  102181:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102186:	e9 f0 03 00 00       	jmp    10257b <__alltraps>

0010218b <vector172>:
.globl vector172
vector172:
  pushl $0
  10218b:	6a 00                	push   $0x0
  pushl $172
  10218d:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102192:	e9 e4 03 00 00       	jmp    10257b <__alltraps>

00102197 <vector173>:
.globl vector173
vector173:
  pushl $0
  102197:	6a 00                	push   $0x0
  pushl $173
  102199:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10219e:	e9 d8 03 00 00       	jmp    10257b <__alltraps>

001021a3 <vector174>:
.globl vector174
vector174:
  pushl $0
  1021a3:	6a 00                	push   $0x0
  pushl $174
  1021a5:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1021aa:	e9 cc 03 00 00       	jmp    10257b <__alltraps>

001021af <vector175>:
.globl vector175
vector175:
  pushl $0
  1021af:	6a 00                	push   $0x0
  pushl $175
  1021b1:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1021b6:	e9 c0 03 00 00       	jmp    10257b <__alltraps>

001021bb <vector176>:
.globl vector176
vector176:
  pushl $0
  1021bb:	6a 00                	push   $0x0
  pushl $176
  1021bd:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1021c2:	e9 b4 03 00 00       	jmp    10257b <__alltraps>

001021c7 <vector177>:
.globl vector177
vector177:
  pushl $0
  1021c7:	6a 00                	push   $0x0
  pushl $177
  1021c9:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1021ce:	e9 a8 03 00 00       	jmp    10257b <__alltraps>

001021d3 <vector178>:
.globl vector178
vector178:
  pushl $0
  1021d3:	6a 00                	push   $0x0
  pushl $178
  1021d5:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1021da:	e9 9c 03 00 00       	jmp    10257b <__alltraps>

001021df <vector179>:
.globl vector179
vector179:
  pushl $0
  1021df:	6a 00                	push   $0x0
  pushl $179
  1021e1:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1021e6:	e9 90 03 00 00       	jmp    10257b <__alltraps>

001021eb <vector180>:
.globl vector180
vector180:
  pushl $0
  1021eb:	6a 00                	push   $0x0
  pushl $180
  1021ed:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1021f2:	e9 84 03 00 00       	jmp    10257b <__alltraps>

001021f7 <vector181>:
.globl vector181
vector181:
  pushl $0
  1021f7:	6a 00                	push   $0x0
  pushl $181
  1021f9:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1021fe:	e9 78 03 00 00       	jmp    10257b <__alltraps>

00102203 <vector182>:
.globl vector182
vector182:
  pushl $0
  102203:	6a 00                	push   $0x0
  pushl $182
  102205:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10220a:	e9 6c 03 00 00       	jmp    10257b <__alltraps>

0010220f <vector183>:
.globl vector183
vector183:
  pushl $0
  10220f:	6a 00                	push   $0x0
  pushl $183
  102211:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102216:	e9 60 03 00 00       	jmp    10257b <__alltraps>

0010221b <vector184>:
.globl vector184
vector184:
  pushl $0
  10221b:	6a 00                	push   $0x0
  pushl $184
  10221d:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102222:	e9 54 03 00 00       	jmp    10257b <__alltraps>

00102227 <vector185>:
.globl vector185
vector185:
  pushl $0
  102227:	6a 00                	push   $0x0
  pushl $185
  102229:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10222e:	e9 48 03 00 00       	jmp    10257b <__alltraps>

00102233 <vector186>:
.globl vector186
vector186:
  pushl $0
  102233:	6a 00                	push   $0x0
  pushl $186
  102235:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  10223a:	e9 3c 03 00 00       	jmp    10257b <__alltraps>

0010223f <vector187>:
.globl vector187
vector187:
  pushl $0
  10223f:	6a 00                	push   $0x0
  pushl $187
  102241:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102246:	e9 30 03 00 00       	jmp    10257b <__alltraps>

0010224b <vector188>:
.globl vector188
vector188:
  pushl $0
  10224b:	6a 00                	push   $0x0
  pushl $188
  10224d:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102252:	e9 24 03 00 00       	jmp    10257b <__alltraps>

00102257 <vector189>:
.globl vector189
vector189:
  pushl $0
  102257:	6a 00                	push   $0x0
  pushl $189
  102259:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10225e:	e9 18 03 00 00       	jmp    10257b <__alltraps>

00102263 <vector190>:
.globl vector190
vector190:
  pushl $0
  102263:	6a 00                	push   $0x0
  pushl $190
  102265:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10226a:	e9 0c 03 00 00       	jmp    10257b <__alltraps>

0010226f <vector191>:
.globl vector191
vector191:
  pushl $0
  10226f:	6a 00                	push   $0x0
  pushl $191
  102271:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102276:	e9 00 03 00 00       	jmp    10257b <__alltraps>

0010227b <vector192>:
.globl vector192
vector192:
  pushl $0
  10227b:	6a 00                	push   $0x0
  pushl $192
  10227d:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102282:	e9 f4 02 00 00       	jmp    10257b <__alltraps>

00102287 <vector193>:
.globl vector193
vector193:
  pushl $0
  102287:	6a 00                	push   $0x0
  pushl $193
  102289:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10228e:	e9 e8 02 00 00       	jmp    10257b <__alltraps>

00102293 <vector194>:
.globl vector194
vector194:
  pushl $0
  102293:	6a 00                	push   $0x0
  pushl $194
  102295:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10229a:	e9 dc 02 00 00       	jmp    10257b <__alltraps>

0010229f <vector195>:
.globl vector195
vector195:
  pushl $0
  10229f:	6a 00                	push   $0x0
  pushl $195
  1022a1:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1022a6:	e9 d0 02 00 00       	jmp    10257b <__alltraps>

001022ab <vector196>:
.globl vector196
vector196:
  pushl $0
  1022ab:	6a 00                	push   $0x0
  pushl $196
  1022ad:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1022b2:	e9 c4 02 00 00       	jmp    10257b <__alltraps>

001022b7 <vector197>:
.globl vector197
vector197:
  pushl $0
  1022b7:	6a 00                	push   $0x0
  pushl $197
  1022b9:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1022be:	e9 b8 02 00 00       	jmp    10257b <__alltraps>

001022c3 <vector198>:
.globl vector198
vector198:
  pushl $0
  1022c3:	6a 00                	push   $0x0
  pushl $198
  1022c5:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1022ca:	e9 ac 02 00 00       	jmp    10257b <__alltraps>

001022cf <vector199>:
.globl vector199
vector199:
  pushl $0
  1022cf:	6a 00                	push   $0x0
  pushl $199
  1022d1:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1022d6:	e9 a0 02 00 00       	jmp    10257b <__alltraps>

001022db <vector200>:
.globl vector200
vector200:
  pushl $0
  1022db:	6a 00                	push   $0x0
  pushl $200
  1022dd:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1022e2:	e9 94 02 00 00       	jmp    10257b <__alltraps>

001022e7 <vector201>:
.globl vector201
vector201:
  pushl $0
  1022e7:	6a 00                	push   $0x0
  pushl $201
  1022e9:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1022ee:	e9 88 02 00 00       	jmp    10257b <__alltraps>

001022f3 <vector202>:
.globl vector202
vector202:
  pushl $0
  1022f3:	6a 00                	push   $0x0
  pushl $202
  1022f5:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1022fa:	e9 7c 02 00 00       	jmp    10257b <__alltraps>

001022ff <vector203>:
.globl vector203
vector203:
  pushl $0
  1022ff:	6a 00                	push   $0x0
  pushl $203
  102301:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102306:	e9 70 02 00 00       	jmp    10257b <__alltraps>

0010230b <vector204>:
.globl vector204
vector204:
  pushl $0
  10230b:	6a 00                	push   $0x0
  pushl $204
  10230d:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102312:	e9 64 02 00 00       	jmp    10257b <__alltraps>

00102317 <vector205>:
.globl vector205
vector205:
  pushl $0
  102317:	6a 00                	push   $0x0
  pushl $205
  102319:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10231e:	e9 58 02 00 00       	jmp    10257b <__alltraps>

00102323 <vector206>:
.globl vector206
vector206:
  pushl $0
  102323:	6a 00                	push   $0x0
  pushl $206
  102325:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  10232a:	e9 4c 02 00 00       	jmp    10257b <__alltraps>

0010232f <vector207>:
.globl vector207
vector207:
  pushl $0
  10232f:	6a 00                	push   $0x0
  pushl $207
  102331:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102336:	e9 40 02 00 00       	jmp    10257b <__alltraps>

0010233b <vector208>:
.globl vector208
vector208:
  pushl $0
  10233b:	6a 00                	push   $0x0
  pushl $208
  10233d:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102342:	e9 34 02 00 00       	jmp    10257b <__alltraps>

00102347 <vector209>:
.globl vector209
vector209:
  pushl $0
  102347:	6a 00                	push   $0x0
  pushl $209
  102349:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10234e:	e9 28 02 00 00       	jmp    10257b <__alltraps>

00102353 <vector210>:
.globl vector210
vector210:
  pushl $0
  102353:	6a 00                	push   $0x0
  pushl $210
  102355:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10235a:	e9 1c 02 00 00       	jmp    10257b <__alltraps>

0010235f <vector211>:
.globl vector211
vector211:
  pushl $0
  10235f:	6a 00                	push   $0x0
  pushl $211
  102361:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102366:	e9 10 02 00 00       	jmp    10257b <__alltraps>

0010236b <vector212>:
.globl vector212
vector212:
  pushl $0
  10236b:	6a 00                	push   $0x0
  pushl $212
  10236d:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102372:	e9 04 02 00 00       	jmp    10257b <__alltraps>

00102377 <vector213>:
.globl vector213
vector213:
  pushl $0
  102377:	6a 00                	push   $0x0
  pushl $213
  102379:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10237e:	e9 f8 01 00 00       	jmp    10257b <__alltraps>

00102383 <vector214>:
.globl vector214
vector214:
  pushl $0
  102383:	6a 00                	push   $0x0
  pushl $214
  102385:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10238a:	e9 ec 01 00 00       	jmp    10257b <__alltraps>

0010238f <vector215>:
.globl vector215
vector215:
  pushl $0
  10238f:	6a 00                	push   $0x0
  pushl $215
  102391:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102396:	e9 e0 01 00 00       	jmp    10257b <__alltraps>

0010239b <vector216>:
.globl vector216
vector216:
  pushl $0
  10239b:	6a 00                	push   $0x0
  pushl $216
  10239d:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1023a2:	e9 d4 01 00 00       	jmp    10257b <__alltraps>

001023a7 <vector217>:
.globl vector217
vector217:
  pushl $0
  1023a7:	6a 00                	push   $0x0
  pushl $217
  1023a9:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1023ae:	e9 c8 01 00 00       	jmp    10257b <__alltraps>

001023b3 <vector218>:
.globl vector218
vector218:
  pushl $0
  1023b3:	6a 00                	push   $0x0
  pushl $218
  1023b5:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1023ba:	e9 bc 01 00 00       	jmp    10257b <__alltraps>

001023bf <vector219>:
.globl vector219
vector219:
  pushl $0
  1023bf:	6a 00                	push   $0x0
  pushl $219
  1023c1:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1023c6:	e9 b0 01 00 00       	jmp    10257b <__alltraps>

001023cb <vector220>:
.globl vector220
vector220:
  pushl $0
  1023cb:	6a 00                	push   $0x0
  pushl $220
  1023cd:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1023d2:	e9 a4 01 00 00       	jmp    10257b <__alltraps>

001023d7 <vector221>:
.globl vector221
vector221:
  pushl $0
  1023d7:	6a 00                	push   $0x0
  pushl $221
  1023d9:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1023de:	e9 98 01 00 00       	jmp    10257b <__alltraps>

001023e3 <vector222>:
.globl vector222
vector222:
  pushl $0
  1023e3:	6a 00                	push   $0x0
  pushl $222
  1023e5:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1023ea:	e9 8c 01 00 00       	jmp    10257b <__alltraps>

001023ef <vector223>:
.globl vector223
vector223:
  pushl $0
  1023ef:	6a 00                	push   $0x0
  pushl $223
  1023f1:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1023f6:	e9 80 01 00 00       	jmp    10257b <__alltraps>

001023fb <vector224>:
.globl vector224
vector224:
  pushl $0
  1023fb:	6a 00                	push   $0x0
  pushl $224
  1023fd:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102402:	e9 74 01 00 00       	jmp    10257b <__alltraps>

00102407 <vector225>:
.globl vector225
vector225:
  pushl $0
  102407:	6a 00                	push   $0x0
  pushl $225
  102409:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10240e:	e9 68 01 00 00       	jmp    10257b <__alltraps>

00102413 <vector226>:
.globl vector226
vector226:
  pushl $0
  102413:	6a 00                	push   $0x0
  pushl $226
  102415:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10241a:	e9 5c 01 00 00       	jmp    10257b <__alltraps>

0010241f <vector227>:
.globl vector227
vector227:
  pushl $0
  10241f:	6a 00                	push   $0x0
  pushl $227
  102421:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102426:	e9 50 01 00 00       	jmp    10257b <__alltraps>

0010242b <vector228>:
.globl vector228
vector228:
  pushl $0
  10242b:	6a 00                	push   $0x0
  pushl $228
  10242d:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102432:	e9 44 01 00 00       	jmp    10257b <__alltraps>

00102437 <vector229>:
.globl vector229
vector229:
  pushl $0
  102437:	6a 00                	push   $0x0
  pushl $229
  102439:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10243e:	e9 38 01 00 00       	jmp    10257b <__alltraps>

00102443 <vector230>:
.globl vector230
vector230:
  pushl $0
  102443:	6a 00                	push   $0x0
  pushl $230
  102445:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  10244a:	e9 2c 01 00 00       	jmp    10257b <__alltraps>

0010244f <vector231>:
.globl vector231
vector231:
  pushl $0
  10244f:	6a 00                	push   $0x0
  pushl $231
  102451:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102456:	e9 20 01 00 00       	jmp    10257b <__alltraps>

0010245b <vector232>:
.globl vector232
vector232:
  pushl $0
  10245b:	6a 00                	push   $0x0
  pushl $232
  10245d:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102462:	e9 14 01 00 00       	jmp    10257b <__alltraps>

00102467 <vector233>:
.globl vector233
vector233:
  pushl $0
  102467:	6a 00                	push   $0x0
  pushl $233
  102469:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10246e:	e9 08 01 00 00       	jmp    10257b <__alltraps>

00102473 <vector234>:
.globl vector234
vector234:
  pushl $0
  102473:	6a 00                	push   $0x0
  pushl $234
  102475:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10247a:	e9 fc 00 00 00       	jmp    10257b <__alltraps>

0010247f <vector235>:
.globl vector235
vector235:
  pushl $0
  10247f:	6a 00                	push   $0x0
  pushl $235
  102481:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102486:	e9 f0 00 00 00       	jmp    10257b <__alltraps>

0010248b <vector236>:
.globl vector236
vector236:
  pushl $0
  10248b:	6a 00                	push   $0x0
  pushl $236
  10248d:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102492:	e9 e4 00 00 00       	jmp    10257b <__alltraps>

00102497 <vector237>:
.globl vector237
vector237:
  pushl $0
  102497:	6a 00                	push   $0x0
  pushl $237
  102499:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10249e:	e9 d8 00 00 00       	jmp    10257b <__alltraps>

001024a3 <vector238>:
.globl vector238
vector238:
  pushl $0
  1024a3:	6a 00                	push   $0x0
  pushl $238
  1024a5:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1024aa:	e9 cc 00 00 00       	jmp    10257b <__alltraps>

001024af <vector239>:
.globl vector239
vector239:
  pushl $0
  1024af:	6a 00                	push   $0x0
  pushl $239
  1024b1:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1024b6:	e9 c0 00 00 00       	jmp    10257b <__alltraps>

001024bb <vector240>:
.globl vector240
vector240:
  pushl $0
  1024bb:	6a 00                	push   $0x0
  pushl $240
  1024bd:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1024c2:	e9 b4 00 00 00       	jmp    10257b <__alltraps>

001024c7 <vector241>:
.globl vector241
vector241:
  pushl $0
  1024c7:	6a 00                	push   $0x0
  pushl $241
  1024c9:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1024ce:	e9 a8 00 00 00       	jmp    10257b <__alltraps>

001024d3 <vector242>:
.globl vector242
vector242:
  pushl $0
  1024d3:	6a 00                	push   $0x0
  pushl $242
  1024d5:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1024da:	e9 9c 00 00 00       	jmp    10257b <__alltraps>

001024df <vector243>:
.globl vector243
vector243:
  pushl $0
  1024df:	6a 00                	push   $0x0
  pushl $243
  1024e1:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1024e6:	e9 90 00 00 00       	jmp    10257b <__alltraps>

001024eb <vector244>:
.globl vector244
vector244:
  pushl $0
  1024eb:	6a 00                	push   $0x0
  pushl $244
  1024ed:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1024f2:	e9 84 00 00 00       	jmp    10257b <__alltraps>

001024f7 <vector245>:
.globl vector245
vector245:
  pushl $0
  1024f7:	6a 00                	push   $0x0
  pushl $245
  1024f9:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1024fe:	e9 78 00 00 00       	jmp    10257b <__alltraps>

00102503 <vector246>:
.globl vector246
vector246:
  pushl $0
  102503:	6a 00                	push   $0x0
  pushl $246
  102505:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  10250a:	e9 6c 00 00 00       	jmp    10257b <__alltraps>

0010250f <vector247>:
.globl vector247
vector247:
  pushl $0
  10250f:	6a 00                	push   $0x0
  pushl $247
  102511:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102516:	e9 60 00 00 00       	jmp    10257b <__alltraps>

0010251b <vector248>:
.globl vector248
vector248:
  pushl $0
  10251b:	6a 00                	push   $0x0
  pushl $248
  10251d:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102522:	e9 54 00 00 00       	jmp    10257b <__alltraps>

00102527 <vector249>:
.globl vector249
vector249:
  pushl $0
  102527:	6a 00                	push   $0x0
  pushl $249
  102529:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10252e:	e9 48 00 00 00       	jmp    10257b <__alltraps>

00102533 <vector250>:
.globl vector250
vector250:
  pushl $0
  102533:	6a 00                	push   $0x0
  pushl $250
  102535:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  10253a:	e9 3c 00 00 00       	jmp    10257b <__alltraps>

0010253f <vector251>:
.globl vector251
vector251:
  pushl $0
  10253f:	6a 00                	push   $0x0
  pushl $251
  102541:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102546:	e9 30 00 00 00       	jmp    10257b <__alltraps>

0010254b <vector252>:
.globl vector252
vector252:
  pushl $0
  10254b:	6a 00                	push   $0x0
  pushl $252
  10254d:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102552:	e9 24 00 00 00       	jmp    10257b <__alltraps>

00102557 <vector253>:
.globl vector253
vector253:
  pushl $0
  102557:	6a 00                	push   $0x0
  pushl $253
  102559:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10255e:	e9 18 00 00 00       	jmp    10257b <__alltraps>

00102563 <vector254>:
.globl vector254
vector254:
  pushl $0
  102563:	6a 00                	push   $0x0
  pushl $254
  102565:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10256a:	e9 0c 00 00 00       	jmp    10257b <__alltraps>

0010256f <vector255>:
.globl vector255
vector255:
  pushl $0
  10256f:	6a 00                	push   $0x0
  pushl $255
  102571:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102576:	e9 00 00 00 00       	jmp    10257b <__alltraps>

0010257b <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  10257b:	1e                   	push   %ds
    pushl %es
  10257c:	06                   	push   %es
    pushl %fs
  10257d:	0f a0                	push   %fs
    pushl %gs
  10257f:	0f a8                	push   %gs
    pushal
  102581:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102582:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102587:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102589:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  10258b:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  10258c:	e8 64 f5 ff ff       	call   101af5 <trap>

    # pop the pushed stack pointer
    popl %esp
  102591:	5c                   	pop    %esp

00102592 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102592:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102593:	0f a9                	pop    %gs
    popl %fs
  102595:	0f a1                	pop    %fs
    popl %es
  102597:	07                   	pop    %es
    popl %ds
  102598:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102599:	83 c4 08             	add    $0x8,%esp
    iret
  10259c:	cf                   	iret   

0010259d <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10259d:	55                   	push   %ebp
  10259e:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1025a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1025a3:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1025a6:	b8 23 00 00 00       	mov    $0x23,%eax
  1025ab:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1025ad:	b8 23 00 00 00       	mov    $0x23,%eax
  1025b2:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1025b4:	b8 10 00 00 00       	mov    $0x10,%eax
  1025b9:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1025bb:	b8 10 00 00 00       	mov    $0x10,%eax
  1025c0:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1025c2:	b8 10 00 00 00       	mov    $0x10,%eax
  1025c7:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1025c9:	ea d0 25 10 00 08 00 	ljmp   $0x8,$0x1025d0
}
  1025d0:	90                   	nop
  1025d1:	5d                   	pop    %ebp
  1025d2:	c3                   	ret    

001025d3 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1025d3:	55                   	push   %ebp
  1025d4:	89 e5                	mov    %esp,%ebp
  1025d6:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1025d9:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  1025de:	05 00 04 00 00       	add    $0x400,%eax
  1025e3:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  1025e8:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1025ef:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1025f1:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1025f8:	68 00 
  1025fa:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1025ff:	0f b7 c0             	movzwl %ax,%eax
  102602:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102608:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10260d:	c1 e8 10             	shr    $0x10,%eax
  102610:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102615:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10261c:	24 f0                	and    $0xf0,%al
  10261e:	0c 09                	or     $0x9,%al
  102620:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102625:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10262c:	0c 10                	or     $0x10,%al
  10262e:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102633:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10263a:	24 9f                	and    $0x9f,%al
  10263c:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102641:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102648:	0c 80                	or     $0x80,%al
  10264a:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10264f:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102656:	24 f0                	and    $0xf0,%al
  102658:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10265d:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102664:	24 ef                	and    $0xef,%al
  102666:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10266b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102672:	24 df                	and    $0xdf,%al
  102674:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102679:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102680:	0c 40                	or     $0x40,%al
  102682:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102687:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10268e:	24 7f                	and    $0x7f,%al
  102690:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102695:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10269a:	c1 e8 18             	shr    $0x18,%eax
  10269d:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  1026a2:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026a9:	24 ef                	and    $0xef,%al
  1026ab:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  1026b0:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  1026b7:	e8 e1 fe ff ff       	call   10259d <lgdt>
  1026bc:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  1026c2:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1026c6:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  1026c9:	90                   	nop
  1026ca:	c9                   	leave  
  1026cb:	c3                   	ret    

001026cc <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1026cc:	55                   	push   %ebp
  1026cd:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1026cf:	e8 ff fe ff ff       	call   1025d3 <gdt_init>
}
  1026d4:	90                   	nop
  1026d5:	5d                   	pop    %ebp
  1026d6:	c3                   	ret    

001026d7 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  1026d7:	55                   	push   %ebp
  1026d8:	89 e5                	mov    %esp,%ebp
  1026da:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1026dd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  1026e4:	eb 03                	jmp    1026e9 <strlen+0x12>
        cnt ++;
  1026e6:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  1026e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1026ec:	8d 50 01             	lea    0x1(%eax),%edx
  1026ef:	89 55 08             	mov    %edx,0x8(%ebp)
  1026f2:	0f b6 00             	movzbl (%eax),%eax
  1026f5:	84 c0                	test   %al,%al
  1026f7:	75 ed                	jne    1026e6 <strlen+0xf>
    }
    return cnt;
  1026f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1026fc:	c9                   	leave  
  1026fd:	c3                   	ret    

001026fe <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  1026fe:	55                   	push   %ebp
  1026ff:	89 e5                	mov    %esp,%ebp
  102701:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102704:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  10270b:	eb 03                	jmp    102710 <strnlen+0x12>
        cnt ++;
  10270d:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102710:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102713:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102716:	73 10                	jae    102728 <strnlen+0x2a>
  102718:	8b 45 08             	mov    0x8(%ebp),%eax
  10271b:	8d 50 01             	lea    0x1(%eax),%edx
  10271e:	89 55 08             	mov    %edx,0x8(%ebp)
  102721:	0f b6 00             	movzbl (%eax),%eax
  102724:	84 c0                	test   %al,%al
  102726:	75 e5                	jne    10270d <strnlen+0xf>
    }
    return cnt;
  102728:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10272b:	c9                   	leave  
  10272c:	c3                   	ret    

0010272d <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  10272d:	55                   	push   %ebp
  10272e:	89 e5                	mov    %esp,%ebp
  102730:	57                   	push   %edi
  102731:	56                   	push   %esi
  102732:	83 ec 20             	sub    $0x20,%esp
  102735:	8b 45 08             	mov    0x8(%ebp),%eax
  102738:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10273b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10273e:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102741:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102744:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102747:	89 d1                	mov    %edx,%ecx
  102749:	89 c2                	mov    %eax,%edx
  10274b:	89 ce                	mov    %ecx,%esi
  10274d:	89 d7                	mov    %edx,%edi
  10274f:	ac                   	lods   %ds:(%esi),%al
  102750:	aa                   	stos   %al,%es:(%edi)
  102751:	84 c0                	test   %al,%al
  102753:	75 fa                	jne    10274f <strcpy+0x22>
  102755:	89 fa                	mov    %edi,%edx
  102757:	89 f1                	mov    %esi,%ecx
  102759:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10275c:	89 55 e8             	mov    %edx,-0x18(%ebp)
  10275f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102762:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102765:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102766:	83 c4 20             	add    $0x20,%esp
  102769:	5e                   	pop    %esi
  10276a:	5f                   	pop    %edi
  10276b:	5d                   	pop    %ebp
  10276c:	c3                   	ret    

0010276d <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  10276d:	55                   	push   %ebp
  10276e:	89 e5                	mov    %esp,%ebp
  102770:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102773:	8b 45 08             	mov    0x8(%ebp),%eax
  102776:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102779:	eb 1e                	jmp    102799 <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  10277b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10277e:	0f b6 10             	movzbl (%eax),%edx
  102781:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102784:	88 10                	mov    %dl,(%eax)
  102786:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102789:	0f b6 00             	movzbl (%eax),%eax
  10278c:	84 c0                	test   %al,%al
  10278e:	74 03                	je     102793 <strncpy+0x26>
            src ++;
  102790:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102793:	ff 45 fc             	incl   -0x4(%ebp)
  102796:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102799:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10279d:	75 dc                	jne    10277b <strncpy+0xe>
    }
    return dst;
  10279f:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1027a2:	c9                   	leave  
  1027a3:	c3                   	ret    

001027a4 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  1027a4:	55                   	push   %ebp
  1027a5:	89 e5                	mov    %esp,%ebp
  1027a7:	57                   	push   %edi
  1027a8:	56                   	push   %esi
  1027a9:	83 ec 20             	sub    $0x20,%esp
  1027ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1027af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1027b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  1027b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1027bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027be:	89 d1                	mov    %edx,%ecx
  1027c0:	89 c2                	mov    %eax,%edx
  1027c2:	89 ce                	mov    %ecx,%esi
  1027c4:	89 d7                	mov    %edx,%edi
  1027c6:	ac                   	lods   %ds:(%esi),%al
  1027c7:	ae                   	scas   %es:(%edi),%al
  1027c8:	75 08                	jne    1027d2 <strcmp+0x2e>
  1027ca:	84 c0                	test   %al,%al
  1027cc:	75 f8                	jne    1027c6 <strcmp+0x22>
  1027ce:	31 c0                	xor    %eax,%eax
  1027d0:	eb 04                	jmp    1027d6 <strcmp+0x32>
  1027d2:	19 c0                	sbb    %eax,%eax
  1027d4:	0c 01                	or     $0x1,%al
  1027d6:	89 fa                	mov    %edi,%edx
  1027d8:	89 f1                	mov    %esi,%ecx
  1027da:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1027dd:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1027e0:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  1027e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  1027e6:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1027e7:	83 c4 20             	add    $0x20,%esp
  1027ea:	5e                   	pop    %esi
  1027eb:	5f                   	pop    %edi
  1027ec:	5d                   	pop    %ebp
  1027ed:	c3                   	ret    

001027ee <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1027ee:	55                   	push   %ebp
  1027ef:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1027f1:	eb 09                	jmp    1027fc <strncmp+0xe>
        n --, s1 ++, s2 ++;
  1027f3:	ff 4d 10             	decl   0x10(%ebp)
  1027f6:	ff 45 08             	incl   0x8(%ebp)
  1027f9:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1027fc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102800:	74 1a                	je     10281c <strncmp+0x2e>
  102802:	8b 45 08             	mov    0x8(%ebp),%eax
  102805:	0f b6 00             	movzbl (%eax),%eax
  102808:	84 c0                	test   %al,%al
  10280a:	74 10                	je     10281c <strncmp+0x2e>
  10280c:	8b 45 08             	mov    0x8(%ebp),%eax
  10280f:	0f b6 10             	movzbl (%eax),%edx
  102812:	8b 45 0c             	mov    0xc(%ebp),%eax
  102815:	0f b6 00             	movzbl (%eax),%eax
  102818:	38 c2                	cmp    %al,%dl
  10281a:	74 d7                	je     1027f3 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  10281c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102820:	74 18                	je     10283a <strncmp+0x4c>
  102822:	8b 45 08             	mov    0x8(%ebp),%eax
  102825:	0f b6 00             	movzbl (%eax),%eax
  102828:	0f b6 d0             	movzbl %al,%edx
  10282b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10282e:	0f b6 00             	movzbl (%eax),%eax
  102831:	0f b6 c0             	movzbl %al,%eax
  102834:	29 c2                	sub    %eax,%edx
  102836:	89 d0                	mov    %edx,%eax
  102838:	eb 05                	jmp    10283f <strncmp+0x51>
  10283a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10283f:	5d                   	pop    %ebp
  102840:	c3                   	ret    

00102841 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102841:	55                   	push   %ebp
  102842:	89 e5                	mov    %esp,%ebp
  102844:	83 ec 04             	sub    $0x4,%esp
  102847:	8b 45 0c             	mov    0xc(%ebp),%eax
  10284a:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10284d:	eb 13                	jmp    102862 <strchr+0x21>
        if (*s == c) {
  10284f:	8b 45 08             	mov    0x8(%ebp),%eax
  102852:	0f b6 00             	movzbl (%eax),%eax
  102855:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102858:	75 05                	jne    10285f <strchr+0x1e>
            return (char *)s;
  10285a:	8b 45 08             	mov    0x8(%ebp),%eax
  10285d:	eb 12                	jmp    102871 <strchr+0x30>
        }
        s ++;
  10285f:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102862:	8b 45 08             	mov    0x8(%ebp),%eax
  102865:	0f b6 00             	movzbl (%eax),%eax
  102868:	84 c0                	test   %al,%al
  10286a:	75 e3                	jne    10284f <strchr+0xe>
    }
    return NULL;
  10286c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102871:	c9                   	leave  
  102872:	c3                   	ret    

00102873 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102873:	55                   	push   %ebp
  102874:	89 e5                	mov    %esp,%ebp
  102876:	83 ec 04             	sub    $0x4,%esp
  102879:	8b 45 0c             	mov    0xc(%ebp),%eax
  10287c:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10287f:	eb 0e                	jmp    10288f <strfind+0x1c>
        if (*s == c) {
  102881:	8b 45 08             	mov    0x8(%ebp),%eax
  102884:	0f b6 00             	movzbl (%eax),%eax
  102887:	38 45 fc             	cmp    %al,-0x4(%ebp)
  10288a:	74 0f                	je     10289b <strfind+0x28>
            break;
        }
        s ++;
  10288c:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  10288f:	8b 45 08             	mov    0x8(%ebp),%eax
  102892:	0f b6 00             	movzbl (%eax),%eax
  102895:	84 c0                	test   %al,%al
  102897:	75 e8                	jne    102881 <strfind+0xe>
  102899:	eb 01                	jmp    10289c <strfind+0x29>
            break;
  10289b:	90                   	nop
    }
    return (char *)s;
  10289c:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10289f:	c9                   	leave  
  1028a0:	c3                   	ret    

001028a1 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  1028a1:	55                   	push   %ebp
  1028a2:	89 e5                	mov    %esp,%ebp
  1028a4:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  1028a7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  1028ae:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1028b5:	eb 03                	jmp    1028ba <strtol+0x19>
        s ++;
  1028b7:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  1028ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1028bd:	0f b6 00             	movzbl (%eax),%eax
  1028c0:	3c 20                	cmp    $0x20,%al
  1028c2:	74 f3                	je     1028b7 <strtol+0x16>
  1028c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1028c7:	0f b6 00             	movzbl (%eax),%eax
  1028ca:	3c 09                	cmp    $0x9,%al
  1028cc:	74 e9                	je     1028b7 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  1028ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1028d1:	0f b6 00             	movzbl (%eax),%eax
  1028d4:	3c 2b                	cmp    $0x2b,%al
  1028d6:	75 05                	jne    1028dd <strtol+0x3c>
        s ++;
  1028d8:	ff 45 08             	incl   0x8(%ebp)
  1028db:	eb 14                	jmp    1028f1 <strtol+0x50>
    }
    else if (*s == '-') {
  1028dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1028e0:	0f b6 00             	movzbl (%eax),%eax
  1028e3:	3c 2d                	cmp    $0x2d,%al
  1028e5:	75 0a                	jne    1028f1 <strtol+0x50>
        s ++, neg = 1;
  1028e7:	ff 45 08             	incl   0x8(%ebp)
  1028ea:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  1028f1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1028f5:	74 06                	je     1028fd <strtol+0x5c>
  1028f7:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1028fb:	75 22                	jne    10291f <strtol+0x7e>
  1028fd:	8b 45 08             	mov    0x8(%ebp),%eax
  102900:	0f b6 00             	movzbl (%eax),%eax
  102903:	3c 30                	cmp    $0x30,%al
  102905:	75 18                	jne    10291f <strtol+0x7e>
  102907:	8b 45 08             	mov    0x8(%ebp),%eax
  10290a:	40                   	inc    %eax
  10290b:	0f b6 00             	movzbl (%eax),%eax
  10290e:	3c 78                	cmp    $0x78,%al
  102910:	75 0d                	jne    10291f <strtol+0x7e>
        s += 2, base = 16;
  102912:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102916:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10291d:	eb 29                	jmp    102948 <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  10291f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102923:	75 16                	jne    10293b <strtol+0x9a>
  102925:	8b 45 08             	mov    0x8(%ebp),%eax
  102928:	0f b6 00             	movzbl (%eax),%eax
  10292b:	3c 30                	cmp    $0x30,%al
  10292d:	75 0c                	jne    10293b <strtol+0x9a>
        s ++, base = 8;
  10292f:	ff 45 08             	incl   0x8(%ebp)
  102932:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102939:	eb 0d                	jmp    102948 <strtol+0xa7>
    }
    else if (base == 0) {
  10293b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10293f:	75 07                	jne    102948 <strtol+0xa7>
        base = 10;
  102941:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102948:	8b 45 08             	mov    0x8(%ebp),%eax
  10294b:	0f b6 00             	movzbl (%eax),%eax
  10294e:	3c 2f                	cmp    $0x2f,%al
  102950:	7e 1b                	jle    10296d <strtol+0xcc>
  102952:	8b 45 08             	mov    0x8(%ebp),%eax
  102955:	0f b6 00             	movzbl (%eax),%eax
  102958:	3c 39                	cmp    $0x39,%al
  10295a:	7f 11                	jg     10296d <strtol+0xcc>
            dig = *s - '0';
  10295c:	8b 45 08             	mov    0x8(%ebp),%eax
  10295f:	0f b6 00             	movzbl (%eax),%eax
  102962:	0f be c0             	movsbl %al,%eax
  102965:	83 e8 30             	sub    $0x30,%eax
  102968:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10296b:	eb 48                	jmp    1029b5 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  10296d:	8b 45 08             	mov    0x8(%ebp),%eax
  102970:	0f b6 00             	movzbl (%eax),%eax
  102973:	3c 60                	cmp    $0x60,%al
  102975:	7e 1b                	jle    102992 <strtol+0xf1>
  102977:	8b 45 08             	mov    0x8(%ebp),%eax
  10297a:	0f b6 00             	movzbl (%eax),%eax
  10297d:	3c 7a                	cmp    $0x7a,%al
  10297f:	7f 11                	jg     102992 <strtol+0xf1>
            dig = *s - 'a' + 10;
  102981:	8b 45 08             	mov    0x8(%ebp),%eax
  102984:	0f b6 00             	movzbl (%eax),%eax
  102987:	0f be c0             	movsbl %al,%eax
  10298a:	83 e8 57             	sub    $0x57,%eax
  10298d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102990:	eb 23                	jmp    1029b5 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102992:	8b 45 08             	mov    0x8(%ebp),%eax
  102995:	0f b6 00             	movzbl (%eax),%eax
  102998:	3c 40                	cmp    $0x40,%al
  10299a:	7e 3b                	jle    1029d7 <strtol+0x136>
  10299c:	8b 45 08             	mov    0x8(%ebp),%eax
  10299f:	0f b6 00             	movzbl (%eax),%eax
  1029a2:	3c 5a                	cmp    $0x5a,%al
  1029a4:	7f 31                	jg     1029d7 <strtol+0x136>
            dig = *s - 'A' + 10;
  1029a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1029a9:	0f b6 00             	movzbl (%eax),%eax
  1029ac:	0f be c0             	movsbl %al,%eax
  1029af:	83 e8 37             	sub    $0x37,%eax
  1029b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  1029b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029b8:	3b 45 10             	cmp    0x10(%ebp),%eax
  1029bb:	7d 19                	jge    1029d6 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  1029bd:	ff 45 08             	incl   0x8(%ebp)
  1029c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1029c3:	0f af 45 10          	imul   0x10(%ebp),%eax
  1029c7:	89 c2                	mov    %eax,%edx
  1029c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1029cc:	01 d0                	add    %edx,%eax
  1029ce:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  1029d1:	e9 72 ff ff ff       	jmp    102948 <strtol+0xa7>
            break;
  1029d6:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  1029d7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1029db:	74 08                	je     1029e5 <strtol+0x144>
        *endptr = (char *) s;
  1029dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029e0:	8b 55 08             	mov    0x8(%ebp),%edx
  1029e3:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  1029e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1029e9:	74 07                	je     1029f2 <strtol+0x151>
  1029eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1029ee:	f7 d8                	neg    %eax
  1029f0:	eb 03                	jmp    1029f5 <strtol+0x154>
  1029f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1029f5:	c9                   	leave  
  1029f6:	c3                   	ret    

001029f7 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  1029f7:	55                   	push   %ebp
  1029f8:	89 e5                	mov    %esp,%ebp
  1029fa:	57                   	push   %edi
  1029fb:	83 ec 24             	sub    $0x24,%esp
  1029fe:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a01:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102a04:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102a08:	8b 55 08             	mov    0x8(%ebp),%edx
  102a0b:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102a0e:	88 45 f7             	mov    %al,-0x9(%ebp)
  102a11:	8b 45 10             	mov    0x10(%ebp),%eax
  102a14:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102a17:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102a1a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102a1e:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102a21:	89 d7                	mov    %edx,%edi
  102a23:	f3 aa                	rep stos %al,%es:(%edi)
  102a25:	89 fa                	mov    %edi,%edx
  102a27:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102a2a:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102a2d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a30:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102a31:	83 c4 24             	add    $0x24,%esp
  102a34:	5f                   	pop    %edi
  102a35:	5d                   	pop    %ebp
  102a36:	c3                   	ret    

00102a37 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102a37:	55                   	push   %ebp
  102a38:	89 e5                	mov    %esp,%ebp
  102a3a:	57                   	push   %edi
  102a3b:	56                   	push   %esi
  102a3c:	53                   	push   %ebx
  102a3d:	83 ec 30             	sub    $0x30,%esp
  102a40:	8b 45 08             	mov    0x8(%ebp),%eax
  102a43:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102a46:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a49:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102a4c:	8b 45 10             	mov    0x10(%ebp),%eax
  102a4f:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102a52:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a55:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102a58:	73 42                	jae    102a9c <memmove+0x65>
  102a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102a5d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102a60:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102a63:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102a66:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102a69:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102a6c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102a6f:	c1 e8 02             	shr    $0x2,%eax
  102a72:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102a74:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102a77:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102a7a:	89 d7                	mov    %edx,%edi
  102a7c:	89 c6                	mov    %eax,%esi
  102a7e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102a80:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102a83:	83 e1 03             	and    $0x3,%ecx
  102a86:	74 02                	je     102a8a <memmove+0x53>
  102a88:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102a8a:	89 f0                	mov    %esi,%eax
  102a8c:	89 fa                	mov    %edi,%edx
  102a8e:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102a91:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102a94:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102a97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102a9a:	eb 36                	jmp    102ad2 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102a9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102a9f:	8d 50 ff             	lea    -0x1(%eax),%edx
  102aa2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102aa5:	01 c2                	add    %eax,%edx
  102aa7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102aaa:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102aad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ab0:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102ab3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ab6:	89 c1                	mov    %eax,%ecx
  102ab8:	89 d8                	mov    %ebx,%eax
  102aba:	89 d6                	mov    %edx,%esi
  102abc:	89 c7                	mov    %eax,%edi
  102abe:	fd                   	std    
  102abf:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ac1:	fc                   	cld    
  102ac2:	89 f8                	mov    %edi,%eax
  102ac4:	89 f2                	mov    %esi,%edx
  102ac6:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102ac9:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102acc:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102acf:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102ad2:	83 c4 30             	add    $0x30,%esp
  102ad5:	5b                   	pop    %ebx
  102ad6:	5e                   	pop    %esi
  102ad7:	5f                   	pop    %edi
  102ad8:	5d                   	pop    %ebp
  102ad9:	c3                   	ret    

00102ada <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102ada:	55                   	push   %ebp
  102adb:	89 e5                	mov    %esp,%ebp
  102add:	57                   	push   %edi
  102ade:	56                   	push   %esi
  102adf:	83 ec 20             	sub    $0x20,%esp
  102ae2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ae8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102aeb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102aee:	8b 45 10             	mov    0x10(%ebp),%eax
  102af1:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102af4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102af7:	c1 e8 02             	shr    $0x2,%eax
  102afa:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102afc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102aff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b02:	89 d7                	mov    %edx,%edi
  102b04:	89 c6                	mov    %eax,%esi
  102b06:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102b08:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102b0b:	83 e1 03             	and    $0x3,%ecx
  102b0e:	74 02                	je     102b12 <memcpy+0x38>
  102b10:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102b12:	89 f0                	mov    %esi,%eax
  102b14:	89 fa                	mov    %edi,%edx
  102b16:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102b19:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102b1c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102b1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102b22:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102b23:	83 c4 20             	add    $0x20,%esp
  102b26:	5e                   	pop    %esi
  102b27:	5f                   	pop    %edi
  102b28:	5d                   	pop    %ebp
  102b29:	c3                   	ret    

00102b2a <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102b2a:	55                   	push   %ebp
  102b2b:	89 e5                	mov    %esp,%ebp
  102b2d:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102b30:	8b 45 08             	mov    0x8(%ebp),%eax
  102b33:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102b36:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b39:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102b3c:	eb 2e                	jmp    102b6c <memcmp+0x42>
        if (*s1 != *s2) {
  102b3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b41:	0f b6 10             	movzbl (%eax),%edx
  102b44:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b47:	0f b6 00             	movzbl (%eax),%eax
  102b4a:	38 c2                	cmp    %al,%dl
  102b4c:	74 18                	je     102b66 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102b4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b51:	0f b6 00             	movzbl (%eax),%eax
  102b54:	0f b6 d0             	movzbl %al,%edx
  102b57:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b5a:	0f b6 00             	movzbl (%eax),%eax
  102b5d:	0f b6 c0             	movzbl %al,%eax
  102b60:	29 c2                	sub    %eax,%edx
  102b62:	89 d0                	mov    %edx,%eax
  102b64:	eb 18                	jmp    102b7e <memcmp+0x54>
        }
        s1 ++, s2 ++;
  102b66:	ff 45 fc             	incl   -0x4(%ebp)
  102b69:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102b6c:	8b 45 10             	mov    0x10(%ebp),%eax
  102b6f:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b72:	89 55 10             	mov    %edx,0x10(%ebp)
  102b75:	85 c0                	test   %eax,%eax
  102b77:	75 c5                	jne    102b3e <memcmp+0x14>
    }
    return 0;
  102b79:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102b7e:	c9                   	leave  
  102b7f:	c3                   	ret    

00102b80 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102b80:	55                   	push   %ebp
  102b81:	89 e5                	mov    %esp,%ebp
  102b83:	83 ec 58             	sub    $0x58,%esp
  102b86:	8b 45 10             	mov    0x10(%ebp),%eax
  102b89:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102b8c:	8b 45 14             	mov    0x14(%ebp),%eax
  102b8f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102b92:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102b95:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102b98:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102b9b:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102b9e:	8b 45 18             	mov    0x18(%ebp),%eax
  102ba1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102ba4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ba7:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102baa:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102bad:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102bb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bb6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102bba:	74 1c                	je     102bd8 <printnum+0x58>
  102bbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bbf:	ba 00 00 00 00       	mov    $0x0,%edx
  102bc4:	f7 75 e4             	divl   -0x1c(%ebp)
  102bc7:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102bca:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bcd:	ba 00 00 00 00       	mov    $0x0,%edx
  102bd2:	f7 75 e4             	divl   -0x1c(%ebp)
  102bd5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bd8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102bdb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bde:	f7 75 e4             	divl   -0x1c(%ebp)
  102be1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102be4:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102be7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102bea:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102bed:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102bf0:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102bf3:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102bf6:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102bf9:	8b 45 18             	mov    0x18(%ebp),%eax
  102bfc:	ba 00 00 00 00       	mov    $0x0,%edx
  102c01:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  102c04:	72 56                	jb     102c5c <printnum+0xdc>
  102c06:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  102c09:	77 05                	ja     102c10 <printnum+0x90>
  102c0b:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102c0e:	72 4c                	jb     102c5c <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102c10:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102c13:	8d 50 ff             	lea    -0x1(%eax),%edx
  102c16:	8b 45 20             	mov    0x20(%ebp),%eax
  102c19:	89 44 24 18          	mov    %eax,0x18(%esp)
  102c1d:	89 54 24 14          	mov    %edx,0x14(%esp)
  102c21:	8b 45 18             	mov    0x18(%ebp),%eax
  102c24:	89 44 24 10          	mov    %eax,0x10(%esp)
  102c28:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c2b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102c2e:	89 44 24 08          	mov    %eax,0x8(%esp)
  102c32:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102c36:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c39:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c40:	89 04 24             	mov    %eax,(%esp)
  102c43:	e8 38 ff ff ff       	call   102b80 <printnum>
  102c48:	eb 1b                	jmp    102c65 <printnum+0xe5>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102c4a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c4d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c51:	8b 45 20             	mov    0x20(%ebp),%eax
  102c54:	89 04 24             	mov    %eax,(%esp)
  102c57:	8b 45 08             	mov    0x8(%ebp),%eax
  102c5a:	ff d0                	call   *%eax
        while (-- width > 0)
  102c5c:	ff 4d 1c             	decl   0x1c(%ebp)
  102c5f:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102c63:	7f e5                	jg     102c4a <printnum+0xca>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102c65:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102c68:	05 70 39 10 00       	add    $0x103970,%eax
  102c6d:	0f b6 00             	movzbl (%eax),%eax
  102c70:	0f be c0             	movsbl %al,%eax
  102c73:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c76:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c7a:	89 04 24             	mov    %eax,(%esp)
  102c7d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c80:	ff d0                	call   *%eax
}
  102c82:	90                   	nop
  102c83:	c9                   	leave  
  102c84:	c3                   	ret    

00102c85 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102c85:	55                   	push   %ebp
  102c86:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102c88:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102c8c:	7e 14                	jle    102ca2 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102c8e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c91:	8b 00                	mov    (%eax),%eax
  102c93:	8d 48 08             	lea    0x8(%eax),%ecx
  102c96:	8b 55 08             	mov    0x8(%ebp),%edx
  102c99:	89 0a                	mov    %ecx,(%edx)
  102c9b:	8b 50 04             	mov    0x4(%eax),%edx
  102c9e:	8b 00                	mov    (%eax),%eax
  102ca0:	eb 30                	jmp    102cd2 <getuint+0x4d>
    }
    else if (lflag) {
  102ca2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102ca6:	74 16                	je     102cbe <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102ca8:	8b 45 08             	mov    0x8(%ebp),%eax
  102cab:	8b 00                	mov    (%eax),%eax
  102cad:	8d 48 04             	lea    0x4(%eax),%ecx
  102cb0:	8b 55 08             	mov    0x8(%ebp),%edx
  102cb3:	89 0a                	mov    %ecx,(%edx)
  102cb5:	8b 00                	mov    (%eax),%eax
  102cb7:	ba 00 00 00 00       	mov    $0x0,%edx
  102cbc:	eb 14                	jmp    102cd2 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102cbe:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc1:	8b 00                	mov    (%eax),%eax
  102cc3:	8d 48 04             	lea    0x4(%eax),%ecx
  102cc6:	8b 55 08             	mov    0x8(%ebp),%edx
  102cc9:	89 0a                	mov    %ecx,(%edx)
  102ccb:	8b 00                	mov    (%eax),%eax
  102ccd:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102cd2:	5d                   	pop    %ebp
  102cd3:	c3                   	ret    

00102cd4 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102cd4:	55                   	push   %ebp
  102cd5:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102cd7:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102cdb:	7e 14                	jle    102cf1 <getint+0x1d>
        return va_arg(*ap, long long);
  102cdd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce0:	8b 00                	mov    (%eax),%eax
  102ce2:	8d 48 08             	lea    0x8(%eax),%ecx
  102ce5:	8b 55 08             	mov    0x8(%ebp),%edx
  102ce8:	89 0a                	mov    %ecx,(%edx)
  102cea:	8b 50 04             	mov    0x4(%eax),%edx
  102ced:	8b 00                	mov    (%eax),%eax
  102cef:	eb 28                	jmp    102d19 <getint+0x45>
    }
    else if (lflag) {
  102cf1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102cf5:	74 12                	je     102d09 <getint+0x35>
        return va_arg(*ap, long);
  102cf7:	8b 45 08             	mov    0x8(%ebp),%eax
  102cfa:	8b 00                	mov    (%eax),%eax
  102cfc:	8d 48 04             	lea    0x4(%eax),%ecx
  102cff:	8b 55 08             	mov    0x8(%ebp),%edx
  102d02:	89 0a                	mov    %ecx,(%edx)
  102d04:	8b 00                	mov    (%eax),%eax
  102d06:	99                   	cltd   
  102d07:	eb 10                	jmp    102d19 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102d09:	8b 45 08             	mov    0x8(%ebp),%eax
  102d0c:	8b 00                	mov    (%eax),%eax
  102d0e:	8d 48 04             	lea    0x4(%eax),%ecx
  102d11:	8b 55 08             	mov    0x8(%ebp),%edx
  102d14:	89 0a                	mov    %ecx,(%edx)
  102d16:	8b 00                	mov    (%eax),%eax
  102d18:	99                   	cltd   
    }
}
  102d19:	5d                   	pop    %ebp
  102d1a:	c3                   	ret    

00102d1b <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102d1b:	55                   	push   %ebp
  102d1c:	89 e5                	mov    %esp,%ebp
  102d1e:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102d21:	8d 45 14             	lea    0x14(%ebp),%eax
  102d24:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102d27:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d2a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102d2e:	8b 45 10             	mov    0x10(%ebp),%eax
  102d31:	89 44 24 08          	mov    %eax,0x8(%esp)
  102d35:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d38:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3f:	89 04 24             	mov    %eax,(%esp)
  102d42:	e8 03 00 00 00       	call   102d4a <vprintfmt>
    va_end(ap);
}
  102d47:	90                   	nop
  102d48:	c9                   	leave  
  102d49:	c3                   	ret    

00102d4a <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102d4a:	55                   	push   %ebp
  102d4b:	89 e5                	mov    %esp,%ebp
  102d4d:	56                   	push   %esi
  102d4e:	53                   	push   %ebx
  102d4f:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102d52:	eb 17                	jmp    102d6b <vprintfmt+0x21>
            if (ch == '\0') {
  102d54:	85 db                	test   %ebx,%ebx
  102d56:	0f 84 bf 03 00 00    	je     10311b <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  102d5c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d5f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d63:	89 1c 24             	mov    %ebx,(%esp)
  102d66:	8b 45 08             	mov    0x8(%ebp),%eax
  102d69:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102d6b:	8b 45 10             	mov    0x10(%ebp),%eax
  102d6e:	8d 50 01             	lea    0x1(%eax),%edx
  102d71:	89 55 10             	mov    %edx,0x10(%ebp)
  102d74:	0f b6 00             	movzbl (%eax),%eax
  102d77:	0f b6 d8             	movzbl %al,%ebx
  102d7a:	83 fb 25             	cmp    $0x25,%ebx
  102d7d:	75 d5                	jne    102d54 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102d7f:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102d83:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102d8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102d8d:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102d90:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102d97:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102d9a:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102d9d:	8b 45 10             	mov    0x10(%ebp),%eax
  102da0:	8d 50 01             	lea    0x1(%eax),%edx
  102da3:	89 55 10             	mov    %edx,0x10(%ebp)
  102da6:	0f b6 00             	movzbl (%eax),%eax
  102da9:	0f b6 d8             	movzbl %al,%ebx
  102dac:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102daf:	83 f8 55             	cmp    $0x55,%eax
  102db2:	0f 87 37 03 00 00    	ja     1030ef <vprintfmt+0x3a5>
  102db8:	8b 04 85 94 39 10 00 	mov    0x103994(,%eax,4),%eax
  102dbf:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102dc1:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102dc5:	eb d6                	jmp    102d9d <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102dc7:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102dcb:	eb d0                	jmp    102d9d <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102dcd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102dd4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102dd7:	89 d0                	mov    %edx,%eax
  102dd9:	c1 e0 02             	shl    $0x2,%eax
  102ddc:	01 d0                	add    %edx,%eax
  102dde:	01 c0                	add    %eax,%eax
  102de0:	01 d8                	add    %ebx,%eax
  102de2:	83 e8 30             	sub    $0x30,%eax
  102de5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102de8:	8b 45 10             	mov    0x10(%ebp),%eax
  102deb:	0f b6 00             	movzbl (%eax),%eax
  102dee:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102df1:	83 fb 2f             	cmp    $0x2f,%ebx
  102df4:	7e 38                	jle    102e2e <vprintfmt+0xe4>
  102df6:	83 fb 39             	cmp    $0x39,%ebx
  102df9:	7f 33                	jg     102e2e <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  102dfb:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102dfe:	eb d4                	jmp    102dd4 <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102e00:	8b 45 14             	mov    0x14(%ebp),%eax
  102e03:	8d 50 04             	lea    0x4(%eax),%edx
  102e06:	89 55 14             	mov    %edx,0x14(%ebp)
  102e09:	8b 00                	mov    (%eax),%eax
  102e0b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102e0e:	eb 1f                	jmp    102e2f <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  102e10:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e14:	79 87                	jns    102d9d <vprintfmt+0x53>
                width = 0;
  102e16:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102e1d:	e9 7b ff ff ff       	jmp    102d9d <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102e22:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102e29:	e9 6f ff ff ff       	jmp    102d9d <vprintfmt+0x53>
            goto process_precision;
  102e2e:	90                   	nop

        process_precision:
            if (width < 0)
  102e2f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e33:	0f 89 64 ff ff ff    	jns    102d9d <vprintfmt+0x53>
                width = precision, precision = -1;
  102e39:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e3c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e3f:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102e46:	e9 52 ff ff ff       	jmp    102d9d <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102e4b:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  102e4e:	e9 4a ff ff ff       	jmp    102d9d <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102e53:	8b 45 14             	mov    0x14(%ebp),%eax
  102e56:	8d 50 04             	lea    0x4(%eax),%edx
  102e59:	89 55 14             	mov    %edx,0x14(%ebp)
  102e5c:	8b 00                	mov    (%eax),%eax
  102e5e:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e61:	89 54 24 04          	mov    %edx,0x4(%esp)
  102e65:	89 04 24             	mov    %eax,(%esp)
  102e68:	8b 45 08             	mov    0x8(%ebp),%eax
  102e6b:	ff d0                	call   *%eax
            break;
  102e6d:	e9 a4 02 00 00       	jmp    103116 <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102e72:	8b 45 14             	mov    0x14(%ebp),%eax
  102e75:	8d 50 04             	lea    0x4(%eax),%edx
  102e78:	89 55 14             	mov    %edx,0x14(%ebp)
  102e7b:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102e7d:	85 db                	test   %ebx,%ebx
  102e7f:	79 02                	jns    102e83 <vprintfmt+0x139>
                err = -err;
  102e81:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102e83:	83 fb 06             	cmp    $0x6,%ebx
  102e86:	7f 0b                	jg     102e93 <vprintfmt+0x149>
  102e88:	8b 34 9d 54 39 10 00 	mov    0x103954(,%ebx,4),%esi
  102e8f:	85 f6                	test   %esi,%esi
  102e91:	75 23                	jne    102eb6 <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  102e93:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102e97:	c7 44 24 08 81 39 10 	movl   $0x103981,0x8(%esp)
  102e9e:	00 
  102e9f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ea2:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ea6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ea9:	89 04 24             	mov    %eax,(%esp)
  102eac:	e8 6a fe ff ff       	call   102d1b <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102eb1:	e9 60 02 00 00       	jmp    103116 <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  102eb6:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102eba:	c7 44 24 08 8a 39 10 	movl   $0x10398a,0x8(%esp)
  102ec1:	00 
  102ec2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec5:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ec9:	8b 45 08             	mov    0x8(%ebp),%eax
  102ecc:	89 04 24             	mov    %eax,(%esp)
  102ecf:	e8 47 fe ff ff       	call   102d1b <printfmt>
            break;
  102ed4:	e9 3d 02 00 00       	jmp    103116 <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102ed9:	8b 45 14             	mov    0x14(%ebp),%eax
  102edc:	8d 50 04             	lea    0x4(%eax),%edx
  102edf:	89 55 14             	mov    %edx,0x14(%ebp)
  102ee2:	8b 30                	mov    (%eax),%esi
  102ee4:	85 f6                	test   %esi,%esi
  102ee6:	75 05                	jne    102eed <vprintfmt+0x1a3>
                p = "(null)";
  102ee8:	be 8d 39 10 00       	mov    $0x10398d,%esi
            }
            if (width > 0 && padc != '-') {
  102eed:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ef1:	7e 76                	jle    102f69 <vprintfmt+0x21f>
  102ef3:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102ef7:	74 70                	je     102f69 <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102ef9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102efc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f00:	89 34 24             	mov    %esi,(%esp)
  102f03:	e8 f6 f7 ff ff       	call   1026fe <strnlen>
  102f08:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102f0b:	29 c2                	sub    %eax,%edx
  102f0d:	89 d0                	mov    %edx,%eax
  102f0f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f12:	eb 16                	jmp    102f2a <vprintfmt+0x1e0>
                    putch(padc, putdat);
  102f14:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102f18:	8b 55 0c             	mov    0xc(%ebp),%edx
  102f1b:	89 54 24 04          	mov    %edx,0x4(%esp)
  102f1f:	89 04 24             	mov    %eax,(%esp)
  102f22:	8b 45 08             	mov    0x8(%ebp),%eax
  102f25:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  102f27:	ff 4d e8             	decl   -0x18(%ebp)
  102f2a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f2e:	7f e4                	jg     102f14 <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102f30:	eb 37                	jmp    102f69 <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  102f32:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102f36:	74 1f                	je     102f57 <vprintfmt+0x20d>
  102f38:	83 fb 1f             	cmp    $0x1f,%ebx
  102f3b:	7e 05                	jle    102f42 <vprintfmt+0x1f8>
  102f3d:	83 fb 7e             	cmp    $0x7e,%ebx
  102f40:	7e 15                	jle    102f57 <vprintfmt+0x20d>
                    putch('?', putdat);
  102f42:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f45:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f49:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102f50:	8b 45 08             	mov    0x8(%ebp),%eax
  102f53:	ff d0                	call   *%eax
  102f55:	eb 0f                	jmp    102f66 <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  102f57:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f5a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f5e:	89 1c 24             	mov    %ebx,(%esp)
  102f61:	8b 45 08             	mov    0x8(%ebp),%eax
  102f64:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102f66:	ff 4d e8             	decl   -0x18(%ebp)
  102f69:	89 f0                	mov    %esi,%eax
  102f6b:	8d 70 01             	lea    0x1(%eax),%esi
  102f6e:	0f b6 00             	movzbl (%eax),%eax
  102f71:	0f be d8             	movsbl %al,%ebx
  102f74:	85 db                	test   %ebx,%ebx
  102f76:	74 27                	je     102f9f <vprintfmt+0x255>
  102f78:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102f7c:	78 b4                	js     102f32 <vprintfmt+0x1e8>
  102f7e:	ff 4d e4             	decl   -0x1c(%ebp)
  102f81:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102f85:	79 ab                	jns    102f32 <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  102f87:	eb 16                	jmp    102f9f <vprintfmt+0x255>
                putch(' ', putdat);
  102f89:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f8c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f90:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102f97:	8b 45 08             	mov    0x8(%ebp),%eax
  102f9a:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  102f9c:	ff 4d e8             	decl   -0x18(%ebp)
  102f9f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fa3:	7f e4                	jg     102f89 <vprintfmt+0x23f>
            }
            break;
  102fa5:	e9 6c 01 00 00       	jmp    103116 <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102faa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fad:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fb1:	8d 45 14             	lea    0x14(%ebp),%eax
  102fb4:	89 04 24             	mov    %eax,(%esp)
  102fb7:	e8 18 fd ff ff       	call   102cd4 <getint>
  102fbc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fbf:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102fc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fc5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fc8:	85 d2                	test   %edx,%edx
  102fca:	79 26                	jns    102ff2 <vprintfmt+0x2a8>
                putch('-', putdat);
  102fcc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fcf:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fd3:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102fda:	8b 45 08             	mov    0x8(%ebp),%eax
  102fdd:	ff d0                	call   *%eax
                num = -(long long)num;
  102fdf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fe2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fe5:	f7 d8                	neg    %eax
  102fe7:	83 d2 00             	adc    $0x0,%edx
  102fea:	f7 da                	neg    %edx
  102fec:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fef:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102ff2:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102ff9:	e9 a8 00 00 00       	jmp    1030a6 <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102ffe:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103001:	89 44 24 04          	mov    %eax,0x4(%esp)
  103005:	8d 45 14             	lea    0x14(%ebp),%eax
  103008:	89 04 24             	mov    %eax,(%esp)
  10300b:	e8 75 fc ff ff       	call   102c85 <getuint>
  103010:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103013:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103016:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10301d:	e9 84 00 00 00       	jmp    1030a6 <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103022:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103025:	89 44 24 04          	mov    %eax,0x4(%esp)
  103029:	8d 45 14             	lea    0x14(%ebp),%eax
  10302c:	89 04 24             	mov    %eax,(%esp)
  10302f:	e8 51 fc ff ff       	call   102c85 <getuint>
  103034:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103037:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  10303a:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103041:	eb 63                	jmp    1030a6 <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  103043:	8b 45 0c             	mov    0xc(%ebp),%eax
  103046:	89 44 24 04          	mov    %eax,0x4(%esp)
  10304a:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103051:	8b 45 08             	mov    0x8(%ebp),%eax
  103054:	ff d0                	call   *%eax
            putch('x', putdat);
  103056:	8b 45 0c             	mov    0xc(%ebp),%eax
  103059:	89 44 24 04          	mov    %eax,0x4(%esp)
  10305d:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103064:	8b 45 08             	mov    0x8(%ebp),%eax
  103067:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103069:	8b 45 14             	mov    0x14(%ebp),%eax
  10306c:	8d 50 04             	lea    0x4(%eax),%edx
  10306f:	89 55 14             	mov    %edx,0x14(%ebp)
  103072:	8b 00                	mov    (%eax),%eax
  103074:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103077:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10307e:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103085:	eb 1f                	jmp    1030a6 <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103087:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10308a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10308e:	8d 45 14             	lea    0x14(%ebp),%eax
  103091:	89 04 24             	mov    %eax,(%esp)
  103094:	e8 ec fb ff ff       	call   102c85 <getuint>
  103099:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10309c:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10309f:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1030a6:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1030aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1030ad:	89 54 24 18          	mov    %edx,0x18(%esp)
  1030b1:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1030b4:	89 54 24 14          	mov    %edx,0x14(%esp)
  1030b8:	89 44 24 10          	mov    %eax,0x10(%esp)
  1030bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030c2:	89 44 24 08          	mov    %eax,0x8(%esp)
  1030c6:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1030ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d4:	89 04 24             	mov    %eax,(%esp)
  1030d7:	e8 a4 fa ff ff       	call   102b80 <printnum>
            break;
  1030dc:	eb 38                	jmp    103116 <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1030de:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030e1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030e5:	89 1c 24             	mov    %ebx,(%esp)
  1030e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1030eb:	ff d0                	call   *%eax
            break;
  1030ed:	eb 27                	jmp    103116 <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1030ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030f6:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1030fd:	8b 45 08             	mov    0x8(%ebp),%eax
  103100:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  103102:	ff 4d 10             	decl   0x10(%ebp)
  103105:	eb 03                	jmp    10310a <vprintfmt+0x3c0>
  103107:	ff 4d 10             	decl   0x10(%ebp)
  10310a:	8b 45 10             	mov    0x10(%ebp),%eax
  10310d:	48                   	dec    %eax
  10310e:	0f b6 00             	movzbl (%eax),%eax
  103111:	3c 25                	cmp    $0x25,%al
  103113:	75 f2                	jne    103107 <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  103115:	90                   	nop
    while (1) {
  103116:	e9 37 fc ff ff       	jmp    102d52 <vprintfmt+0x8>
                return;
  10311b:	90                   	nop
        }
    }
}
  10311c:	83 c4 40             	add    $0x40,%esp
  10311f:	5b                   	pop    %ebx
  103120:	5e                   	pop    %esi
  103121:	5d                   	pop    %ebp
  103122:	c3                   	ret    

00103123 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103123:	55                   	push   %ebp
  103124:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103126:	8b 45 0c             	mov    0xc(%ebp),%eax
  103129:	8b 40 08             	mov    0x8(%eax),%eax
  10312c:	8d 50 01             	lea    0x1(%eax),%edx
  10312f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103132:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103135:	8b 45 0c             	mov    0xc(%ebp),%eax
  103138:	8b 10                	mov    (%eax),%edx
  10313a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10313d:	8b 40 04             	mov    0x4(%eax),%eax
  103140:	39 c2                	cmp    %eax,%edx
  103142:	73 12                	jae    103156 <sprintputch+0x33>
        *b->buf ++ = ch;
  103144:	8b 45 0c             	mov    0xc(%ebp),%eax
  103147:	8b 00                	mov    (%eax),%eax
  103149:	8d 48 01             	lea    0x1(%eax),%ecx
  10314c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10314f:	89 0a                	mov    %ecx,(%edx)
  103151:	8b 55 08             	mov    0x8(%ebp),%edx
  103154:	88 10                	mov    %dl,(%eax)
    }
}
  103156:	90                   	nop
  103157:	5d                   	pop    %ebp
  103158:	c3                   	ret    

00103159 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103159:	55                   	push   %ebp
  10315a:	89 e5                	mov    %esp,%ebp
  10315c:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10315f:	8d 45 14             	lea    0x14(%ebp),%eax
  103162:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103165:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103168:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10316c:	8b 45 10             	mov    0x10(%ebp),%eax
  10316f:	89 44 24 08          	mov    %eax,0x8(%esp)
  103173:	8b 45 0c             	mov    0xc(%ebp),%eax
  103176:	89 44 24 04          	mov    %eax,0x4(%esp)
  10317a:	8b 45 08             	mov    0x8(%ebp),%eax
  10317d:	89 04 24             	mov    %eax,(%esp)
  103180:	e8 08 00 00 00       	call   10318d <vsnprintf>
  103185:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103188:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10318b:	c9                   	leave  
  10318c:	c3                   	ret    

0010318d <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10318d:	55                   	push   %ebp
  10318e:	89 e5                	mov    %esp,%ebp
  103190:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103193:	8b 45 08             	mov    0x8(%ebp),%eax
  103196:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103199:	8b 45 0c             	mov    0xc(%ebp),%eax
  10319c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10319f:	8b 45 08             	mov    0x8(%ebp),%eax
  1031a2:	01 d0                	add    %edx,%eax
  1031a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1031ae:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1031b2:	74 0a                	je     1031be <vsnprintf+0x31>
  1031b4:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1031b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031ba:	39 c2                	cmp    %eax,%edx
  1031bc:	76 07                	jbe    1031c5 <vsnprintf+0x38>
        return -E_INVAL;
  1031be:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1031c3:	eb 2a                	jmp    1031ef <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1031c5:	8b 45 14             	mov    0x14(%ebp),%eax
  1031c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1031cc:	8b 45 10             	mov    0x10(%ebp),%eax
  1031cf:	89 44 24 08          	mov    %eax,0x8(%esp)
  1031d3:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1031d6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031da:	c7 04 24 23 31 10 00 	movl   $0x103123,(%esp)
  1031e1:	e8 64 fb ff ff       	call   102d4a <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1031e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031e9:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1031ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1031ef:	c9                   	leave  
  1031f0:	c3                   	ret    
