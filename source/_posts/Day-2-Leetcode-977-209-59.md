---
title: Day 2 | Leetcode 977, 209, 59
date: 2024-01-25 04:41:58
tags:
- Algorithm
- Leetcode
- C++
- 双指针算法
- 滑动窗口
- 螺旋矩阵
- 总结
categories: 
- 算法（数组）
---
## 链接

### 视频

https://www.bilibili.com/video/BV1QB4y1D7ep

https://www.bilibili.com/video/BV1tZ4y1q7XE

https://www.bilibili.com/video/BV1SL4y1N7mV/

### 文章

https://programmercarl.com/0977.%E6%9C%89%E5%BA%8F%E6%95%B0%E7%BB%84%E7%9A%84%E5%B9%B3%E6%96%B9.html

https://programmercarl.com/0209.%E9%95%BF%E5%BA%A6%E6%9C%80%E5%B0%8F%E7%9A%84%E5%AD%90%E6%95%B0%E7%BB%84.html

https://programmercarl.com/0059.%E8%9E%BA%E6%97%8B%E7%9F%A9%E9%98%B5II.html

https://programmercarl.com/%E6%95%B0%E7%BB%84%E6%80%BB%E7%BB%93%E7%AF%87.html#%E6%95%B0%E7%BB%84%E7%90%86%E8%AE%BA%E5%9F%BA%E7%A1%80

### 题目

https://leetcode.com/problems/squares-of-a-sorted-array/

https://leetcode.com/problems/minimum-size-subarray-sum/

https://leetcode.com/problems/spiral-matrix-ii/

## 知识

1. cpp中sort函数的用法：sort(a.begin(), a.end())，排序后的结果就存储在a中。
2. `vector<int> result(A.size(), 0);`的意思是创建一个长度为A.size()，数值全部为0的vector。
3. cpp中的问号表达式——条件运算符

   len = sub < len ? sub: len;表示若sub < len，则len = sub；否则len等于len，保持不变。

   len == INT32_MAX ? 0: len;表示若len等于INT32_MAX，则l表达式值为0，否则表达式值为len。
4. `INT32_MAX`：这是一个在 C++ 中定义的常量，代表 32 位整数类型（即 `int` 类型）可以表示的最大值。
5. 初始化一个二维vector，让其中的元素全部为0：`vector<vector<int>> res(n, vector<int>(n, 0)); `，即初始化一个全部元素为0的一维数组，然后将其复制n遍。

## 初次尝试

### 977.有序数组的平方

暴力做法，先平方，再排序。双指针做法有点思路，但由于不知道如何创建一个值为0且长度与nums相同的vector，因此不能完全正确地写出代码。

### 209.长度最小的子数组

滑动窗口我听yxc讲过，但是已经完全忘了，直接看视频讲解，然后看文字版讲解。

暴力解法：

```cpp
class Solution {
public:
    int minSubArrayLen(int target, vector<int>& nums) {
        int len = INT32_MAX;
        int sub = 0;
        for (int i = 0; i < nums.size(); i ++ )
        {
            int s = 0;
            for (int j = i; j < nums.size(); j ++ )
            {
                s += nums[j];
                if (s >= target)
                {
                    sub = j - i + 1;
                    len = len < sub ? len: sub;
                    break;
                }
            }
        }

        return len == INT32_MAX ? 0: len;
    }
};
```

暴力做法超时了。还是需要滑动窗口。

### 59.螺旋矩阵II

yxc讲过这题，我印象中涉及到一个向量，撞墙了就拐弯，遇到自己之前走过的地方也拐弯，挺生动形象的，但我已经忘记怎么写了。

## 实现

### 977.有序数组的平方

取平方后，最大的元素一定在原数组的两边。故用左右指针，从数组的两边向中间推进。需要一个新的数组来存储结果，新的数组的下标由大到小来更新。

#### for+if写法

```cpp
class Solution {
public:
    vector<int> sortedSquares(vector<int>& nums) {
        // 创建ans数组来存储答案
        vector<int> ans(nums.size(), 0);

        int n = nums.size() - 1;

        // 由于每次循环都要比较两个数的平方的大小关系，因此将最后一个数放入ans时
        // i和j都会等于该数的索引，因此要求i可以等于j
        for (int i = 0, j = nums.size() - 1; i <= j; )
        {
            if (nums[i] * nums[i] <= nums[j] * nums[j])
            {
                ans[n -- ] = nums[j] * nums[j];
                j -- ;
            }
            else
            {
                ans[n -- ] = nums[i] * nums[i];
                i ++ ;
            }
        }
        return ans;
    }
};
```

#### for + while写法

```cpp
class Solution {
public:
    vector<int> sortedSquares(vector<int>& nums) {
        vector<int> res(nums.size(), 0);

        int k = nums.size() - 1;

        for (int l = 0, r = nums.size() - 1; l <= r; )
        {
            // 一定要记得加上l <= r的条件
            while (l <= r && nums[l] * nums[l] >= nums[r] * nums[r])
            {
                res[k -- ] = nums[l] * nums[l];
                l ++ ;
            }
            while (l <= r && nums[l] * nums[l] < nums[r] * nums[r])
            {
                res[k -- ] = nums[r] * nums[r];
                r -- ;
            }
        }
        return res;
    }
};
```

#### while+while写法

```cpp
class Solution {
public:
    vector<int> sortedSquares(vector<int>& nums) {
        vector<int> ans(nums.size(), 0);

        int k = nums.size() - 1;

        int i = 0, j = nums.size() - 1;
        while (i <= j)
        {
            while (i <= j && nums[i] * nums[i] <= nums[j] * nums[j])
            {
                ans[k -- ] = nums[j] * nums[j];
                j -- ;
            }

            while (i <= j && nums[i] * nums[i] > nums[j] * nums[j])
            {
                ans[k -- ] = nums[i] * nums[i];
                i ++ ;
            }
        }
        return ans;
    }
};
```

#### while + if写法

```cpp
class Solution {
public:
    vector<int> sortedSquares(vector<int>& nums) {
        vector<int> res(nums.size(), 0);

        int k = nums.size() - 1;

        int l = 0, r = k;

        while (l <= r)
        {
            if (nums[l] * nums[l] <= nums[r] * nums[r])
            {
                res[k -- ] = nums[r] * nums[r];
                r -- ;
            }
            else
            {
                res[k -- ] = nums[l] * nums[l];
                l ++ ;
            }
        }
        return res;
    }
};
```

### 209.长度最小的子数组

其实核心思想也是双指针，只不过取两指针中间的集合像是一个正在滑动的窗口，因此也叫滑动窗口。用一个for循环替代暴力做法里的两个for循环。一个for循环中的循环变量j若表示滑动窗口的起始位置，则j在遍历的过程中，终止位置也需要去遍历，这与暴力做法无异。**因此for循环中的循环变量j表示滑动窗口的终止位置，起始位置需要动态移动地去获得**。**滑动窗口的精髓在于如何移动起始位置**。

若滑动窗口的起始位置和终止位置间的数的和>=target，那么起止位置可以向后移动，即窗口可以缩小，看缩小后的窗口是否还可以符合条件。若满足条件，则可更新滑动窗口。更新滑动窗口时，需要同时更新滑动窗口的起始位置和滑动窗口中元素和的值。

```cpp
class Solution {
public:
    int minSubArrayLen(int target, vector<int>& nums) {
        int len = INT32_MAX; // result
        int i = 0; // i是滑动窗口的起始位置
        int sub = 0; // 窗口长度
        int sum = 0; // 窗口之和

        // j是滑动窗口的终止位置
        for (int j = 0; j < nums.size(); j ++ )
        {
            sum += nums[j]; // 将新的终止位置放到窗口的和中去

            // 更新滑动窗口
            while(sum >= target)
            {
                sub = j - i + 1; 
                len = len < sub ? len: sub;
                sum -= nums[i];
                i ++ ;
            }
        }
        return len == INT32_MAX ? 0: len;
    }
};
```

### 59.螺旋矩阵II

不涉及算法，是道模拟题。不易写对的原因是转圈的过程中需要处理的边界条件很多。

边界条件：正方形的4个边界点

循环不变量：
循环——不断转圈
不变量——对每条边的处理规则
对每条边的处理规则应该不变。**按照左闭右开的规则处理正方形的每一条边，每条边只处理头节点，不处理尾节点**。

n * n的矩阵，需要转n / 2圈，若n为奇数，则中心那个值最后单独赋即可。每一圈的终止位置在上一圈的基础上-1。

示意图如下所示：
![Snipaste_2024-01-26_06-26-17.png](https://github.com/yfchenkeepgoing/image/blob/main/Snipaste_2024-01-26_06-26-17.png?raw=true)

```cpp
class Solution {
public:
    vector<vector<int>> generateMatrix(int n) {
        vector<vector<int>> ans(n, vector<int>(n, 0));
      
        int startx = 0, starty = 0;
        int offset = 1, count = 1;

        int i, j;
        int loop = n / 2;

        while (loop -- )
        {
            for (j = starty; j < n - offset; j ++ )
                ans[startx][j] = count ++ ;
            for (i = startx; i < n - offset; i ++ )
                ans[i][j] = count ++ ;
            for (; j > starty; j -- )
                ans[i][j] = count ++ ;
            for (; i > startx; i -- )
                ans[i][j] = count ++ ;
          
            startx ++ ;
            starty ++ ;
            offset ++ ;
        }

        if (n % 2) ans[n / 2][n / 2] = count;
        return ans;
    }
};
```

## 心得与备忘录

### 977易错点

1. 一定要新建一个数组ans，不能在原数组的基础上修改，否则会混乱。
2. 一定要注意左指针和右指针可以相等，因为最后总要处理两个元素，两个指针最终总会移到一起去。否则当两个指针指向同一个数时，该数会被落下，不会被添加到答案数组中。
3. 这道题在for/while循环内用if或者while都可以，但用while的时候需要记得加上判断条件：`while(l <= r && ....)`，不加l <= r的条件会报错：run time error。

### 209心得

滑动窗口方法其实脱胎于暴力做法。要特别注意遍历的是窗口的终止位置。

更新窗口的起始位置时，同时需要更新窗口中元素之和。

不要以为for里放一个while就以为是O(n^2)啊， 主要是看每一个元素被操作的次数，每个元素在滑动窗后进来操作一次，出去操作一次，每个元素都是被操作两次，所以时间复杂度至多是 2 × n 也就是O(n)。

### 209易错点

一定要记得把滑动窗口的初始位置定义在循环之外。

一定要记得在移动窗口初始位置的同时改变窗口中元素的sum。

### 59易错点

1. 注意每一条边都是左开右闭
2. 注意画图理解
3. 注意为n为奇数时单独给中心点赋值
4. 注意如何定义一个二维所有元素为0的矩阵
5. offsetx/y和startx/y不会出现在同一个式子中

### 备忘

看代码随想录的数组总结

## 数组总结

数组题目中：整数二分一道（704）。双指针三道（27, 977, 包括滑动窗口209），双指针题目的难度是递增的，27最简单，977稍难，209最难。模拟题一道：59。

从方法上来说，704和59都应该采用循环不变量的原则，27、977、209则都是双指针算法的应用。

引用总结文章：https://programmercarl.com/%E6%95%B0%E7%BB%84%E6%80%BB%E7%BB%93%E7%AF%87.html#%E6%95%B0%E7%BB%84%E7%90%86%E8%AE%BA%E5%9F%BA%E7%A1%80
中的一幅图片：

![img](https://code-thinking-1253855093.file.myqcloud.com/pics/%E6%95%B0%E7%BB%84%E6%80%BB%E7%BB%93.png)
