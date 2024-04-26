---
title: Day 23 Leetcode 669 108 538 summary
date: 2024-04-24 09:09:27
tags:
- Algorithm
- Leetcode
- C++
- 递归解法
- 迭代解法
- 二叉搜索树
- 双指针算法
categories: 
- 算法（二叉树）
---

## 链接

[669. 修剪二叉搜索树](https://programmercarl.com/0669.%E4%BF%AE%E5%89%AA%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91.html)
[108.将有序数组转换为二叉搜索树](https://programmercarl.com/0108.%E5%B0%86%E6%9C%89%E5%BA%8F%E6%95%B0%E7%BB%84%E8%BD%AC%E6%8D%A2%E4%B8%BA%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91.html)
[538.把二叉搜索树转换为累加树 ](https://programmercarl.com/0538.%E6%8A%8A%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%E8%BD%AC%E6%8D%A2%E4%B8%BA%E7%B4%AF%E5%8A%A0%E6%A0%91.html)
[总结篇 ](https://programmercarl.com/%E4%BA%8C%E5%8F%89%E6%A0%91%E6%80%BB%E7%BB%93%E7%AF%87.html)

## 初次尝试

### 669. 修剪二叉搜索树 

本题据说比增加和删除节点更难，我拿到后没有思路，直接看卡尔的讲解。

### 108.将有序数组转换为二叉搜索树

虽然这是道简单题，但我也没想出来怎么做。

### 538.把二叉搜索树转换为累加树 

本题的基本思路是：累加树中的新节点（除叶子节点外）是其本身加上其右子树的所有节点之和。叶子节点如果是他父节点的左孩子，则值为他的父节点的新值减去原本父节点的值。叶子节点若是他父节点的右孩子，则值为他的父节点的新值加上叶子节点原本的旧值。要计算右子树的值，应当用双指针算法加上中序遍历。

本题还有另一种思路，更加简单粗暴。直接将二叉搜索树转换为一个递增的数组。然后某个节点的新值就是从其本身到数组末尾的所有元素之和。根据上述原理，我写下了如下的代码：
```cpp
class Solution {
public:
    vector<int> nums;
    
    // 将二叉搜索树通过中序遍历转换为有序的数组
    void traversal(TreeNode* root)
    {
        if (root == NULL) return;

        traversal(root->left); // 左
        nums.push_back(root->val); // 中
        traversal(root->right); // 右
    }
    
    // 更新节点的值
    void sum(TreeNode* root)
    {
        if (root == NULL) return;
        for (int i = 0; i < nums.size(); i ++ )
        {
            if (nums[i] > root->val)
                root->val += nums[i];
        }
    }
    
    // 通过层次遍历，遍历每个节点，依次更新所有节点的值
    TreeNode* convertBST(TreeNode* root) {
        traversal(root);
        if (root == NULL) return NULL;

        queue<TreeNode*> q;
        q.push(root);
        
        while (q.size())
        {
            TreeNode* node = q.front(); q.pop();
            sum(node);
            if (node->left) q.push(node->left);
            if (node->right) q.push(node->right);
        }
        return root;
    }
};
```

虽然从原理上来说，上述做法应该是没有问题的，但因为并发修改之类的问题，上述代码的实际运行结果和预期就是不同。我搞不清楚为什么，暂且记录下来。直接看卡尔的讲解。

## 实现

### 669. 修剪二叉搜索树 

给二叉搜索树，给定范围，在范围内修剪二叉搜索树，使得二叉搜索树中所有节点的数值都在范围内。本题不仅要删除不止一个节点，还要改变树的结构。

450.删除二叉搜索树中的节点的原理：通过递归，从当前层往上一层返回值，上一层的左/右孩子来接住返回值，达到删除节点的效果。

常见的误区：常见的错误代码：
```cpp
// 返回修剪后二叉树的根节点
TreeNode* traversal(TreeNode* root, int low, int high)
{
    // 终止条件
    if (root == NULL) return NULL;
    // 修剪二叉搜索树
    // 当前遍历的节点不在[low, high]的范围内
    // 这样写很明显是错误的，若根节点的两个子节点都返回NULL，那么二叉树就只剩下根节点了，其他节点全部被删除
    // 实际上根节点的两棵子树中都可能有范围内的节点
    if (root->val < low || root->val > high) return NULL;
    
    root->left = traversal(root->left, low, high);
    root->right = traversal(root->right, low, high);
    return root;
}
```

**正确的思路**为：若发现某个节点小于范围的左边界，那么该节点的右子树中可能有范围内的节点，因为该节点中右子树的值都要大于该节点的值。因此尽管要删除这个节点，但还需要继续在其右子树中遍历，来挑出其中符合条件的节点。现在来写正确的代码：

```cpp
// 返回修剪后二叉树的根节点
TreeNode* traversal(TreeNode* root, int low, int high)
{
    // 本题的终止条件和删除二叉搜索树中的节点的终止条件类似，分类讨论，先发现要删除的节点然后完成删除操作
    // 终止条件1
    if (root == NULL) return NULL;
    
    // 终止条件2
    // root节点的值小于左边界，但其右子树中可能有符合要求的节点，故应该继续向右遍历
    if (root->val < low)
    {
        // root节点的右子树在修剪后的根节点
        TreeNode* right = traversal(root->right, low, high);
        return right; // 向上返回该根节点
    }
    
    // 终止条件3
    // root节点的值大于右边界，但其左子树中可能有符合要求的节点，故应该继续向左遍历
    if (root->val > high)
    {
        // root节点的左子树在修剪后的根节点
        TreeNode* left = traversal(root->left, low, high);
        return left; // 向上返回该根节点
    }
    
    // 单层递归逻辑，分别修剪根节点的左右子树，然后将修剪后的左右子树接上去
    root->left = traversal(root->left, low, high);
    root->right = traversal(root->right, low, high);
    
    return root; // root在终止条件中处理了
}
```

本题的代码其实不复杂，特别是相比于450.删除二叉搜索树中的节点。那题的终止条件需要分5种情况讨论，本题的终止条件只需要分3种情况讨论。本题也有迭代写法。本题掌握递归法即可。本题代码量不多，但很考察大家对二叉树移除节点和二叉搜索树特性的理解。

我独立写下了精简注释版本的代码：
```cpp
class Solution {
public:
    TreeNode* trimBST(TreeNode* root, int low, int high) {
        // 终止条件1
        if (root == NULL) return NULL;

        // 终止条件2，root节点的值小于左边界
        // 此时root节点的右子树中依然可能有符合要求的节点在，因此还需对右子树进行修剪
        if (root->val < low)
        {
            TreeNode* right = trimBST(root->right, low, high);
            return right;
        }

        // 终止条件3，root节点的值大于右边界
        // 此时root节点的左子树中依然可能有符合要求的节点在，因此还需对左子树进行修剪
        if (root->val > high)
        {
            TreeNode* left = trimBST(root->left, low, high);
            return left;
        }

        // 单层递归逻辑
        // 用来接住3个终止条件的返回值
        root->left = trimBST(root->left, low, high);
        root->right = trimBST(root->right, low, high);
        return root;
    }
};
```

本题的迭代法代码如下所示：
```cpp
// 迭代法
class Solution {
public:
    TreeNode* trimBST(TreeNode* root, int low, int high) {
        if (root == NULL) return NULL;

        // 确保root在[low, high]的区间内
        // 以下写法可以避免死循环
        while (root && (root->val < low || root->val > high))
        {
            if (root->val < low) root = root->right;
            else root = root->left;
        }

        TreeNode* cur = root;

        // 确保cur的左子树中没有小于low的节点
        while (cur)
        {
            while (cur->left && cur->left->val < low)
            {
                cur->left = cur->left->right;
            }
            cur = cur->left;
        }

        cur = root; // 恢复cur

        // 接着检查cur的右子树中没有大于high的节点
        while (cur)
        {
            while (cur->right && cur->right->val > high)
            {
                cur->right = cur->right->left;
            }
            cur = cur->right;
        }

        return root;
    }
};
```

迭代法原理不复杂，但代码非常容易写错，因此不推荐迭代写法。

### 108.将有序数组转换为二叉搜索树

要构造的二叉搜索树是平衡二叉树。做这个要求的原因是任何有序数组都能够轻易构造成链式的二叉搜索树。

**构造二叉树的一般思路**：在数组中选取一个中间节点，将数组分为左区间和右区间。递归遍历左区间，构成左子树。递归遍历右区间，构成右子树。

解题思路：root节点选取为数组中间位置的节点。因为只有这样选才可以保证左右区间中节点的数量相同，构造的二叉树才是平衡二叉树。再根据二叉搜索树的性质：中节点的值大于左子节点，小于右子节点来构造二叉搜索树。构造出的二叉搜索树的结构不唯一。对于数组中有偶数个元素的情况，root节点可以选取为中间偏左那个节点，也可以选取为中间偏右那个节点。代码如下所示：
```cpp
// 注意引用&。如果每层递归不用引用，就需要在内存空间中重复复制数组，导致程序的性能很差
// 使用引用后，递归遍历时都在同一个内存地址里操作数组
// 区间左右边界的定义很重要，此处对区间的定义是左闭右闭
TreeNode* traversal(vector<int>& nums, int left, int right)
{
    // 终止条件：非法区间
    if (left > right) return NULL;
    
    int mid = (left + right) / 2; // 数组下标相加不可能爆内存
    
    // 构造二叉树的根节点
    TreeNode* root = new TreeNode(nums[mid]); 
    // 利用左区间构造左子树
    root->left = traversal(nums, left, mid - 1); // 因为是左闭右闭的区间，所以right = mid - 1
    // 同理，利用右区间构造右子树
    root->right = traversal(nums, mid + 1, right); // 因为是左闭右闭的区间，所以left = mid + 1
    
    return root;
}

TreeNode* sortedArrayToBST(vector<int>& nums)
{
    // 区间定义左闭右闭，因此right = nums.size() - 1
    TreeNode* root = traversal(nums, 0, nums.size() - 1); 
    return root;
}
```

本代码并不复杂。本题也可用迭代法实现，但较为复杂。本题优先掌握递归法即可。

本题的精简版本代码如下所示：
```cpp
class Solution {
public:
    // 区间左闭右闭
    TreeNode* traversal(vector<int>& nums, int left, int right)
    {
        // 终止条件
        if (left > right) return NULL;

        // 构造root节点
        int mid = (left + right) / 2;
        TreeNode* root = new TreeNode(nums[mid]);

        // 构造左子树
        root->left = traversal(nums, left, mid - 1);
        // 构造右子树
        root->right = traversal(nums, mid + 1, right);

        return root;
    }

    TreeNode* sortedArrayToBST(vector<int>& nums) {
        TreeNode* root = traversal(nums, 0, nums.size() - 1);
        return root;
    }
};
```

### 538.把二叉搜索树转换为累加树 

换个思路：给一个有序的数组，将其变成一个累加数组。**倒序遍历**即可，将前一个节点加到本节点中。倒序遍历有序数组，**本质就是按照右中左的顺序遍历二叉搜索树**。将前一个节点的值加到本节点中，就需要用到**双指针**。pre指针指向前一个节点，cur指针指向当前节点。现在开始写递归法的代码：
```cpp
int pre = 0; // 记录前一个节点的数值

// 由于要遍历整个二叉树，在遍历的过程中去更新节点数值即可，因此不需要返回值
void traversal(TreeNode* cur)
{
    // 终止条件
    if (cur == NULL) return;
    
    // 单层递归逻辑：右中左
    traversal(cur->right); // 右
    cur->val += pre; // 中
    pre = cur->val; // 移动pre
    traversal(cur->left); // 左
}
```

在对二叉搜索树的遍历不够熟悉的情况下，可以将二叉搜索树想象成一个有序的数组。

将pre定义为指针也是可行的，代码会略微复杂，因为要判断指针是否为空：
```cpp
class Solution {
public:
    TreeNode* pre = NULL;

    void traversal(TreeNode* cur)
    {
        if (cur == NULL) return;

        // 右
        traversal(cur->right);
        // 中
        if (pre) cur->val += pre->val;
        pre = cur;
        // 左
        traversal(cur->left);
    }

    TreeNode* convertBST(TreeNode* root) {
        traversal(root);
        return root;
    }
};
```

本题用迭代法也可以做，而且是迭代法的模板题，但我用迭代法写本题总是容易写错。因此还是推荐递归法。

## 心得与备忘录

### 669. 修剪二叉搜索树 

1. 本题乍一看非常简单，结果就是掉进常见误区中，即发现一个节点不在区间内，就直接返回NULL。这样的问题在于以该节点为根节点的子树中可能有满足条件的节点。如果直接返回NULL，相当于把可能满足条件的节点一并删除了。
2. 从常见误区中爬出来，又会觉得本题非常难，因为似乎要调整二叉树的结构。其实本题不需要像450.删除二叉搜索树中的节点那样分五种情况讨论来调整二叉树的结构。本题只需要在终止条件中分出三种情况讨论：
   - root节点为空，则返回空
   - root节点小于区间左边界，则root节点的右子树中可能存在符合要求的节点。此时调用递归函数对root节点的右子树进行修剪，将修剪后右子树的头节点向上返回。
   - root节点大于区间右边界，则root节点的左子树中可能存在符合要求的节点。此时调用递归函数对root节点的左子树进行修剪，将修剪后左子树的头节点向上返回。
   
   最后在单层递归逻辑中，分别让root节点的左右指针接住修剪后的左右子树即可。终止条件负责返回，单层递归逻辑负责接收。
3. 本题的基本原理和450.删除二叉搜索树中的节点相同，都是通过递归函数的返回值来移除节点，然后在单层递归逻辑中接住上一层递归的返回值。
4. 本题的迭代法思路简单（终止条件->确保root在[low, high]的区间内->确保cur的左子树中没有小于low的节点->接着检查cur的右子树中没有大于high的节点），但代码非常容易写错（while循环中套着while，循环条件写得不对容易出现死循环），因此不推荐。还是建议老老实实地用递归法完成本题。

### 108.将有序数组转换为二叉搜索树

1. 构造二叉树的一般思路：取数组最中间的元素作为二叉树的root节点。利用数组的左区间构造root节点的左子树，利用数组的右区间构造root节点的右子树。
2. 在数组中元素个数为偶数时，数组最中间的元素有两个。此时，选取这两个元素中的任意一个作为root节点都可以。这样会构造出两棵不同的二叉搜索树，因此本题的结果不唯一。
3. 本题递归函数的传入参数为数组和左右下标。在构造二叉树的时候尽量不要重新定义左右区间数组，而是用下标来操作原数组。
4. `int mid = (left + right) / 2`最好写成`int mid = left + (right - left) / 2`。原因是两个整数相加可能会超出整数的最大范围。本题虽然采取第一种写法没事，但要有清醒的意识，避免出事。

4. 注意循环不变量原则：区间要么一直保持为左闭右闭，要么一直保持为左闭右开。这关乎到终止条件的具体写法、递归时传入的区间下标以及主函数中调用递归函数时传入的下标。
5. 本题的递归写法思路非常简单：先写终止条件，再取数组最中间的元素作为二叉树的root节点，再利用数组的左区间构造root节点的左子树，最后利用数组的右区间构造root节点的右子树，最后返回root节点即可。
6. 本题的迭代写法代码比较复杂，不要求掌握。还是优先掌握递归写法。

### 538.把二叉搜索树转换为累加树 

1. 先想如何把有序（递增）数组变为累加数组：**倒序遍历数组，然后用双指针算法即可**，即当前元素的新值等于当前元素的旧值加上前一个元素的值。根据这个思路解决本题。二叉搜索树通过中序遍历可以转换为有序数组，倒序遍历数组即相当于**反中序遍历二叉搜索树**。对树中节点值的累加也是通过**双指针**实现的。
2. 本题的**递归函数不需要返回值**，原因：由于要遍历整个二叉树，在遍历的过程中去更新节点数值即可，因此不需要返回值。
3. 本题的pre指针可以是整数类型的变量，也可以是指针类型的变量。若采用整数类型的变量，可以避免对指针是否为空的判断（整数的初始值为0），因此采用整数类型的变量作为pre更加方便。
4. 本题是迭代的模板题，但我用迭代法写本题总是容易写错。因此还是推荐递归法。

### 总结篇 

1. 解决二叉树类题目的基本方法是递归法。一般使用了**递归三部曲**来分析题目，看到二叉树，看到递归，都应该想：返回值、参数是什么？终止条件是什么？单层逻辑是什么？

2. 大多数题也都有迭代解法，但是一般代码更长也更容易写错，可以用于提升自己。

3. 二叉树类的题目可以分为以下几类：
#### 二叉树的遍历方式
深度优先遍历
   二叉树：前中后序递归法：递归三部曲初次亮相
   二叉树：前中后序迭代法（一）：通过栈模拟递归
   二叉树：前中后序迭代法（二）统一风格

广度优先遍历
   二叉树的层序遍历：通过队列模拟
#### 求二叉树的属性
二叉树：是否对称
递归：后序，比较的是根节点的左子树与右子树是不是相互翻转

二叉树：求最大深度
递归：后序，求根节点最大高度就是最大深度，通过递归函数的返回值做计算树的高度
迭代：层序遍历

二叉树：求最小深度
递归：后序，求根节点最小高度就是最小深度，注意最小深度的定义
迭代：层序遍历

二叉树：求有多少个节点
递归：后序，通过递归函数的返回值计算节点数量
迭代：层序遍历

二叉树：是否平衡
递归：后序，注意后序求高度和前序求深度，递归过程判断高度差

二叉树：找所有路径
递归：前序，方便让父节点指向子节点，涉及回溯处理根节点到叶子的所有路径

二叉树：递归中如何隐藏着回溯
详解二叉树：找所有路径中递归如何隐藏着回溯

二叉树：求左叶子之和
递归：后序，必须三层约束条件，才能判断是否是左叶子。

二叉树：求左下角的值
递归：顺序无所谓，优先左孩子搜索，同时找深度最大的叶子节点。
迭代：层序遍历找最后一行最左边

二叉树：求路径总和
递归：顺序无所谓，递归函数返回值为bool类型是为了搜索一条边，没有返回值是搜索整棵树。

#### 二叉树的修改与构造
翻转二叉树
递归：前序，交换左右孩子

构造二叉树
递归：前序，重点在于找分割点，分左右区间构造

构造最大的二叉树
递归：前序，分割点为数组最大值，分左右区间构造

合并两个二叉树
递归：前序，同时操作两个树的节点，注意合并的规则

#### 求二叉搜索树的属性
二叉搜索树中的搜索
递归：二叉搜索树的递归是有方向的
迭代：因为有方向，所以迭代法很简单

是不是二叉搜索树
递归：中序，相当于变成了判断一个序列是不是递增的

求二叉搜索树的最小绝对差
递归：中序，双指针操作

求二叉搜索树的众数
递归：中序，清空结果集的技巧，遍历一遍便可求众数集合

二叉搜索树转成累加树
递归：中序，双指针操作累加

#### 二叉树公共祖先问题
二叉树的公共祖先问题
递归：后序，回溯，找到左子树出现目标值，右子树节点目标值的节点。

二叉搜索树的公共祖先问题
递归：顺序无所谓，如果节点的数值在目标区间就是最近公共祖先

#### 二叉搜索树的修改与构造
二叉搜索树中的插入操作
递归：顺序无所谓，通过递归函数返回值添加节点

二叉搜索树中的删除操作
递归：前序，想清楚删除非叶子节点的情况

修剪二叉搜索树
递归：前序，通过递归函数返回值删除节点

构造二叉搜索树
递归：前序，数组中间节点分割