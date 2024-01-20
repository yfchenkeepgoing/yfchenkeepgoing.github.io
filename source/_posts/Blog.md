---
title: How to Build and Maintain a Personal Blog
date: 2024-01-20 05:57:24
tags:
- GitHub Pages
- Hexo
- next主题
- gitalk
categories: 
- 工具使用
---
# 如何搭建和维护个人博客

## 个人博客的实现方式

使用GitHub Pages和Hexo框架搭建和维护个人博客

## 注意事项

### 注意1
尽量避免在一点不止一行的情况下使用：

1. 
2. 
3. 

的结构，因为这会导致网页上的博客渲染异常。在这种情况下，建议每一点使用一个小标题

### 注意2
在线博客的刷新需要几分钟时间，请在更新博客后稍安勿躁。在线博客各部分的更新速度不同，比如博客内容先更新了，但日志还没有更新，这是正常现象，稍稍等待即可

### 注意3
由于托管博客的仓库有两个分支，其中的master分支总会在我部署博客时实时更新，因此source分支在发布新博客时更新即可，不需要实时更新

### 注意4
使用VSCode在本地编辑博客即可，博客的内容可以复制自Typora，在VSCode中点击md文件左上角的铅笔符号（Edit in VSCode）即可在VSCode中编辑博客内容，每次编辑完后记得运行部署脚本将博客更新部署到网站上

## 博客结构

本博客计划同时按照标签页（tags）和分类页（categories）进行分类。分类是更大的范畴，主要分为算法、web开发、工具使用、个人随笔和找工记录五大类。标签页是更小的范畴，有Python, C++, Java, Django, Springboot, Typora, GitHub Pages, Hexo, VsCode, 简历等等。一般一篇文章只隶属于一个category，但可以同时拥有多个标签。

本博客可以通过网址：
https://yfchenkeepgoing.github.io/
访问，注意由于GitHub Pages是静态网页，因此出现延迟请稍安勿躁。另外，本博客所在的仓库地址为：https://github.com/yfchenkeepgoing/yfchenkeepgoing.github.io
其中有两个分支，分别为master和source。master托管了正在运行的博客，其中的内容在每次运行部署脚本后就会被更新。source托管了博客文件夹的所有源文件，需要通过git命令进行更新。博客网页与master分支中的内容进行了绑定。

## 个人博客的特点和功能

1. 配置站点信息
2. 修改为next主题
3. 进行了next主题的配置，包括样式、favicon、avatar、rss、code、top、reading_process、bookmark、github_banner、pangu、math、pjax
4. 采用gitalk存储并显示评论，需要评论者使用GitHub登录
5. 使用了标签页和分类页
6. 拥有搜索页

## 如何搭建个人博客

参见知乎链接：https://zhuanlan.zhihu.com/p/371995929，其中指导非常详细，但过程较为繁琐，本文不再赘述。本文的重点在于如何维护搭建好的个人博客。

## 如何维护个人博客

### 本地调试

进入博客的根目录下，然后调用 Hexo 的 generate 命令，将 Hexo 编译生成 HTML 代码，命令如下：

```bash
hexo generate
```

然后我们利用 Hexo 提供的 serve 命令把博客在本地运行起来，命令如下：

```bash
hexo serve
```

然后通过链接：http://localhost:4000/即可访问到渲染出的博客页面。注意：在这种情况下，博客页面只对自己可见，因此上述命令只能用于调试。

### 维护在线博客

#### 增加新的文章并将其分类到特定的tags和categories中

新建一篇名为HelloWorld的文章，在本地博客的根目录下执行命令：
```bash
hexo new hello-world
```
创建的文章会出现在 source/_posts 文件夹下，是 MarkDown 格式。
在文章开头通过如下格式添加必要信息：
```markdown
---
title: hello-world # 自动创建，如hello_world
date: 日期 # 自动创建，如2024-01-20 02:07:51
tags: 
- 标签1
- 标签2
- 标签3
categories:
- 分类1
- 分类2
- 分类3
---
```
开头下方撰写正文，MarkDown 格式书写即可。这样在下次编译的时候就会自动识别标题、时间、类别等等，另外还有其他的一些参数设置，可以参考文档：https://hexo.io/zh-cn/docs/writing.html

#### 标签和分类的区别

**Tags（标签）**：
标签是用来描述博客文章中的具体细节的关键词。
它们是扁平的，不形成层次结构。
标签可以非常具体，也可以非常多，用于描述文章的具体内容，如“Python”、“Web开发”、“机器学习”等。
**一个文章可以有多个标签，标签的数量通常比分类多**。

**Categories（分类）**：
分类通常用来表示博客文章的主要主题或大的分组。
它们是层次性的，可以有子分类，形成一个结构化的树状层次，例如：“技术”可以有子分类如“编程”、“网页设计”等。
分类通常较少，更宽泛，用于将文章分配到几个广泛的、互相排斥的主题中。
**一个博客文章通常只属于一个或少数几个分类**。

使用示例：
假设您写了一篇关于Python网络编程的博客文章。您可以将这篇文章归类到“编程”分类下，并给它加上“Python”、“网络编程”、“套接字编程”等标签。

**总结：
分类用于表示文章的主要主题，是更广泛的分组工具。
标签用于详细描述文章的内容和细节，是更具体的关键词。**

#### 通过部署脚本部署在线博客

在根目录下新建一个 deploy.sh 的脚本文件，内容如下：
```bash
hexo clean

hexo generate

hexo deploy
```
在部署发布的时候只需要执行：
```bash
sh deploy.sh
```
就可以完成博客的更新了，非常方便。

注意，在发布博客时只能执行上述命令，不能执行`./deploy.sh`，否则博客无法正常发布。
