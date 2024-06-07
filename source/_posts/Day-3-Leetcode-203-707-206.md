---
title: Day 3 | Leetcode 203, 707, 206
date: 2024-01-26 06:46:36
tags:
- Algorithm
- Leetcode
- C++
- 链表
- 双指针算法
- 递归
categories: 
- 算法（链表）
---

## 链接
[链表理论基础](https://programmercarl.com/%E9%93%BE%E8%A1%A8%E7%90%86%E8%AE%BA%E5%9F%BA%E7%A1%80.html)
[203.移除链表元素](https://programmercarl.com/0203.%E7%A7%BB%E9%99%A4%E9%93%BE%E8%A1%A8%E5%85%83%E7%B4%A0.html)
[707.设计链表](https://programmercarl.com/0707.%E8%AE%BE%E8%AE%A1%E9%93%BE%E8%A1%A8.html)
[206.反转链表](https://programmercarl.com/0206.%E7%BF%BB%E8%BD%AC%E9%93%BE%E8%A1%A8.html)

## 知识
### 链表理论基础

链表是一种通过指针串联在一起的线性结构。每个节点等于数据域+指针域（存放指向下一个节点的指针）。最后一个节点的指针域指向null。头节点head。

![img](https://code-thinking-1253855093.file.myqcloud.com/pics/20200806194529815.png)

单链表、双链表：既可以向前查询也可以向后查询。
循环链表：链表首尾相连（解决约瑟夫环问题）

链表在内存中不是连续分布的。其通过指针域的指针链接在内存中的各个节点。

链表的定义：
手写链表：

```cpp
// 单链表
struct ListNode {
    int val;  // 节点上存储的元素
    ListNode *next;  // 指向下一个节点的指针
    ListNode(int x) : val(x), next(NULL) {}  // 节点的构造函数
};
```

通过上述构造函数初始化节点：`ListNode* head = new ListNode(5);`
使用默认构造函数初始化节点：

```cpp
ListNode* head = new ListNode();
head->val = 5;
```

不定义构造函数使用默认构造函数的话，在初始化的时候就不能直接给变量赋值！

添加节点：见图

数组和链表有不同的适用场景。数组适合数据量固定，频繁查找，较少增删的场景；链表适合数据量不固定，频繁增删，较少查询的场景。

### 203.移除链表元素

```cpp
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* removeElements(ListNode* head, int val) {
        
    }
};
```

结构体中定义了两个变量和三个构造函数。class Solution中的removeElements函数返回的变量类型是ListNode*，即这个函数返回一个指向ListNode对象的指针。

如果使用C，C++编程语言的话，不要忘了还要从内存中删除这两个移除的节点。如果移除一个节点之后，没有手动在内存中删除这个节点，leetcode依然也是可以通过的，只不过，内存使用的空间大一些而已，但建议依然要养成手动清理内存的习惯。

删除头节点：

- 直接使用原来的链表来进行删除操作：头节点后移一位
- 设置一个虚拟头结点在进行删除操作：原链表的所有节点就都可以按照统一的方式进行移除了，最后`return dummyNode->next;`

### 707.设计链表

- void函数可以直接return，表示退出
- 统一使用虚拟头节点的方式，便于进行增删改的操作
- 变量名前加_表示是这个类的变量，而非局部变量，这是cpp中的一种约定俗成

### 206.反转链表

## 初次尝试
### 203.移除链表元素

对链表题我一直有点懵，不太熟悉链表题的格式，但是对用数组模拟链表倒是挺熟悉的。我知道算法的思路大致是：先定义一个虚的头节点，然后遍历链表，删去值等于val的节点，然后返回头节点指针指向的节点，就是新的头节点，但我不知道这种代码怎么写。

### 707.设计链表

这题yxc也教过，但是在他那里似乎是用数组模拟链表，实现链表的各种功能，而这里是调用链表完成函数中的功能，我认为这题不难，只是多个功能需要分别实现，单个功能的代码较为简单。这道题我基本会做，但**处理边界条件时要倍加注意**！！

### 206.反转链表

yxc也讲过这个题，但我也给完全忘了

## 实现
### 203.移除链表元素

#### 方法1: 特判头节点

```cpp
class Solution {
public:
    ListNode* removeElements(ListNode* head, int val) {
        // 删除头节点
        while (head != NULL && head -> val == val)
        {
            ListNode* tmp = head;
            head = head -> next;
            delete tmp;
        }

        // 删除非头节点
        ListNode* cur = head; // cur存储要删去的节点的前一个节点
        // 要删的节点cur->next不可为空, cur != NULL是考虑空链表的情况
        while (cur != NULL && cur -> next != NULL) 
        {
            if (cur -> next -> val == val)
            {
                ListNode* tmp = cur -> next;
                cur -> next = cur -> next -> next;
                delete tmp;
            }
            else cur = cur -> next; // 后移一位
        }
        return head;
    }
};
```

#### 方法2: 加入虚拟头节点

```cpp
class Solution {
public:
    ListNode* removeElements(ListNode* head, int val) {
        // 创建虚拟头节点
        ListNode* dummyHead = new ListNode(0);
        dummyHead -> next = head;
        // 上面的两行代码：创建虚拟头节点可以简写为：
        // ListNode* dummyHead = new ListNode(0, head);
        // 或者ListNode* dummyHead = new ListNode();
        // dummyHead -> next = head;

        // 统一方法删去值为val的节点
        // 从虚拟头节点开始遍历, cur为目标节点的前一个节点
        // 此时因为加入了虚拟头节点，因此链表不可能为空，因此不再需要考虑链表为空的判断条件：cur != NULL
        ListNode* cur = dummyHead;
        while (cur -> next != NULL)
        {
            if (cur -> next -> val == val)
            {
                ListNode* tmp = cur -> next;
                cur -> next = cur -> next -> next;
                delete tmp;
            }
            else cur = cur -> next;
        }

        head = dummyHead -> next;
        delete dummyHead;
        return head;
    }
};
```

以方法2为主。

### 707.设计链表

```cpp
class MyLinkedList {
public:
    // 记住struct的写法
    struct LinkedList {
        int val;
        LinkedList* next;
        LinkedList(int x): val(x), next(NULL) {};
    };

    // 初始化, 带下划线的变量表示类中的变量，而非局部变量
    MyLinkedList() {
        _dummyHead = new LinkedList(0); // 虚拟头节点
        _size = 0;
    }
    
    int get(int index) {
        if (index < 0 || index > ( _size - 1)) return -1;

        LinkedList* cur = _dummyHead -> next;

        while (index -- ) cur = cur -> next;

        return cur -> val;
    }
    
    void addAtHead(int val) {
        LinkedList* head = new LinkedList(val);
        head -> next = _dummyHead -> next;
        _dummyHead -> next = head;
        _size ++ ;
    }
    
    void addAtTail(int val) {
        LinkedList* tail = new LinkedList(val);

        LinkedList* cur = _dummyHead;
        // while循环中的条件不能是_size -- ，不然会破坏链表长度的准确性
        while(cur -> next != NULL) cur = cur -> next;
        cur -> next = tail;
        _size ++ ;
    }
    
    void addAtIndex(int index, int val) {
        if (index > _size || index < 0) return;

        LinkedList* cur = _dummyHead;
        LinkedList* node = new LinkedList(val);

        while(index -- ) cur = cur -> next;

        node -> next = cur -> next;
        cur -> next = node;
        _size ++ ;
    }
    
    void deleteAtIndex(int index) {
        if (index < 0 || index >= _size) return;
        LinkedList* cur = _dummyHead;
        while (index -- ) cur = cur -> next;
        LinkedList* tmp = cur -> next;
        cur -> next = cur -> next -> next;
        delete tmp;
        _size -- ;
    }

private:
    LinkedList* _dummyHead;
    int _size;
};
```

### 206.反转链表（常考）

是考察对基础数据结构操作非常好的一道题目。先掌握双指针解法，再掌握递归的解法。根据双指针代码写出递归代码。

#### 双指针解法

![leetcode206.png](https://github.com/yfchenkeepgoing/image/blob/main/leetcode206.png?raw=true)

具体解法：由于不需要让翻转以后的链表的头节点为空，因此当cur指向NULL时，遍历结束。因此循环为：`while(cur)`，cur == NULL为遍历的终止条件。

更新cur和pre的方式：用临时节点将cur的下一个节点保存下来。否则一旦反转后cur的写一个节点就会丢失（反转后的链表的下一个节点是pre）。

```cpp
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode* cur = head;
        ListNode* pre = NULL;

        while (cur)
        {
            ListNode* tmp = cur -> next;
            cur -> next = pre;
            pre = cur;
            cur = tmp;
        }
        return pre;
    }
};
```

#### 递归解法1

按照双指针的思路写递归的代码。递归的代码更简短但更难懂。

具体解法：定义一个reverse函数，其中有两个参数，即`reverse(cur, pre)`。

在主函数中调用reverse函数，需要传入两个参数cur和pre，前者对应于双指针解法中的head，后者对应于双指针解法中的null。

```cpp
class Solution {
public:
    // 仿照双指针解法，递归函数中需要传入两个参数：cur和pre
    ListNode* reverse(ListNode* cur, ListNode* pre)
    {
        // 先检查递归的终止条件，同双指针解法
        if (cur == NULL) return pre;
        
        // 再执行递归的步骤
        // 同双指针解法中tmp = cur -> next, cur -> next = pre, pre = cur, cur = tmp
        ListNode* tmp = cur -> next;
        cur -> next = pre;
        return reverse(tmp, cur);
    }

    ListNode* reverseList(ListNode* head) {
        // 双指针解法中初始时cur = head, pre = NULL
        return reverse(head, NULL); 
    }
};
```

#### 递归解法2

另一种递归解法，思路和递归解法1完全不同，我认为相比于递归解法1更好理解。

```cpp
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        // 先判断终止条件是否成立
        if (head == NULL) return NULL; // 空链表，返回空
        if (head->next == NULL) return head; // 递归结束，返回反转后链表的head

        // 执行递归流程
        ListNode* last = reverseList(head->next); // 从第二个节点开始反转链表
        // 将原来的头节点接到反转后链表的尾节点之后，反转后链表的尾节点是head->next
        head->next->next = head; 
        head->next = NULL; // 尾节点指向空
        return last; // 返回反转后链表的头节点
    }
};
```



## 心得与备忘录

### 通用方法

1. 插入虚拟头节点dummyHead，可以避免空链表并避免对头节点操作的特判
2. 创建一个当前节点cur，对整个链表进行遍历（`cur = cur->next`），而不用链表中原本存在的节点对链表进行遍历
3. NULL节点表示不存在的节点；虚拟节点实际上是存在的，其值为0，是人为创建的节点
4. 递归时，需要先检查递归的终止条件，然后执行递归步骤

### 203.移除链表元素

1. 想要删除一个节点，需要先用tmp存下它，然后再delete删去之。
2. 以后写，尽量采用方法2，即加入虚拟头节点。
3. cur -> next表示的是cur节点的next变量（即指针域），而cur -> val表示的是cur节点的val变量（即节点的值）。通过构造函数也可以给这两个变量直接赋值。
4. 在方法1中，一定要加上判断条件`cur != NULL`，因为当链表为空时，`while (cur -> next != NULL)` 这个条件将尝试访问 `NULL` 指针的 `next` 成员，这将触发未定义行为，从而导致程序报错。在方法2中，则不需要加上判断条件`cur != NULL`，因为有虚拟头节点的存在，链表不可能为空，至少有一个节点（即虚拟头节点）。当然，在方法2中加上这个判断条件也不会影响程序的正常运行。

### 707.设计链表

1. 想清楚一个极端情况：返回第0个节点的值，是否会出现空指针异常等错误。
2. cur节点都赋值为_dummyHead
3. 注意删除第n个节点时的内存释放问题
4. 在第n个节点前增加或者删除一个节点，应该让cur指向第n-1个节点，cur->next指向第n个节点。
5. 注意插入节点时先更新后面的边，再更新前面的边
6. 只要传入参数index，就要记得对index进行判断，排除掉不需处理的情况。对get函数和deleteAtIndex函数，判断条件都是`index < 0 || index > _size - 1`，但对addAtIndex函数，判断条件是`index < 0 || index > _size`，因为`index = _size`表示将节点插入到链表的末尾。
7. 别忘记_size ++ / _size -- 

### 206.反转链表

#### 双指针解法

代码量少，思维量大！需要明确：cur和pre初始的取值；循环终止的条件；如何更新pre和cur。画图理解即可。

#### 递归解法

递归解法1参照双指针解法写。**这题推荐就用双指针解法，比较清楚明白**，且空间复杂度为O(1)，优于递归解法的空间复杂度O(n)。递归解法2相比于递归解法1更好理解。
