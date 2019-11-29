# exe2

## 代码

### `_fifo_map_swappable`

FIFA 算法需要将最近使用过的页链接在链表的头部。

看注释，这个函数是要将刚刚使用过的 page 放在链表的第二个元素。程序已经将链表和元素都选取出来了：

```c
list_entry_t *head=(list_entry_t*) mm->sm_priv;
list_entry_t *entry=&(page->pra_page_link);
```

因此我们只需要调用 `list_entry_t` 中的方法即可：

```c
list_add(head, entry);
```

### `_fifo_swap_out_victim`

FIFA 算法需要将最长时间未使用过的页从链表的尾部去除。

看注释我们需要做的事情是删除尾部，并且用 `ptr_page` 这个参数指向被替换的页：

```c
static int
_fifo_swap_out_victim(struct mm_struct *mm, struct Page ** ptr_page, int in_tick)
{
    list_entry_t *head=(list_entry_t*) mm->sm_priv;
    assert(head != NULL && in_tick==0);
    list_entry_t *tail = head->prev;            // Select the victim
    assert(tail != head);                       // this isn't a one-element-list
    *ptr_page = le2page(tail, pra_page_link);   // (2)  assign the value of *ptr_page to the addr of this page
    list_del(tail);                             // (1)  unlink the  earliest arrival page in front of pra_list_head qeueue
    assert(*ptr_page != NULL);
    return 0;
}
```

### `do_pgfault`

~~惯例先翻译注释~~：

- 经过 exe1 的流程，我们可以认为变量 `ptep` 是一个待替换的页表项。
- 现在我们需要把这个页表项对应磁盘中的内容加载到内存中来，然后将逻辑地址映射到这个页表项中，同时触发之前更改的 FIFO 的页表替换逻辑。

