---
title: Day 10 | Leetcode 232, 225
date: 2024-02-04 16:32:14
tags:
- Algorithm
- Leetcode
- C++
- 栈
- 队列
categories: 
- 算法（栈与队列）
---
## 链接
[栈与队列理论基础](https://programmercarl.com/%E6%A0%88%E4%B8%8E%E9%98%9F%E5%88%97%E7%90%86%E8%AE%BA%E5%9F%BA%E7%A1%80.html)
[232.用栈实现队列](https://programmercarl.com/0232.%E7%94%A8%E6%A0%88%E5%AE%9E%E7%8E%B0%E9%98%9F%E5%88%97.html)
[225. 用队列实现栈](https://programmercarl.com/0225.%E7%94%A8%E9%98%9F%E5%88%97%E5%AE%9E%E7%8E%B0%E6%A0%88.html)

## 知识
### 栈与队列理论基础

顾名思义，**队列是先进先出，栈是先进后出**（可以从顶部添加元素，也可以从顶部移除元素，但是不能从中间或底部添加或移除元素）。

![栈与队列理论1](https://code-thinking-1253855093.file.myqcloud.com/pics/20210104235346563.png)

栈和队列是STL（C++标准库）里面的两个数据结构。STL有多个版本，其中有三个版本最为普遍。我们介绍的栈和队列是三个版本中的SGI STL里面的数据结构。知道版本才确定其底层实现。

栈：先进后出
![栈与队列理论2](https://code-thinking-1253855093.file.myqcloud.com/pics/20210104235434905.png)

栈提供push和pop等等接口，时间复杂度都是O(1)，所有元素必须符合先进后出规则（只能在顶部添加和移除元素），所以**栈不提供走访功能，也不提供迭代器(iterator)**。 不像是set 或者map提供迭代器iterator来遍历所有元素。

**我们可以用多种容器来实现栈的功能**，栈的底层实现可以是vector，deque（双端队列），list（双向链表）都是可以的， 主要就是数组和链表的底层实现。

我们常用的SGI STL，如果没有指定底层实现的话，默认是以deque为缺省情况下栈的底层结构（deque是容器）。deque是一个双向队列，**只要封住一段，只开通另一端就可以实现栈的逻辑了**。**SGI STL中 队列底层实现缺省情况下一样使用deque实现的**。也可以指定vector为栈的底层实现，初始化语句如下：

```cpp
// 第一个参数int：指定了栈中元素的类型
// 第二个参数std::vector<int>：指定了底层容器的类型及其元素类型。即使用一个整型向量来存储栈中的元素。
std::stack<int, std::vector<int> > third;  // 使用vector为底层容器的栈
```

通过允许指定底层容器，`std::stack`提供了灵活性，可以根据不同的性能需求或使用场景来选择最合适的容器类型。例如，`std::vector`提供了随机访问的能力，但是在容器前端添加或删除元素可能较慢，而`std::deque`在容器的前端和后端添加或删除元素都较快，但不支持快速随机访问。选择哪种底层容器取决于你的具体需求。

队列是先进先出的数据结构，**同样不允许有遍历行为，不提供迭代器,  SGI STL中队列一样是以deque为缺省情况下的底部结构。**

也可以指定list 为起底层实现，初始化queue的语句如下：

```cpp
std::queue<int, std::list<int>> third; // 定义以list为底层容器的队列
```

STL队列和栈都不被归类为容器，而被归类为container adapter（容器适配器）。**因为可以用不同的容器来实现栈和队列的功能，因此栈和队列不对应于某个特定的容器**。

## 初次尝试
### 232.用栈实现队列

yxc讲过的应该是用数组来实现栈和队列，并没有见过怎么用栈来实现队列。直接看卡尔的讲解。

### 225. 用队列实现栈

我想了想，没想出什么好办法，听卡尔讲吧。

## 实现
### 232.用栈实现队列

不涉及具体的算法，考察对栈和队列的基本操作。向队列中插入元素123，则队列吐出元素的顺序是123。向栈中插入元素123，则栈吐出元素的顺序是321。若想用栈实现队列，就需要两个栈，一个栈用于存储元素，**另一个栈用于改变第一个栈中元素出栈的顺序**。第一个栈吐出元素的顺序是321，将它们依次插入第二个栈中，则第二个栈吐出元素的顺序是123。第一个栈被称为入栈，第二个栈被称为出栈。

![tstmp_20240205061240](D:/OneDrive%20-%20stu.xjtu.edu.cn/%E5%9B%BE%E7%89%87/tstmp_20240205061240.gif)

入栈中不要有滞留元素的行为，**一旦需要弹出元素，就把入栈中的所有元素全部放入出栈中**，让出栈实现元素的弹出。如果没有把入栈中的所有元素全部放入出栈，则出栈中弹出元素的顺序会与队列弹出元素的顺序不同。

本题pop函数的实现需要特别注意。若出栈为空，则将入栈中的所有元素加入到出栈中。peek和pop方法大部分代码都是重复的，可以在peek中直接调用pop方法：`result = this->pop();`。此时第一个元素被获取的同时也被弹出了，因此需要将其插入回去：`stackOut.push(result)`（peek方法只需要查询元素的数值，不需要像pop函数那样弹出元素）。参考视频讲解中的伪代码，我写出了以下的代码：
```cpp
class MyQueue {
public:

    stack<int> inStack; // 入栈
    stack<int> outStack; // 出栈

    MyQueue() {
    }
    
    void push(int x) {
        // 向入栈中插入元素即可
        inStack.push(x);
    }
    
    int pop() {
        // 若出栈为空，则将入栈中的所有元素全部加入到出栈中
        // 如果没有把入栈中的所有元素加入到出栈中，则弹出元素的顺序会发生错误
        // 若出栈不为空，则跳过if判断部分，直接执行本函数最后三行代码
        if (outStack.empty())
        {
            while (inStack.size())
            {
                int tmp = inStack.top();
                inStack.pop();
                outStack.push(tmp);
            }
        }

        // 返回出栈顶部的元素并将该元素弹出
        int res = outStack.top();
        outStack.pop();
        return res;
    }
    
    int peek() {
        // 复用上面实现的pop函数
        int res = this->pop();
        // 由于pop函数弹出了出栈顶部的元素，peek函数只需要查询出栈顶部的元素，不需要弹出
        // 因此将该元素插入回出栈中
        outStack.push(res);
        return res;
    }
    
    bool empty() {
        // 入栈和出栈同时为空时，队列才为空
        // 若只有入栈为空，则出栈中依然有元素没有弹出，说明队列还可以弹出元素，不为空
        // 若只有出栈为空，则入栈中依然有元素可以加入出栈中，之后出栈还可以继续弹出元素，故队列也不为空
        if (inStack.empty() && outStack.empty()) return true;
        else return false;
    }
};
```

### 225. 用队列实现栈

两个栈才能实现一个队列。**虽然两个队列可以模拟栈，但重点讲一个队列模拟栈的进元素和出元素**。

用两个队列模拟栈：假设栈中先后插入元素123，则栈弹出元素的顺序为321。那么我们可以在队列1中先插入123，然后将1和2放入队列2中，然后从队列1中弹出元素3。接着若想让队列1弹出元素2，则将队列2中的元素2放入队列1中即可。详细讲解见代码随想录网站。

用一个队列模拟栈：在队列中先加入123，然后取出元素1，加入队列中；再取出元素2，加入队列中，此时队列弹出的元素就是3。**推广：队列中有size个元素，先弹出(size - 1)个元素，再将它们加入队列中，再弹出队列中剩余的最后一个元素即可**。

根据上述原理，我独立写出了以下的代码：
```cpp
class MyStack {
public:
queue<int> q;

    MyStack() {     
    }
    
    void push(int x) {
       q.push(x); 
    }
    
    int pop() {
        int count = q.size(); // 队列中有size个元素
        // 循环(size - 1)次
        // 先弹出队首的元素，再将其加入到队尾中
        while (count > 1) 
        {
            int tmp = q.front();
            q.pop();
            q.push(tmp); 
            count -- ;        
        }
        // 弹出队首的元素，即为最后插入的元素
        int res = q.front();
        q.pop();
        return res;
    }
    
    // 复用pop函数，但是由于本函数只需要实现查询元素的功能，要记得将弹出的元素插入回去
    // 也可直接return q.back()。因为栈顶的元素就是队列尾部的元素（队列中，从front弹出元素，从back插入元素）
    int top() {
        int res = this->pop();
        q.push(res);
        return res;
    }
    
    // 队列为空，则栈也为空
    bool empty() {
        return q.empty();
    }
};
```

更简洁的写法：
```cpp
class MyStack {
public:
queue<int> q;

    MyStack() {
        
    }
    
    void push(int x) {
        q.push(x);
    }
    
    int pop() {
        int size = q.size();
        size -- ;
        while (size -- )
        {
            q.push(q.front());
            q.pop();
        }
        int res = q.front();
        q.pop();
        return res;
    }
    
    int top() {
        return q.back();
    }
    
    bool empty() {
        return q.empty();
    }
};
```

**用两个队列que1和que2实现队列的功能，que2其实完全就是一个备份的作用**，把que1最后面的元素以外的元素都备份到que2，然后弹出最后面的元素，再把其他元素从que2导回que1。据此原理，我写下了如下的代码：

```cpp
class MyStack {
public:
queue<int> q1;
queue<int> q2;

    MyStack() {
        
    }
    
    void push(int x) {
        q1.push(x);
    }
    
    int pop() {
        // 将除去队尾的元素的其他元素全部加入到q2中
        int size = q1.size();
        size -- ;
        while (size -- )
        {
            q2.push(q1.front());
            q1.pop();
        }
        // 收获答案
        int res = q1.front();
        // 将q2赋给q1
        q1 = q2;
        // 清空q2
        while (q2.size()) q2.pop();
        return res;
    }
    
    int top() {
        return q1.back();
    }
    
    bool empty() {
        return q1.empty() && q2.empty();
    }
};
```

## 心得与备忘录

### 232.用栈实现队列

1. 注意stack内置的pop函数不会返回被移除的元素的值。
2. 实现pop函数时：出栈为空，则插入入栈中的所有元素；出栈不为空，则直接弹出出栈中的首元素。
3. 一旦需要弹出元素，就把入栈中的所有元素全部放入出栈中，否则出栈中弹出元素的顺序会与队列弹出元素的顺序不同。
4. 入栈和出栈都为空时，模拟的队列才为空。
5. 取出栈顶元素再弹出栈顶元素的实现，都是先`int tmp = stack.top()`，再`stack.pop()`。

### 225. 用队列实现栈

1. 本题的关键在于如何弹出元素。
2. 队列中，从front弹出元素，从back插入元素。取出队列尾部的元素：`queue.back()`，取出队列头部的元素：`queue.front()`。
3. 掌握一个队列实现栈的方法即可，两个队列实现栈更加复杂。