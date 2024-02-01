---
title: Day 1 | Leetcode 704, 27
date: 2024-01-24 10:47:40
tags:
- Algorithm
- Leetcode
- C++
- 整数二分
- 双指针算法
categories: 
- 算法（数组）
---
## 链接
### 文章
https://programmercarl.com/%E6%95%B0%E7%BB%84%E7%90%86%E8%AE%BA%E5%9F%BA%E7%A1%80.html

https://programmercarl.com/0704.%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE.html#%E7%AE%97%E6%B3%95%E5%85%AC%E5%BC%80%E8%AF%BE

https://programmercarl.com/%E5%89%8D%E5%BA%8F/%E5%85%B3%E4%BA%8E%E6%97%B6%E9%97%B4%E5%A4%8D%E6%9D%82%E5%BA%A6%EF%BC%8C%E4%BD%A0%E4%B8%8D%E7%9F%A5%E9%81%93%E7%9A%84%E9%83%BD%E5%9C%A8%E8%BF%99%E9%87%8C%EF%BC%81.html#%E7%A9%B6%E7%AB%9F%E4%BB%80%E4%B9%88%E6%98%AF%E6%97%B6%E9%97%B4%E5%A4%8D%E6%9D%82%E5%BA%A6

https://programmercarl.com/%E5%89%8D%E5%BA%8F/%E5%85%B3%E4%BA%8E%E7%A9%BA%E9%97%B4%E5%A4%8D%E6%9D%82%E5%BA%A6%EF%BC%8C%E5%8F%AF%E8%83%BD%E6%9C%89%E5%87%A0%E4%B8%AA%E7%96%91%E9%97%AE%EF%BC%9F.html

### 题目

https://leetcode.com/problems/binary-search/

https://leetcode.com/problems/remove-element/


## 知识
### 数组理论基础
数组是存放在**连续内存空间**上的**相同类型数据**的集合。

注意：
- 数组下标都是从0开始的

- 数组内存空间的地址是连续的

- 正是因为数组的在内存空间的地址是连续的，所以我们在**删除或者增添元素的时候，就难免要移动其他元素的地址**

- C++中，要注意vector和array的区别，vector的底层实现是array，严格来讲vector是容器，不是数组

- 数组的元素是不能删的，只能覆盖

- C++中二维数组在地址空间上是连续的（在现代系统上，二维数组中的每个int占用4个字节）

- Java是没有指针的，同时也不对程序员暴露其元素的地址，寻址操作完全交给虚拟机。输出的值不是真正的地址，而是经过处理的数值

### 时间复杂度

时间复杂度是一个函数，它定性描述该算法的运行时间。

大O用来表示上界的，当用它作为算法的最坏情况运行时间的上界，就是对任意数据输入的运行时间的上界。有时业界也默认O代表的就是一般情况，而不是严格的上界。面试中说道算法的时间复杂度是多少指的都是一般情况。

数据用例的不一样，时间复杂度也是不同的。

我们说的时间复杂度都是省略常数项系数的，是因为一般情况下都是默认数据规模足够的大。

我们统一说 logn，也就是忽略底数的描述。

### 空间复杂度

是对一个算法在运行过程中占用内存空间大小的量度。

来看一下例子，什么时候的空间复杂度是$O(1)$呢，C++代码如下：
```c++
int j = 0;
for (int i = 0; i < n; i++) {
    j++;
}
```

第一段代码可以看出，随着n的变化，所需开辟的内存空间并不会随着n的变化而变化。即此算法空间复杂度为一个常量，所以表示为大O(1)。

当消耗空间和输入参数n保持线性增长，这样的空间复杂度为O(n)，来看一下这段C++代码
```c++
int* a = new int(n);
for (int i = 0; i < n; i++) {
    a[i] = i;
}
```
随着n的增大，开辟的内存大小呈线性增长，即 O(n)。

递归的时候，会出现空间复杂度为logn的情况。

## 思路
### 第一想法

#### Leetcode 704 二分查找

这题应该是整数二分，虽然我在yxc的算法基础课里学过这题，但时隔几个月我已经彻底忘了（不管是原理还是实现），从头开始吧。

#### Leetcode 27 移除元素

试试暴力做法吧，双指针做法想不出来。根据yxc的经验，暴力做法成功后再想办法去优化。

### 看完代码随想录后的想法

#### Leetcode 704 二分查找

二分法的使用前提：数组为有序数组，且数组中无重复元素。满足这两个性质的题目可尝试二分法。

二分法中区间的定义有两种：左闭右闭和左闭右开。**每一次边界的处理都要坚持根据区间的定义来操作**。

#### Leetcode 27 移除元素

暴力做法：遍历数组->找到需要移除的元素->将该元素后面的所有元素都前移一位->索引前移一位，数组长度减1

双指针法（快慢指针法）： 通过一个快指针和慢指针在一个for循环下完成两个for循环的工作。

## 实现
### Leetcode 704 二分查找

cpp中的vector中求数组的长度没有len函数，应该用size函数。

cpp中两个整数的做除法如果得到的结果变量类型为整数，则是向下取整的。

cpp中的vector是动态数组，要先向用push_back向其中添加元素，然后才能通过索引来访问元素。

左闭右闭和左闭右开的写法中，需要注意right初始值的选取的不同（由于一种写法的右边界可以取到，另一种写法的右边界取不到）。还需要注意分成三类讨论，即target > nums[mid], target < nums[mid]和target == nums[mid]。这样就可以避免处理大于等于和小于等于的情况。

返回总是返回mid，不要尝试返回l或者r，可能会遇到边界问题。

用(l + r) >> 1比(l + r) / 2要更快一点。

建议采用l + (r - l) / 2代替(r + l) / 2，前者可以防止(r + l)溢出整数的范围。

时间复杂度：O(log n) 
空间复杂度：O(1)

```cpp
// 左闭右闭写法
class Solution {
public:
    int search(vector<int>& nums, int target) {
        // 左闭右闭，因此要求左右边界均可取到，因此r的值要与右边界的索引相同
        int l = 0, r = nums.size() - 1;
        
        // 当left==right，区间[left, right]依然有效，所以用 <=
        while (l <= r)
        {
            int mid = (l + r) / 2; // (l + r) >> 1速度更快
            // 分三类情况讨论
            // 因为区间是右闭的，所以r不可能取为mid，最大为mid - 1
            if (target < nums[mid]) r = mid - 1; 
            // 因为区间是左闭的，所以l不可能取为mid，最小为mid + 1
            else if (target > nums[mid]) l = mid + 1;
            // return l/r都是错误的，可以通过模拟一个输入知道错误原因
            else return mid; 
        } 
        return -1;   
    }
};
```

```cpp
// 左闭右开写法
class Solution {
public:
    int search(vector<int>& nums, int target) {
        // 左闭右开，因此target不能取为右边界的值，要保证区间完全覆盖住target，因此r的值要比右边界的索引大1
        int l = 0, r = nums.size();
        
        // 右边界取不到，因此是l < r
        while (l < r)
        {
            int mid = (l + r) / 2;
            // 因为区间是左闭的，所以l不可能取为mid，最小为mid + 1
            if (target > nums[mid]) l = mid + 1;
            // 因为区间是右开的，所以r可以取为mid
            else if (target < nums[mid]) r = mid;
            // return l是错误的，可以通过模拟一个输入知道错误原因
            else return mid;
        }
        return -1;
    }
};
```

### Leetcode 27 移除元素

#### 暴力做法

若不前移i，则若数组中出现连续的两个val时，结果会发生错误，不能完全移除数组中所有的val。

```cpp
class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        int size = nums.size();

        for (int i = 0; i < size; i ++ )
        {
            // 遍历数组，找到需要移除的元素
            if (nums[i] == val)
            {
                // 将该元素后面的所有元素都前移一位，覆盖掉需要移除的元素
                for (int j = i + 1; j < size; j ++ )
                    nums[j - 1] = nums[j];
                // 索引前移一位，数组长度减1
                i -- ;
                size -- ;
            }
        }
        return size;
    }
};
```

时间复杂度：O(n^2)
空间复杂度：O(1)

#### 快慢双指针做法

```cpp
class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        // 快指针用于遍历所有元素、慢指针用于记录更新后数组的下标
        int slow = 0;

        for (int fast = 0; fast < nums.size(); fast ++ )
        {
            if (nums[fast] != val)
                nums[slow ++ ] = nums[fast];
        }
        return slow;
    }
};
```

时间复杂度：O(n)
空间复杂度：O(1)

#### 相向双指针做法

```cpp
// 相向双指针方法
class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        int l = 0, r = nums.size() - 1;

        while (l <= r)
        {
            // 跳过所有不需要移除的元素，剩下需要移除的元素
            while (l <= r && nums[l] != val) l ++ ;
            // 跳过所有需要移除的元素，剩下不需要移除的元素
            while (l <= r && nums[r] == val) r -- ;

            // 将右边不需要移除的元素覆盖掉左边需要移除的元素(交换左右两边的元素)
            if (l < r) nums[l ++ ] = nums[r -- ];
        }
        // 返回左边的最后一个值的索引
        return l;
    }
};
```
时间复杂度：O(n)
空间复杂度：O(1)

注意：while (l <= r && nums[l] != val)和while (l <= r && nums[r] == val)中的两个判断条件不可以写反，否则会出现Runtime Error。这是因为短路原则，最好先进行边界检查，再访问数组。

逻辑：数组的左边放等于val的元素，因此需要跳过所有不等于val的元素；数组的右边放不等于val的元素，因此需要跳过所有等于val的元素。交换数组的左右两边，让数组的左边放不等于val的元素，数组的右边放等于val的元素，然后输出数组左边的最后一个值的索引。

相向双指针方法的基本过程我大致理解了，但还不理解其的细节和应用。

## 心得与备忘录

### Leetcode 704 二分查找

我认为代码随想录的做法比yxc的讲解更加清晰。清楚地归纳总结出了左闭右闭和左闭右开的写法，并根据选择区间的开闭性质清晰地写出了代码。同时，分成三类讨论，避免了处理大于等于和小于等于的情况。

还没有做35和34，等到二刷来做。

### Leetcode 27 移除元素

相向双指针方法的理解有待加深。
