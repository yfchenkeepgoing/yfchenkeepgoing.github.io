---
title: Comprehensive Introduction to C#
date: 2024-11-18 01:19:51
tags:
- C#
- Introduction
categories: 
- Software Development
---

# Comprehensive Introduction to C#

参考笔记：https://blog.csdn.net/weixin_52421373/article/details/127972228

vs 2013 ultimate的密钥：

VS_2013英文版下载：https://www.123pan.com/s/mWzgjv-es653.html

中文语言包下载：https://www.123pan.com/s/mWzgjv-ts653.html 

KEY:BWG7X-J98B3-W34RT-33B3R-JVYW9

## 1. 课程简介，C#语言简介，开发环境准备

### 课程简介

C#面向对象

采用知识点和示例程序相结合的方式

认真做课后作业，独自写一遍视频中的程序

### C#语言简介

- 程序（Program），即软件。机器码（计算机指令）->汇编语言->高级语言。高级语言翻译为计算机指令的过程被称为编译，编译用编译器。

- 为什么需要程序：随着硬件功能的增强，需要更强大的软件（程序）来统一管理硬件，让硬件之间能够协调和网络通信。这些软件组合在一起形成了操作系统。在操作系统上编写具备特定功能的程序。为什么需要程序可以总结为两点：

  - 管理硬件资源
  - 实现用户的特定需求

- C#是一门通用的语言，可以编写多种类型的程序。不是特别追求性能时，可以用C#开发各种应用程序。

  - 纵向：语言->类库->框架（由浅入深）

    框架是有一定逻辑组织的类库。框架是类库的最佳组合（best practice），避免自行组合时出错。

  - 横向：命令行程序，桌面程序，设备（平板/手机）程序，Web（网站/服务）程序，游戏...

  C++偏底层，学习曲线陡峭。

  C语言不面向对象，主要目标是编写高性能的操作系统，不适合用来写应用程序。

  Java适合写设备程序和Web程序，但是不适合用来写桌面程序。

- 怎样编写程序

  编辑->编译（高级语言经过编译变为机器语言）->调试（编译器看不出来的错误，通过调试被发现）->发布

### 开发环境和学习资料的准备

- 集成开发环境：集成了编辑、编译、调试和发布四个步骤。

- 下载Visual Studio：可视化工作室，应用了所见即所得的理念。

  有两种桌面程序，后者是新一代的桌面开发技术：

  - Windows Forms Application
  - WPF Application (windows presentation foundation)

- 安装Visual Studio(2013)，安装免费版即可

- 打开Visual Studio，进入start page。选择tools-options-start up-show empty environment，点击OK。下次再打开visual studio，就会显示一个空的开发环境，让我们创建新项目。

- 学习资料

  - 下载离线MSDN文档（特点：全面，文章数量多，在Visual Studio的help-add and remove help content-manage content中下载，点击update，文档很大，速度较慢）
  - C#语言定义文档（Language Specification）（特点：精确，难读懂，会出现很大的跳跃性，看不懂的去看MSDN文档，谷歌下载即可）
  - 推荐数据：C# 5.0 In A Nutshell（特点：读MSDN文档的指南针，其中列出了重点）

- MSDN文档中最重要的部分：

  - Visual Basic and Visual C#-Visual C#-C# Programming Guide
  - Visual Basic and Visual C#-Visual C#-C# Reference：横向领略C#语言的特性
  - Visual Basic and Visual C#-Visual C#-C# Reference-C# Sample Application：源码
  - Visual Basic and Visual C#-Visual C#-C# Reference-C# Walkthroughs：功能浏览

### 本节课作业

- 下载并安装Visual Studio Express 2013 for Windows Desktop（建议学生下载professional版本，其对学生免费）
- 下载离线MSDN文档并尝试阅读
- 编写视频中的小程序（所见即所得的wpf程序）

### 作业完成情况
- `HelloWorld`项目的地址：D:\OneDrive - stu.xjtu.edu.cn\文档\Visual Studio 2013\Projects
- MSDN文档成功下载了下面四个（最重要的文档已经下载下来了，其他文档要么是没有要么是下载失败）：
  - .NET Framework 4
  - Get started with Blend for Visual Studio 2013
  - Welcome to Visual Studio 2013
  - Visual Basic and Visual C#

## 2. 初识各类应用程序

带领大家认识各种可以用C#编写的应用程序

### 编程学习的捷径

- 编程不是“学”出来的，而是“练”出来的
- 在反复应用中积累，忽然有一天就会“顿悟”。在实践中理解书本上知识的精髓。
- 学习原则
  - 从感观到原理
  - 从使用别人的到创建自己的
  - 必须亲自动手
  - 必须学以致用、紧跟实际工作
  - 追求实用，不搞“学院派”

### 编写我们的第一个程序——Hello, World!

- Solution与Project

  - Solution是针对客户需求的总的解决方案。举例：汽车经销商需要一套销售软件
  - Project利用具体的技术解决具体的某个问题
  - Visual Studio针对不同技术有不同的Project模板
  - Visual Studio在管理代码时，解决方案（Solution）在最高的级别。一个Solution中可以包含一到多个Project。

  如下图所示（各个组件是Project，所有Project在一起构成一个Solution）：

  ![solution and project.png](https://github.com/yfchenkeepgoing/image/blob/main/solution%20and%20project.png?raw=true)

- Project模板（对比不同VS版本）

  VS有各种版本（express, professional, ultimate），版本越高级，其中包含的Project的模板越多，所支持的开发技术越多。一般来说，professional版本足够用了。

- 分别编写Console, WPF, Windows Forms的Hello World程序

- 初学编程时很重要的两点

  - 不要怕见到自己看不懂的东西
  - 要跟着操作，一遍一遍地练习，为的是熟悉手里的工具，培养感觉

### 见识C#编写的各类应用程序

- 目的1：让大家拥有辨识各类程序的“火眼金睛”
- 目的2：让大家了解一下完成C#语言学习后的职业发展方向（你最喜欢哪种？）

十种技术编写Hello World程序，打星号的是当下流行的技术。

#### Console（控制台）

- File-New Project-Visual C#-Windows-Console Application，可以分别设置solution和project的name。

- C#的源码文件用`.cs`作为扩展名

- 写入以下的代码：
  ```c#
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  
  namespace ConsoleHelloWorld
  {
      class Program
      {
          static void Main(string[] args)
          {
              Console.WriteLine("Hello, World!");
          }
      }
  }
  ```

- 运行时，直接点击Start会一闪而过，选择Debug-Start Without Debugging，就可以持续看到结果。

#### WPF(Windows Presentation Foundation)*

注意对比其与WPF。新建项目，选择WPF Application。现在页面下方出现了一些类似html的代码（`xaml`代码），设计师可以直接通过修改这些代码来设计界面。我理解类似前后端分离，同时前端不需要写代码，有可视化界面。后端的代码类似Windows Forms。

- 点击Toolbox，搜索TextBox，将其拖入窗口中并调整大小。改Name，去掉其中的Text。

- 再搜索Button，将其拖入窗口中并调整大小。改Name，改其中的Text。

- 既可以改代码来改属性，也可以改可视化界面来改属性。

- 选中Button，点击Events。目前Click的值为空，点击Button不会有响应。双击Button，同样生成代码模板，在其中写入以下的代码：
  ```csharp
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  using System.Windows;
  using System.Windows.Controls;
  using System.Windows.Data;
  using System.Windows.Documents;
  using System.Windows.Input;
  using System.Windows.Media;
  using System.Windows.Media.Imaging;
  using System.Windows.Navigation;
  using System.Windows.Shapes;
  
  namespace WpfHelloWorld
  {
      /// <summary>
      /// Interaction logic for MainWindow.xaml
      /// </summary>
      public partial class MainWindow : Window
      {
          public MainWindow()
          {
              InitializeComponent();
          }
  
          private void buttonSayHello_Click(object sender, RoutedEventArgs e)
          {
              textBoxShowHello.Text = "Hello, World!";
          }
      }
  }
  ```

- 运行项目，点击Click Me按钮，TextBox中出现Hello, World!

#### Windows Forms(Old)

新建项目，选择windows forms application。

- 点击Toolbox，搜索TextBox，将其拖入窗口中并调整大小。

- 再搜索Button，将其拖入窗口中并调整大小。

- 修改Button的属性：修改其上的文字，给其起一个带有独特含义的名字

- 修改TextBox的属性：修改其名字为`textBoxShowHello`

- 选中Button，在属性面板有闪电符号，就是Events（事件）。当前Click对应的值为空，表示点击Click没有任何的反应。双击事件中的Click，自动生成了代码模板。写入以下的代码：
  ```c#
  using System;
  using System.Collections.Generic;
  using System.ComponentModel;
  using System.Data;
  using System.Drawing;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  using System.Windows.Forms;
  
  namespace WinFormHelloWorld
  {
      public partial class Form1 : Form
      {
          public Form1()
          {
              InitializeComponent();
          }
  
          private void buttonSayHello_Click(object sender, EventArgs e)
          {
              textBoxShowHello.Text = "Hello, World!";
          }
      }
  }
  ```

- 现在点击click me时，文本框就显示了Hello, World!现在让程序响应了button click事件，程序的相应为在`TextBox`中显示出`Hello, World`。

#### ASP.NET Web Forms(Old)

选择visual c#-web-asp.net web application，再选择empty，勾选web forms。此时就获得了一个空的网站。右击右侧菜单的WebFormHelloWorld，选择add-web form，输入其名称为default，这样就生成了一个模板代码`Default.aspx`。在其中加入`Hello, World`:
```asp
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebFormHelloWorld.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<h1>Hello, World!</h1>
</body>
</html>
```

点击运行（点击浏览器的名称即可），网页就显示出了`Hello, World!`。右键`WebFormHelloWorld`，点击publish，即可将其部署，供外人访问。

#### ASP.NET MVC(Model-View-Controller)*

是ASP.NET Web Forms技术的升级版。其特点是代码解耦合，易于维护。创建项目同ASP.NET Web Forms，但是要点击empty，勾选MVC。选择controllers-add-controller，选择MVC 5 Controller - Empty，点击add，然后输入其名称为`HomeController`，然后add。此时生成了`HomeController.cs`的样板代码：
```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcHelloWorld.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            return View();
        }
	}
}
```

此时views文件夹中的home文件夹中还没有任何view。在函数：`public ActionResult Index()`中右击，选择add view，点击add，此时在home文件夹中生成了`Index.cshtml`。在其中写入代码：
```html
@{
    ViewBag.Title = "Index";
}

<h2>Hello, Wolld!</h2>
```

点击运行，网页上出现了Hello, World!同样也可以将这个项目publish到自己的网站上去。

#### WCF(Windows Communication Foundation)*

wcf是纯粹的网络服务。创建项目时选择visual c#-wcf-wcf service application，命名为WcfHello。

打开模板代码`IService1.cs`，在其中写入代码：
```c#
public interface IService1
{

    [OperationContract]
    string GetData(int value);

    [OperationContract]
    CompositeType GetDataUsingDataContract(CompositeType composite);

    [OperationContract]
    string SayHello();

    // TODO: Add your service operations here
}
```

回到`Service1.svc.cs`中，点击`IService1`下面的蓝色小标记，选择Implement interface IService1。此时就会生成模板代码：
```c#
public string SayHello()
{
    throw new NotImplementedException();
}
```

将其改为：
```c#
public string SayHello()
{
    return "Hello, World!";
}
```

点击运行，会启动wcf test client的工具。wcf是最特殊的服务，只有纯粹的数据交互，没有前端，因此需要用到这个测试工具。双击其中的SayHello()，点击Invoke，就会调用SayHello函数，该函数会返回一个hello world给客户端。我尝试调用，果然在测试界面打印出了hello world。

现在尝试写一个加法器，在`IService1.cs`中写：
```csharp
[OperationContract]
double Add(double a, double b);
```

在`Service1.svc.cs`中写：
```c#
public double Add(double a, double b)
{
    return a + b;
}
```

再次运行，双击Add方法，设置a和b的值为10和20，点击Invoke，计算结果为30。

#### Windows Store Application*

给平板电脑app写的程序。选择visual c#-windows store-blank app(xaml)。其和WPF很像。打开`MainPage.xaml`，将ToolBox中的TextBox拖进去，然后再拖入button。将TextBox重命名为`textBoxShowHello`，再将其中的Text清空。将buttom重命名为`buttonSayHello`，将其content改为Click Me。选择simulator，运行之，此时点击button没有任何反应。

选择button-click，然后双击，生成模板代码，在其中写入代码：
```c#
textBoxShowHello.Text = "Hello, World!";
```

再次在simulator中运行，此时点击click me，hello world就出现了。

#### Windows Phone Application*

创建项目，选择visual c#-windows phone-windows phone app，取名为PhoneHelloWorld。生成的代码同样和wpf非常类似。

同样的，在ToolBox中搜索TextBox，拖入界面中，取名为textBoxShowHello，清空text；再搜索Button，同样拖入界面中，取名为buttonSayHello，将content改为click me；再切换到Button的事件中去，双击click，生成模板代码，写入以下内容：
```c#
textBoxShowHello.Text = "Hello, World!";
```

选择一款较好的模拟器（内存和屏幕分辨率可选），然后执行。点击click me，hello world就出现了。

如何部署到手机上？
选择build-deploy solution，如果windows phone连接到了电脑上，就会直接找到该设备然后部署上去。

#### Cloud(Windows Azure)*

微软云计算平台上的hello world。创建项目，选择visual c#-cloud-windows azure cloud service，项目取名为CloudHelloWorld，要架网站，就选择asp.net web role，点击右箭头将其加到云平台上，改名为SayHello，点击OK。选择empty，勾选MVC。此时看上去和ASP.NET MVC完全相同。

右键controllers-add-controller，选择MVC 5 Controller - Empty，取名为HomeController。在生成的主函数中右键，add view，点击add。在index.cshtml中，写上hello world。点击运行即可，此时要启动云平台的模拟器才能运行程序。

查找最近的项目：file-recent projects and solutions

云平台模拟器会加载刚刚写的网站。

部署时，右键CloudHelloWorld，选择publish，选择云平台的订阅，就可以直接发布。发布网站需要买域名，买空间，但微软的云平台替你完成了这些步骤。

#### WF(Workflow Foundation)

workflow：工作流。选择visual c#-workflow-workflow console application，这个工作流执行起来是在console中执行，命名为WfHelloWorld。

在ToolBox中搜索WriteLine，拖入界面中，在其中写入`"Hello, World!"`，点击debug-start with debugging。

## 3. 初识类与名称空间

### 剖析Hello, World程序

剖析的对象：最简单的console application。

- 初识类（class）与名称空间（namespace）
  - 初学者：类（class）构成程序的主体。高级版本：类是最基础的C#类型。类是一个数据结构，将状态（字段）和操作（方法和其他函数成员）组合在一个单元中。类为动态创建的类实例（instance）提供了定义，实例也称为对象（object）。类支持继承和多态性，这是派生类可用来扩展和专用化基类的机制。
  - 名称空间（namespace）以树型结构组织类（和其他类型），也可以有效地避免同名类的冲突。
    - 例如Button和Path类
- 下面以`HelloWorld`程序来展示类和名称空间。有以下代码：
  ```c#
  // using是将名称空间引用到程序中来
  // 名称空间的标记是{}
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  
  // 编写的Program类放在了ConsoleHelloWorld这个名称空间中，该名称空间的名字默认和project的名字一样
  namespace ConsoleHelloWorld
  {
      // 类在visual studio中高亮的颜色是水蓝色
      // c#是完全面向对象的
      class Program
      {
          static void Main(string[] args)
          {
              // Console类是内置的，我们利用其中的WriteLine方法
              Console.WriteLine("Hello, World!");
          }
      }
  }
  ```

  也可以简写为（权限命名写法）：
  ```c#
  namespace ConsoleHelloWorld
  {
      class Program
      {
          static void Main(string[] args)
          {
              System.Console.WriteLine("Hello, World!"); // 权限命名写法
          }
      }
  }
  ```

  打印两行：
  ```c#
  namespace ConsoleHelloWorld
  {
      class Program
      {
          static void Main(string[] args)
          {
              System.Console.WriteLine("Hello, World!");
              System.Console.WriteLine("Good morning!");
          }
      }
  }
  ```
  
  更方便的写法是引入名称空间：
  ```c#
  using System;
  
  namespace ConsoleHelloWorld
  {
      class Program
      {
          static void Main(string[] args)
          {
              Console.WriteLine("Hello, World!");
              Console.WriteLine("Good morning!");
              Console.WriteLine("Good evening!");
          }
      }
  }
  ```
  
  如何知道某个函数属于哪个名称空间？
  
  - 方法1：help-view help，在index中搜索console class，可以看到相应的文档。其中有信息：`Assembly: mscorlib (in mscorlib.dll) `，`mscorlib(microsoft core library)`是类库。与操作系统有关的重要的类都在System这个名称空间中。
  - 点击报红的单词的任意位置，单词的首字母处会出现蓝色的小方块，为智能标记。点开智能标记，可选择`Using System`或者`System.Console`。弹出智能标记的快捷键：`ctrl + .`或者`Shift+Alt+F10`。
  
  不同命名空间中相同的类名产生冲突的例子：
  
  新建一个wpf程序。在`MainWindow.xaml.cs`中，可以存在两个path类，分别是：
  ```c#
  System.Windows.Shapes.Path
  System.IO.Path
  ```
  
  前者是windows中用于画多边形的path，后者是文件路径的path。如果需要同时用到两者，就只能用权限命名。
  
  另一个例子：button class有更多种，用来写web/.NET/windows等等。使用名称空间就可以解决类名冲突的问题。

### 类库(assembly)的应用

dll: dynamic link library（动态链接库），以ddl结尾的文件是类库。

类和名称空间是放在类库中的。类库是类的仓库。

- 类库引用是使用名称空间和类的物理基础

以一个wpf程序为例，其中的`Button`

- 名称空间为System.Windows.Controls
- 类库为 (in PresentationFramework.dll) 
- 如何查看类库引用在项目的哪里？在项目的References中就可以看到PresentationFramework。双击PresentationFramework，打开的窗口为对象浏览器（ObjectBrowser）。展开其中的PresentationFramework，即可看到有哪些名称空间，展开名称空间又可以看到其中有哪些类。

Console application由于不需要显示窗口，因此需要引用的类库要少于wpf application。

不同技术类型的项目会默认引用不同的类库。

如何为自己的项目添加对其他类库的引用？

- DLL引用（黑盒引用，无ddl的源代码，直接用编译好的dll文件）

  - 以输出hello world的console application为例。如果有一个外部的dll，必须配有文档。例如一个文件夹中存放了`MyLibrary.dll`和`MyLibrary Document`。右键项目的references-add reference-browse，即可把dll文件给加载进来，此时`MyLibrary`就会出现在References中。然后可以对照文档来使用类库中的名称空间、类和方法。也可以双击References中的`MyLibrary`，打开对象浏览器，来查看其中的名称空间、类和方法。

  - 黑盒引用的问题：类库一旦出错，本人无法修改，只能让类库的编写者去修改，然后编写者再次将类库编译为ddl并将该文件发送给本人，才能解决这个错误。此时我的项目会对类库产生依赖，我的`Program`类也会对类库中的类和方法产生依赖。这就是依赖关系。尽量使用弱的依赖关系，避免牵一发而动全身的问题。有一些办法可以减轻依赖关系。

  - 做实验：引用微软提供的类库，让console application显示窗口。在references中添加类库：`System.Windows.Forms`。help viewer中的msdn文档搜索功能非常难用，不如用微软提供的在线文档。让console application显示窗口的代码为：
    ```c#
    using System;
    using System.Windows.Forms;
    
    namespace ConsoleHelloWorld
    {
        class Program
        {
            static void Main(string[] args)
            {
                Form form = new Form();
                form.ShowDialog();
            }
        }
    }
    ```

  - NuGet简介
  
    使用NuGet添加对dll的引用。NuGet技术被用来解决比较复杂的依赖关系（复杂的依赖关系：底层的类库未被引用，则上层的类库也无法被引用）。
  
    - 做实验，在console application中引入一个wpf的窗口。在References中添加依赖：PresentationFramework。然后写入以下代码：
      ```c#
      using System;
      using System.Windows.Forms;
      
      namespace ConsoleHelloWorld
      {
          class Program
          {
              static void Main(string[] args)
              {
                  System.Windows.Window window = new System.Windows.Window();
                  window.ShowDialog();
              }
          }
      }
      ```
  
      运行时会产生报错：
      ```
      Error	1	The type 'System.Windows.Markup.IAddChild' is defined in an assembly that is not referenced. You must add a reference to assembly 'PresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.	d:\OneDrive - stu.xjtu.edu.cn\文档\Visual Studio 2013\Projects\ConsoleHelloWorld\ConsoleHelloWorld\Program.cs	10	13	ConsoleHelloWorld
      
      Error	2	The type 'System.Windows.Markup.IQueryAmbient' is defined in an assembly that is not referenced. You must add a reference to assembly 'System.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.	d:\OneDrive - stu.xjtu.edu.cn\文档\Visual Studio 2013\Projects\ConsoleHelloWorld\ConsoleHelloWorld\Program.cs	10	13	ConsoleHelloWorld
      ```
  
      报错说明更底层的类库：`PresentationCore`和`System.Xaml`还没有被引用，需要将这两者加入到References中。再运行时，还会出现报错：
      ```
      Error	2	The type 'System.Windows.DependencyObject' is defined in an assembly that is not referenced. You must add a reference to assembly 'WindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.	d:\OneDrive - stu.xjtu.edu.cn\文档\Visual Studio 2013\Projects\ConsoleHelloWorld\ConsoleHelloWorld\Program.cs	10	13	ConsoleHelloWorld
      ```
  
      还需要添加更底层的`WindowsBase`，这很麻烦。因为这时候你只有DLL，没有源代码，几乎可以说是“蒙着眼睛引用类库”。这是很危险的！特别是对于大型的项目。
  
      后来有人用包的形式发布一组类库，用户输入命令，一组类库就都被引用了，不需要手动引用，这样很安全且高效，这就是NuGet技术。
  
      例如需要写一个用于连接数据库的程序，需要用到技术`Entity Framework`（实体框架），该类库可以将代码中的类和数据库中的表映射起来。可以采用NuGet技术来对上述类库进行引用。右击References-点击add nuget packages-选择online-输入Entity Framework，点击Install即可，此时就会看到两个自动安装的类库：`EntityFramework`和`EntityFramework.SqlServer`，这两个类库由NuGet自动管理。但是我这样操作搜索不到结果，于是我采用了另一种方式。点击Tools-Library Package Manager-Package Manager Console，在其中输入命令：`Install-Package EntityFramework`，也可以起到相同的效果。
  
- 项目引用（白盒引用，有源代码，源代码放在项目中，故称项目引用）

  直接获得类库项目的源代码，比如类库项目的名字是`MyLibrary`，其中的代码名为`Calculator.cs`，代码为：
  ```c#
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  
  namespace Tools
  {
      public class Calculator
      {
          public static double Add(double a, double b)
          {
              return a + b;
          }
  
          public static double Sub(double a, double b)
          {
              return a - b;
          }
      }
  }
  ```

  如何引用`MyLibrary`这个类库，点击References-add references-solution-projects，当前的projects页面为空，因此需要将`MyLibrary`这个project添加到当前的solution中去。一个项目可以被多个solution包含（这被称为project的重用），因此将类库项目也包含到当前的solution中。将类库的project包含到当前solution中的操作：solution-add-existing project，选中MyLibrary-MyLibrary.csproj，将其添加进来。现在solution中有两个项目，一个是HelloWorld，一个是MyLibrary。再次右击References-add references-solution-projects，勾选`MyLibrary`，点击OK，此时`MyLibrary`就作为类库被成功引用了。此时就可以愉快地在console application中引用`MyLibrary`中的类和方法了：
  ```c#
  using System;
  
  namespace ConsoleHelloWorld
  {
      class Program
      {
          static void Main(string[] args)
          {
              double result = Tools.Calculator.Sub(1, 1);
              Console.WriteLine(result);
          }
      }
  }
  ```

  此时由于已经有了类库的源代码，就可以对类库中的错误进行排除。接下来的内容跳转到排除错误部分。

### 依赖关系

类与类之间，类库与类库之间一旦互相引用，就产生了依赖关系。依赖关系在软件质量中起了关键作用。

质量好的软件，其依赖关系清晰且好维护；质量差的软件，依赖关系不清楚。

- 依赖关系，就是类（或对象）之间的耦合关系

- 优秀的程序追求“高内聚，低耦合”

  - 高内聚指的是一些数据和功能，该属于哪个类，就精确地放入哪个类。
  - 低耦合指的是类和类之间的依赖关系尽可能低
  - “高内聚，低耦合”对类和类库都是如此
  - 程序只有这样做才会结构清晰
  - 教学程序往往会违反这个原则

- UML（通用建模语言）类图：以图的形式表达程序中的关系，UML除了可以画类图，还可以画流程图、序列图等。类图用来展现类和类之间的关系。以`HelloWrold`程序为例：

  ![uml.png](https://github.com/yfchenkeepgoing/image/blob/main/uml.png?raw=true)

  这是一种非常紧密的耦合关系。

### 排除错误

如何排除程序中的错误？

在项目引用时，由于有类库的源代码，可以直接debug。点击出错的行（`double result = Tools.Calculator.Sub(1, 1);`），设置断点。然后debug-start debugging，此时程序会执行到断点前，result值为0.0（还未进行出错行的运算）。接下来点击step into(F11)，此时执行指针就自动跳转到了类库的此处：
```csharp
public static double Sub(double a, double b)
{
    return a - b - 10;
}
```

就可以发现错误的出处。debug时需要找到root cause。

中文标点符号：全角
英文标点符号：半角

- 仔细阅读编译器的报错
- MSDN文档与搜索引擎结合

### 如何建立一个类库项目

solution-add-new project-class library（非可执行程序，编译出来的结果就是dll文件，即类库），项目起名为`SuperCalculator`，模板代码重命名为`Calculator.cs`，在其中写入代码：
```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tools
{
    public class Calculator
    {
        public static double Add(double a, double b)
        {
            return a + b;
        }

        public static double Sub(double a, double b)
        {
            return a - b;
        }

        public static double Mul(double a, double b)
        {
            return a * b;
        }

        public static double Div(double a, double b)
        {
            if (b == 0)
            {
                return double.PositiveInfinity;
            }
            else
            {
                return a / b;
            }
        }
    }
}
```

接着右击references-add reference-project-SuperCalculator，将这个自定义的类库引入主程序，就可以在主程序中使用它：
```c#
using System;
using Tools;

namespace ConsoleHelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            double result1 = Calculator.Mul(3, 4);
            Console.WriteLine(result1);
            double result2 = Calculator.Div(3, 4);
            Console.WriteLine(result2);
            double result3 = Calculator.Div(3, 0);
            Console.WriteLine(result3);
        }
    }
}
```

### 本节作业

- 练习创建类库项目进行项目引用
- 练习DLL引用
- 练习阅读编译器报错并排除错误

## 4. 类、对象、类成员简介

### 类（class）是显示世界事物的模型

- 类是现实世界事物进行抽象所得到的结果
  - 事物包括“物质”（实体）与“运动”（逻辑）
  - 抽象也被称为建模。建模是一个去伪存真（留下需要的，去掉不要的）、由表及里（暴露的接口是表，封装的内容是里）的过程

### 类与对象的关系

- 什么时候叫“对象”，什么时候叫“实例”

  - 对象也叫实例，是类经过“实例化”后得到的内存中的实体

    - Formally "instance" is synonymous with "object"——对象和实例是一回事
    - “飞机”与“一架飞机”有何区别？天上有（一架）飞机——必须是实例飞，概念是不能飞的
    - 有些类是不能实例化的，比如“数学”（Math class），我们不能说“一个数学”

  - 依照类，我们可以创建对象，这就是“实例化”

    - 现实世界中常称“对象”，程序世界中（特别是内存关系）常称“实例”
    - 二者并无太大区别，常常混用，初学者不必迷惑

  - 使用new操作符创建类的实例
    ```c#
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Windows.Forms;
    
    namespace ClassAndInstance
    {
        class Program
        {
            static void Main(string[] args)
            {
                // 实例化
                (new Form()).ShowDialog(); // ()表示实例在内存中诞生后的初始化方式，被称为构造器
            }
        }
    }
    ```

    上述程序运行的结果就是表单已窗口的形式呈现，即表单已被实例化。

- 引用变量
  ```c#
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  using System.Windows.Forms;
  
  namespace ClassAndInstance
  {
      class Program
      {
          static void Main(string[] args)
          {
              Form myForm; // 声明引用变量
              myForm = new Form(); // 用引用变量引用一个实例
              myForm.Text = "My Form!"; // 设置标题的文字
              myForm.ShowDialog();
          }
      }
  }
  ```

  在使用引用变量引用了一个实例后，我们就可以多次访问这个实例。

- 引用变量与实例的关系

  - 孩子与气球。孩子相当于引用变量，气球相当于实例。绳子相当于赋值符号

  - 气球不一定有孩子牵着。此时气球就飞掉了，内存垃圾收集器很快就回收了该变量，内存就被释放掉了

  - 多个孩子可以使用各自的绳子牵着同一个气球。如以下代码所示：
    ```c#
    Form myForm1;
    Form myForm2;
    myForm1 = new Form();
    myForm2 = myForm1;
    ```

    上面两个引用变量引用的是同一个实例/对象。
    ```c#
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Windows.Forms;
    
    namespace ClassAndInstance
    {
        class Program
        {
            static void Main(string[] args)
            {
                Form myForm1;
                Form myForm2;
                myForm1 = new Form();
                myForm2 = myForm1;
                myForm1.Text = "My Form";
                myForm2.Text = "I changed it!";
                myForm1.ShowDialog();
            }
        }
    }
    ```

    此时显示的是`I changed it!`。用任何一个引用变量访问到的都是同一个实例。

    多个孩子也可以都通过同一根绳子牵着气球，目前暂且不讲。

### 类的三大成员

类的成员有十多种，但这三种非常重要，也是初学者最先接触到的。

- 属性（Property）
  - 用于存储数据
  - 这些数据组合起来表示类或对象当前的状态
  
- 方法（Method）
  - 由C语言中的函数（function）进化而来，表示类或对象“能做什么”
  - 工作中90%的时间是在与方法打交道，因为它是“真正做事”、“构成逻辑”的成员
  
- 事件（Event）
  - 类或对象通知其他类或对象的机制，**为C#所特有**（Java通过其他方法实现这个机制）。例如当点击按钮时，发生click这个事件，响应该事件的方法中可以让界面上的文本框显示出`Hello World`的字符串。
  - 事件是非必须的，但有它在编程会变得方便且灵活，但这也意味着它可能会被滥用。因此，善用事件机制非常重要。
  
- 使用MSDN文档。将鼠标移到一个类上，按下快捷键ctrl+shift+F1，就可以跳转到相应的MSDN文档。如果想看该类在哪个分支上，点击左上角的show topic in contents按钮。以Form class为例，其下面的第一句话：`Represents a window or dialog box that makes up an application's user  interface.`，是以一句话概括本类的作用。接着是：
  - 继承关系列表：Inheritance Hierarchy
  - 名称空间：namespace
  - 类库: Assembly
  - 声明的格式：Syntax
  - 构造函数: Constructors
  - 属性：要么用来记忆值，要么表示Form的状态
  - 方法：Form这个类/对象可以做什么
  - 事件：表示Form能以怎样的形式在发生什么事情时通知别的类或对象
  - 类的详细解释，包含了类最常用的功能（即最常用的属性、方法和事件）：Remarks
  - 例子：Examples。MSDN的例子质量良莠不齐
  - 版本信息
  - 平台
  - 多线程安全性：Thread Safety
  
- 某些特殊类或对象在成员方面侧重点不同
  - 模型类或对象重在属性，如Entity Framework。模型类的功能主要是从数据库中读取数据，然后把数据写回数据库。其侧重于数据，因此属性特别发达。例子：用`Entity Framework`生成的作为数据模型的类。首先需要安装Entity Framework及其相关的包，可以使用Nuget/命令行，我的Nuget不管用，因此使用命令行。
  
    打开sql server 2012 developer version，创建一个样例数据库：AdventureWorksLT2012，打开Tables，再打开`SalesLT.Product`，打开其前1000行，主要包含ProductID, Name, ProductNumber, Color等数据。
  
    在项目中，右击solution-add-new item-data-ado.net entity data model，将其名字改为`AdventureWorksModel.edmx`。选择generate from database，然后新建一个和本地数据库`AdventureWorksLT2012`的连接。然后选择Product表和Address表。此时visual studio就和entity framework一起生成了一些专门用于数据传输的数据模型类。会显示两个数据模型类，分别是`Product`和`Address`类。这两个类中，只有属性，没有方法和事件。使用这些类的代码：
    ```c#
    // 打印产品的Name属性
    AdventureWorksLT2012Entities proxy = new AdventureWorksLT2012Entities();
    
    // 快速插入foreach代码的方法是：输入foreach时，当VS2013有所提示时，连续按两下Tab键
    foreach(Product p in proxy.Products)
    {
        // 输入cw，然后按两下tab键，就会补全为Console.WriteLine
        Console.WriteLine(p.Name);
    }
    
    // 打印产品的数目
    Console.WriteLine("==========================="); // 分割线
    Console.WriteLine(proxy.Products.Count());
    ```
  
  - 工具类或对象重在方法，如Math, Console。工具类主要用于计算和其他具体功能。以`Math`为示例：
    ```c#
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    
    namespace MethodSample
    {
        class Program
        {
            static void Main(string[] args)
            {
                double x = Math.Sqrt(4);
                Console.WriteLine(x);
    
                double y = Math.Pow(2, 3);
                Console.WriteLine(y);
            }
        }
    }
    ```
  
  - 通知类或对象重在事件，如各种Timer（时钟每隔一段时间触发某个事件，这个事件会执行某些功能）。
  
    新建WPF Application，先创建一个合适大小的textBox，然后去后台，写入以下代码，即可生成一个简易的时钟：
    ```c#
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Windows;
    using System.Windows.Controls;
    using System.Windows.Data;
    using System.Windows.Documents;
    using System.Windows.Input;
    using System.Windows.Media;
    using System.Windows.Media.Imaging;
    using System.Windows.Navigation;
    using System.Windows.Shapes;
    using System.Windows.Threading;
    
    namespace EventSample
    {
        /// <summary>
        /// Interaction logic for MainWindow.xaml
        /// </summary>
        public partial class MainWindow : Window
        {
            // Window的构造函数
            public MainWindow()
            {
                InitializeComponent();
                DispatcherTimer timer = new DispatcherTimer();
                timer.Interval = TimeSpan.FromSeconds(1); // 时间间隔1秒钟
    
                // 写完+=后，连续按两次tab键
                // 将timer_Tick函数挂接到事件上
                // 当事件Tick被触发时，timer_Tick函数就会被执行
                // timer_Tick方法用于响应事件，因此该方法也被称为事件处理器
                timer.Tick += timer_Tick;
    
                // 让时钟开始
                timer.Start();
            }
    
            void timer_Tick(object sender, EventArgs e)
            {
                this.timeTextBox.Text = DateTime.Now.ToString();
            }
        }
    }
    ```

### 类的静态成员与实例成员

- 静态（Static）成员在语义上表示它是“类的成员”

- 实例（非静态）成员在语义上表示它是“对象的成员”，而非“类的成员”

- 例子：
  ```c#
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  using System.Windows.Forms;
  
  namespace StaticSample
  {
      class Program
      {
          static void Main(string[] args)
          {
              // WriteLine方法是隶属于Console类的，因此该方法是静态方法
              Console.WriteLine("Hello");
  
              Form form = new Form();
              form.Text = "Hello"; // Text是实例属性
              form.ShowDialog(); // ShowDialog是实例方法
          }
      }
  }
  ```

- 在MSDN文档中，若某个属性上面加了红色的大写的S，那么其是静态属性。同理，同样的标记也被用于静态方法。静态事件非常少见。

- “绑定”（Binding）指的是编译器如何把一个成员 与 类或对象关联起来

  - 早绑定。编译器就决定将成员与哪个类/对象关联。
  - 晚绑定。程序运行起来后，再决定将成员与哪个类/对象关联，编译器不知道此事。有晚绑定功能的语言是动态语言，比如javascript。

  - 不可小觑的“.”操作符——成员访问

### 本节作业
- 跟着视频进行操作，直到能够自己动手编写这些程序

## 5. 语言基本元素概览、初始类型、变量与方法，算法简介

### 构成C#语言的基本元素

前五种被统称为标记（Token）。标记是对编译器有意义的记号。

- 关键字（Keyword）：构成一门编程语言的基本词汇。

  具体参照这个文档：https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/x53a06bb(v=vs.120)?redirectedfrom=MSDN

  其中包含两个表格，第一个表格中的关键字一直都是关键字（70多个），第二个表格中的关键字是上下文关键字（20多个）。一共100多个关键字。

  注意：

  - 某些关键字有多个用途
  - 关键字按照逻辑分组，可以分为Types, Modifiers, Statement, Namespace, Operator等

- 操作符（Operator）

  查看文档：https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/6a71f45d(v=vs.120)?redirectedfrom=MSDN

  操作符大概30-40个。有些操作符是关键字，因此这类关键字被称为操作符关键字。

- 标识符（Identifier），即名字

  - 什么是合法的标识符
    
    - 首先不能与关键字冲突。关键字又名保留字，不能被用来作为标识符。
    - 可以用字母、数字和下划线来组成标识符，但是不能拿数字开头，可以拿字母和下划线开头。
    
    - 怎样阅读语言定义文档
    
      以Identifier为例：
    
      ![identifier1.png](https://github.com/yfchenkeepgoing/image/blob/main/identifier1.png?raw=true)
    
      ![identifier2.png](https://github.com/yfchenkeepgoing/image/blob/main/identifier2.png?raw=true)
    
      - 斜体字意味着还未完全解释清楚，后面还有它的解释
      - 标识符=非关键字的标识符&关键字+`@ 标识符&关键字`
      - 下标opt表示可选的
      - 汉语也可以用作标识符
    
  - 大小写规范：驼峰命名法（myVariable），pascal命名法（MyVariable）

    C#中，变量名都用驼峰法，方法名、类名、名称空间等用pascal法

  - 命名规范：要求变量名、类名、类的成员都有意义

    - 类名是一个名词
    - 类的成员名的属性是名字，方法是动词/动词短语

- 标点符号：比如`{}`, `;`。是符号，但是不参与运算。

- 文本（字面值）

  - 整数

    - 多种后缀

    - 例子：
      ```c#
      int x = 2; // 32 bit表示一个数字
      long y = 3L; // 大小写L均可，64 bit表示一个数字，long能表示的数字范围广于int
      ```

  - 实数

    - 多种后缀

    - 例子：
      ```c#
      float x = 3.0F; // 32 bit表示一个浮点数，F是必须的后缀，否则3.0默认为双精度浮点数
      double y = 4.0D; // D表示双精度浮点数, 64 bit表示一个浮点数
      double z = 4.0;
      ```

  - 字符

  - 字符串

    - 例子：
      ```c#
      char c = 'a'; // 单引号中只能有一个字符，字符类型的变量必须用单引号
      string str1 = "ABCDE";
      string str2 = "a";
      string str3 = "";
      ```

  - 布尔

  - 空（null）

    - 例子：
      ```c#
      bool b = true;
      bool b2 = false;
      string str = null;
      ```

- 注释与空白

  - 单行：`//`
  - 多行（块注释）：`/* */`。块注释不能嵌套
  - 空白：一个空白和多个空白/tab键生成的空白没有区别
  - 格式化代码：edit-advanced-format document，快捷键为ctrl + k, ctrl + d

### 简要介绍类型、变量与方法

- 初识类型（Type）

  - 亦称数据类型（Data Type）：明确的数据类型/推断的数据类型（`var`）

  - 例子：
    ```c#
    var x = 3; // 编译器会根据赋的值自动推断var变量的类型
    Console.WriteLine(x.GetType().Name); // 输出为Int32
    
    var y = 3L;
    Console.WriteLine(y.GetType().Name); // 输出为Int64
    
    var z = 3.0;
    Console.WriteLine(z.GetType().Name); // 输出为Double
    
    var w = 3.0F;
    Console.WriteLine(w.GetType().Name); // 输出为Single
    ```

- 变量是存放数据的地方，简称“数据”

  - 变量的声明
  - 变量的使用

- 方法（旧称函数）是处理数据的逻辑，又称“算法”

  - 方法即成员函数

  - 方法的声明

  - 方法的调用

  - 例子：
    ```c#
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    
    namespace Identifier
    {
        class Program
        {
            static void Main(string[] args)
            {
                Calculator c = new Calculator();
                int x = c.Add(3, 4);
                Console.WriteLine(x);
    
                string str = c.GetToday();
                Console.WriteLine(str);
    
                c.PrintSum(2, 3);
            }
    
        }
    
        class Calculator
        {
            // 方法
            public int Add(int a, int b)
            {
                int result = a + b;
                return result;
            }
    
            public string GetToday()
            {
                int day = DateTime.Now.Day;
                return day.ToString();
            }
    
            public void PrintSum(int a, int b)
            {
                int result = a + b;
                Console.WriteLine(result);
            }
        }
    }
    ```

- 程序=数据+算法

  - 有了变量和方法就可以写有意义的程序了

### 算法简介

- 循环初体验

  循环又称迭代。例子：打印x到1
  ```c#
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  
  namespace Identifier
  {
      class Program
      {
          static void Main(string[] args)
          {
              Calculator c = new Calculator();
              c.PrintXTo1(10);
          }
  
      }
  
      class Calculator
      {
          public void PrintXTo1(int x)
          {
              for (int i = x; i > 0; i--)
              {
                  Console.WriteLine(i);
              }
          }
      }
  }
  ```

- 递归初体验

  例子：打印x到1
  ```c#
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  
  namespace Identifier
  {
      class Program
      {
          static void Main(string[] args)
          {
              Calculator c = new Calculator();
              c.PrintXTo1(10);
          }
  
      }
  
      class Calculator
      {
          // 递归写法
          public void PrintXTo1(int x)
          {
              if (x == 1)
              {
                  Console.WriteLine(x);
              }
              else
              {
                  Console.WriteLine(x);
                  PrintXTo1(x - 1);
              }
          }
      }
  }
  ```

- 计算1到100的和

  循环写法：
  ```c#
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  
  namespace Identifier
  {
      class Program
      {
          static void Main(string[] args)
          {
              Calculator c = new Calculator();
              int result = c.SumFrom1ToX(100);
              Console.WriteLine(result);
          }
  
      }
  
      class Calculator
      {
          // 循环写法
          public int SumFrom1ToX(int x)
          {
              int result = 0;
              for (int i = 1; i < x + 1; i++)
              {
                  result += i;
              }
              return result;
          }
      }
  }
  ```

  递归写法：
  ```c#
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  
  namespace Identifier
  {
      class Program
      {
          static void Main(string[] args)
          {
              Calculator c = new Calculator();
              int result = c.SumFrom1ToX(100);
              Console.WriteLine(result);
          }
  
      }
  
      class Calculator
      {
          // 递归写法
          public int SumFrom1ToX(int x)
          {
              if (x == 1)
              {
                  return 1;
              }
              else
              {
                  int result = x + SumFrom1ToX(x - 1);
                  return result;
              }
          }
      }
  }
  ```

### 本节作业

独立完成“汉诺塔问题”

汉诺塔的问题：n个盘子，由A柱子，经过B柱子，最终放到C柱子上。

以递归角度进行分析为：

- 把n-1个盘子由A移动到B；(借助辅助塔C)
- 把第n个盘子，由A移动到C;
- 把n-1个盘子由B移动到C; (借助辅助塔A) 

汉诺塔的代码：
```c#
using System;

namespace Identifier
{
    class Program
    {
        static int m = 0;

        public static void move(int disks, char from, char to)
        {
            Console.WriteLine("移动次数: {0} 把块: {1} 按照如下移动： {2} --> {3}", ++m, disks, from, to);
        }

        public static void hanoi(int disks, char from, char to, char assist)
        {
            if (disks == 1)
            {
                move(1, from, to);
                return;
            }
            else
            {
                hanoi(disks - 1, from, assist, to);
                move(disks, from, to);
                hanoi(disks - 1, assist, to, from);
            }

        }

        static void Main(string[] args)
        {
            char A = 'A';
            char B = 'B';
            char C = 'C';
            hanoi(4, A, C, B);
            Console.WriteLine(m);
        }
    }
}
```

简化后的程序：
```c#
using System;

namespace Identifier
{
    class Program
    {
        static int m = 0;

        public static void move(char from, char to)
        {
            m++;
        }

        public static void hanoi(int disks, char from, char to, char assist)
        {
            if (disks == 1)
            {
                move(from, to);
                return;
            }
            else
            {
                hanoi(disks - 1, from, assist, to);
                move(from, to);
                hanoi(disks - 1, assist, to, from);
            }
        }

        static void Main(string[] args)
        {
            char from = 'A';
            char to = 'C';
            char assist = 'B';
            hanoi(4, from, to, assist);
            Console.WriteLine(m);
        }
    }
}
```

## 6. 详解类型、变量与对象（上）

分析编程语言在内存中是如何运作的。

### 什么是类型（Type）

- 数据结构是类型的延申。

- 又名数据类型（Data Type）
  - A data type is a homogeneous collection of values, effectively presented, equipped with a set of operations which manipulate these values.
  - 是数据在内存中存储时的“型号”。内存全称是内部存储单元。当今的计算机架构是冯诺依曼系统，其有几大组成部分：运算器和控制器（CPU），存储器（内存），输入输出系统。程序运行时必须从硬盘加载到内存中，内存越大的计算机，内存中可以同时运行的程序越多。总之，内存是计算机程序运行的空间。外存是扩展存储器，是对内存的扩展，如计算机中的硬盘，硬盘是电磁存储，因此关机后数据也不会丢失。
  - 小内存容纳大尺寸数据会轻则丢失精确度，重则发生错误。
  - 大内存容纳小尺寸数据会导致内存的浪费。
  - 编程语言的数据类型与数学中的数据类型不完全相同。例如数学中3/4=0.75，编程中3/4=0。
  
- 强类型语言与弱类型语言的比较
  
  - 编程时，数据受到数据类型的约束，就是强类型编程语言。数据不严格受数据类型的约束，就是弱类型编程语言。强弱类型语言各有优缺点。C#语言是强类型语言。例子：
    ```c#
    int x;
    x = 100; // 内存中用32 bit/4 Byte来存储100这个整数值
    long y;
    y = 100L; // L代表长整型整数，在内存中用64 bit/8 Byte
    // x = 100L; 这样写会报错，且会build失败
    
    bool b;
    b = true;
    // b = 100; 报错，因为整数100无法转化为bool类型的值
    
    int x = 100;
    if (x = 200) // if的括号中明确要求一个bool类型的值。赋值后得到的不是bool值，因此会报错
    {
        Console.WriteLine("It's OK!");
    }
    ```
  
  - C语言实例：if条件
  
    例子：新建一个c++项目，new project-visual c++-win32-Win32 Console Application
    ```c
    // Console.cpp : Defines the entry point for the console application.
    //
    
    #include "stdafx.h"
    
    
    int _tmain(int argc, _TCHAR* argv[])
    {
    	int x = 100;
    	// c中没有专门的布尔类型，只要表达式的值不为0，就算作真，此处赋值后，得到的值为200，算作真
    	if (x = 200) 
    	{
    		printf("It's OK!\n");
    	}
    
    	return 0;
    }
    ```
  
    C中常见的避免错误的写法，将字面值写到前面去，即`200 = x`，编译器报错后，就立即改为`200 == x`。
  
  - JavaScript示例：动态类型。js中的变量基本不受数据类型的约束。
  
    例子：新建项目，选择visual c#-web-asp.net web application，选择empty，web forms。右击项目-add-html page，命名为`index.html`，这样其执行后就是首页。
    ```html
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <script>
            function ButtonClicked() {
                var myVar = 100;
                myVar = "Chen Yifan"; // 强类型中不允许，但js中可以
                alert(myVar); // 弹出小的警告框，显示100，这里js并没有管100的类型
            }
        </script>
    </head>
    <body>
        <h1>Hello, JavaScript!</h1>
        <input type="button" value="Click Me"onclick="ButtonClicked()"/>
    </body>
    </html>
    ```
  
    弱类型，灵活性与危险并存。
  
  - C#语言（4.0版本后）对弱类型/动态类型的模仿，例子：
    ```c#
    // c#中的dynamic关键字类似于js中的var关键字
    dynamic myVar = 100;
    Console.WriteLine(myVar);
    myVar = "Chen Yifan";
    Console.WriteLine(myVar);
    ```

### 类型在C#语言中的作用

- 一个C#类型中所包含的信息有：
  - 存储此类型变量所需的内存空间大小，例如int类型占有4 Byte/32 bit，long类型占有8 Byte/64 bit。
  
  - 此类型的值可表示的最大、最小值范围（与第一条推算）。可以查看以下的[文档](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/s1ax56ch(v=vs.120)?redirectedfrom=MSDN)，再分为三个文档：[Integral Types Table](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/exx3b86w(v=vs.120)?redirectedfrom=MSDN), [Floating-Point Types Table](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/9ahet949(v=vs.120)?redirectedfrom=MSDN), [decimal](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2013/364x0z75(v=vs.120)?redirectedfrom=MSDN)。一般用`ulong`来表示对象的身份id（类似`uuid`）。
  
  - 此类型所包含的成员（如方法、属性、事件等）
  
  - 此类型由何基类（父类）派生而来。程序未执行时，处于静态时期，即编辑期和编译期；程序执行起来后，处于动态/运行时期，即运行期。C#的机制：反射，即程序运行时，拿到对象/类型，可以立即知道其中的成员，然后根据需求来操作这些成员。例子参见`TypeSample`，代码如下所示：
    ```c#
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Reflection;
    using System.Text;
    using System.Threading.Tasks;
    using System.Windows.Forms;
    
    namespace TypeSample
    {
        class Program
        {
            static void Main(string[] args)
            {
                Type myType = typeof(Form); // 查看Form类的类型
    
                PropertyInfo[] pInfos = myType.GetProperties(); // 一个类型知道其成员, GetProperties能够在程序运行的过程中动态地探知类型的所有属性
                MethodInfo[] mInfos = myType.GetMethods(); // GetMethods是得到该类型方法的函数
                foreach (var m in mInfos)
                {
                    Console.WriteLine(m.Name);
                }
                Console.WriteLine("----------------");
                foreach (var p in pInfos)
                {
                    Console.WriteLine(p.Name);
                }
                Console.WriteLine("----------------");
                Console.WriteLine(myType.Name); // Form类的类型的名字就是Form
                Console.WriteLine(myType.FullName); // Form类的类型的全名是System.Windows.Forms.Form
                Console.WriteLine(myType.BaseType.FullName); // 一个类型知道其基类/父类
            }
        }
    }
    ```
  
    反射的用途：能够拿到某个属性，就能动态地访问到该属性的值；能够拿到某个方法，就能够动态地调用该方法。
  
  - 程序运行的时候，此类型的变量在分配在内存的什么位置（即变量应该被分配到栈中还是堆中）。静态的程序在硬盘中，动态的程序在内存中。运行程序就是静态到动态的切换，就是从硬盘中装载到内存中。内存中有两个区域，分别是stack栈和heap堆。
    - Stack简介：函数调用用到的是栈。栈较小，只有1-2M。
    
    - Stack overflow：栈较小且快。栈爆的两种情况：
    
      - 算法没写好，函数调用过多
      - 往栈上分配了太多的内存
    
    - stack overflow的例子1，对应stack overflow的第一种情况：
      ```c#
      using System;
      using System.Collections.Generic;
      using System.Linq;
      using System.Text;
      using System.Threading.Tasks;
      
      namespace StackOverflow
      {
          class Program
          {
              static void Main(string[] args)
              {
                  BadGuy bg = new BadGuy();
                  bg.BadMethod();
              }
          }
          
          class BadGuy
          {
              public void BadMethod()
              {
                  int x = 100;
      
                  // 递归调用BadMethod
                  // 很快就会stack overflow，因为每次调用都需要在栈上切出一块内存存储变量x
                  this.BadMethod(); 
              }
          }
      }
      ```
    
      stack overflow的例子2，对应stack overflow的第二种情况：
      ```c#
      using System;
      using System.Collections.Generic;
      using System.Linq;
      using System.Text;
      using System.Threading.Tasks;
      
      namespace StackOverflow
      {
          class Program
          {
              static void Main(string[] args)
              {
                  // stackalloc是往栈上切内存，切的过多就会stack overflow
                  // c#中不推荐使用指针，一定要用需要在函数前加unsafe
                  // 记得去project-StackOverflow properties-build中勾选allow unsafe code，并保存
                  unsafe
                  {
                      int* p = stackalloc int[9999999];
                  }
              }
          }
      }
      ```
    
    - Heap简介：堆用来存储对象/实例。堆较大，有几个G。
    
    - 使用Performance Monitor查看进程的堆内存使用量
    
    - 使用wpf application介绍堆。compile是编译，build是组装。一个程序从硬盘加载到内存中，开始执行后，就形成了一个进程（process）。在wpf application中，创建一个界面，上面有两个button，一个用于consume heap memory，一个用于release heap memory，对应的点击两个按钮后执行的逻辑为：
    
      ```c#
      using System;
      using System.Collections.Generic;
      using System.Linq;
      using System.Text;
      using System.Threading.Tasks;
      using System.Windows;
      using System.Windows.Controls;
      using System.Windows.Data;
      using System.Windows.Documents;
      using System.Windows.Input;
      using System.Windows.Media;
      using System.Windows.Media.Imaging;
      using System.Windows.Navigation;
      using System.Windows.Shapes;
      
      namespace HeapSample
      {
          /// <summary>
          /// Interaction logic for MainWindow.xaml
          /// </summary>
          public partial class MainWindow : Window
          {
              public MainWindow()
              {
                  InitializeComponent();
              }
      
              List<Window> winList; // 本变量需要被两个函数使用，因此被声明在函数之外
      
              private void Button1_Click(object sender, RoutedEventArgs e)
              {
                  winList = new List<Window>();
                  // 往list中加入15000个Window，Window的实例占用的内存较多
                  for (int i = 0; i < 15000; i++)
                  {
                      Window w = new Window();
                      winList.Add(w);
                  }
              }
      
              private void Botton2_Click(object sender, RoutedEventArgs e)
              {
                  winList.Clear(); // 找合适的时机回收垃圾内存
              }
          }
      }
      ```
    
      build-build solution后，右击项目，选择open folder in file explorer，进入bin-debug，双击运行`HeapSample.exe`。win+r，键入perfmon，即performance monitor，打开了性能监视器，可用其监视系统和某个程序的性能。点击添加-process-private bytes，选择实例为HeapSample，即可开始监视HeapSample这个程序使用的堆内存。双击图例，选择图表，最大值从100改为1024，然后的点击两个按钮，即可开始实验。观察到，点击consume heap memory按钮，堆内存的占用拉高；点击release heap memory按钮，堆内存的占用先不变，后拉低（因为不是立即释放内存，而是在合适的时机释放内存，当内存占用不多时，先不会释放内存）。
    
      未来写程序时，观察程序是否占用过多内存，或者某个操作是否占用过多的内存，就可以用performance monitor。
    
    - 关于内存泄漏：对象被分配，但没有被回收，导致内存被浪费掉了。比较C++和C#
    
      - C++中，对象被分配但没被回收，会导致内存泄漏
      - C#中，有垃圾收集器的机制，不需要手动释放内存，会自动回收内存。C#中也不需要手动释放内存，相对安全，不易出现内存泄漏。
    
  - 此类型所允许的操作（运算），例子：
    ```c#
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Reflection;
    using System.Text;
    using System.Threading.Tasks;
    using System.Windows.Forms;
    
    namespace TypeSample
    {
        class Program
        {
            static void Main(string[] args)
            {
                double result1 = 3.0 / 4.0; // 浮点除法
                Console.WriteLine(result1);
    
                double result2 = 3 / 4; // 整数除法
                Console.WriteLine(result2); 
            }
        }
    }
    ```

## 7. 详解类型、变量与对象（下）

### C#语言的类型系统

- C#的五大数据类型

  - 类（Classes）：如Windows, Form, Console, String
  - 结构体（Structures）：如Int32, Int64, Single, Double
  - 枚举（Enumerations）：如HorizontalAlignment, Visibility
  - 接口（Interfaces）
  - 委托（Delegates）

- C#类型的派生谱系

  树状的，带有层级结构的类型系统。根部是Object数据类型。C#的类型系统包括引用类型和值类型，引用类型包括类、接口和委托，值类型包括结构体和枚举，所有类型都以Object类型为基类型。三组关键字。第一组对应的是引用类型，蓝色的是数据类型的关键字，黑色的是用于定义引用类型的关键字，`class`用于定义类，`interface`用于定义接口，`delegate`用于定义委托。第二组对应的是值类型，蓝色的是数据类型，黑色的是用于定义值类型的关键字，`struct`用于定义结构体，`enum`用于定义枚举。第三组，最上面是bool类型的取值，中间的：`void`表示函数无返回值，`null`表示引用变量为空，最下面是用于声明变量的。

  蓝色的字表明：

  - 是现成的数据类型，非常常用，c#已经将其作为关键字
  - 是基本数据类型（又称内建数据类型），别的类型都是基于这些类型构成的，没有更基本的类型来构成它们

  ![csharpType.png](https://github.com/yfchenkeepgoing/image/blob/main/csharpType.png?raw=true)

- 实验

  - 实验1：证明Form是一个类

    ```c#
    Type myType = typeof(Form); // 获取Form的类型
    Console.WriteLine(myType.FullName);
    Console.WriteLine(myType.IsClass);
    ```

    或者在`Form`上右击，选择go to definition，或者按下快捷键F12，就来到了微软定义`Form`的地方，可以看到定义`Form`时，有以下代码：
    ```c#
    public class Form : ContainerControl
    ```

    因此`Form`的类型是class，其基类是`ContainerControl`。

  - 实验2：结构体类型：`int`, `long`等，都是结构体类型。在上面右击，选择go to definition，即可验证。
    ```c#
    public struct Int32 : IComparable, IFormattable, IConvertible, IComparable<int>, IEquatable<int>
    public struct Int64 : IComparable, IFormattable, IConvertible, IComparable<long>, IEquatable<long>
    ```
  
    `int`即相当于`Int32`，`long`即相当于`Int64`。
  
  - 实验3：枚举类型，用于限定用户从一个集合中选取有效值。显示窗口时，有三种状态：最大化、标准模式（可调整窗口大小）和最小化。现在来设置窗口的状态，有效值就三个，因此需要枚举类型。
    ```c#
    Form f = new Form();
    f.WindowState = FormWindowState.Maximized; 
    f.ShowDialog(); // 此时显示最大化的窗口
    ```
  
    查看`FormWindowState`的源代码，用`enum`关键字声明的类型就是枚举类型：
    ```c#
    #region Assembly System.Windows.Forms.dll, v4.0.0.0
    // C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5\System.Windows.Forms.dll
    #endregion
    
    using System;
    using System.Runtime.InteropServices;
    
    namespace System.Windows.Forms
    {
        // Summary:
        //     Specifies how a form window is displayed.
        [ComVisible(true)]
        public enum FormWindowState
        {
            // Summary:
            //     A default sized window.
            Normal = 0,
            //
            // Summary:
            //     A minimized window.
            Minimized = 1,
            //
            // Summary:
            //     A maximized window.
            Maximized = 2,
        }
    }
    ```
  
  - 三个关键字：
  
    - `class`：用来声明类 类型
    - `struct`：用来声明结构体类型
    - `enum`：用来声明枚举类型
  
  - 接口和委托类型暂且不讲。

### 变量、对象与内存（核心内容）

- 什么是变量

  **变量 = 以变量名所对应的内存地址为起点、以其数据类型所要求的存储空间为长度的一块内存区域**

  - 表面上来看（C#代码的上下文行文上来看），变量的用途是存储数据

  - 实际上，**变量表示了存储位置，并且每个变量都有一个类型，以决定什么样的值能够存入变量**

    - 变量表示了存储位置：变量名表示（对应着）变量的值在内存中的存储位置。例子：
      ```c#
      int x; // x是一个标签，其对应着内存中的地址，100就存在这个地址
      x = 100; 
      ```

    - 每个变量都有一个类型，以决定什么样的值能够存入变量。同样用上面的例子解释：只有`int`类型的值可以保存到x指示的地址上去。

  - 变量一共有7种

    - 静态变量，实例变量（成员变量，字段），数组元素，值参数，引用参数，输出形参，局部变量

  - 狭义的变量指局部变量，因为其它种类的变量都有自己的约定名称

    - 简单地讲，局部变量就是方法体（函数体）里声明的变量

  - 7种变量的例子：

    ```c#
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Windows.Forms;
    
    namespace TypeInCSharp
    {
        class Program
        {
            static void Main(string[] args)
            {
                int[] array = new int[100]; // 声明了长度为100的整型数组
                // 取出数组中的元素: array[0], array[99]
                // 这100个数组中的元素都是变量
    
                int x; // 局部变量
            }
        }
    
        class Student
        {
            public static int Amount; // 静态成员变量
    
            // 实例变量/字段
            // 字段容易被赋为不合法的值，属性自带逻辑，可以保护字段不被赋不合法的值
            public int Age;
            public string Name;
    
            // 参数
            // double b是值参数变量, ref double a是引用参数变量, out double a是输出参数变量
            public double Add(ref double a, double b) 
            {
                double result = a + b; // result是Add方法的局部变量
                return result; 
            }
        }
    }
    ```

  - 变量的声明

    - 有效的修饰符组合<sub>opt</sub>+类型+变量名+初始化器<sub>opt</sub>

    - opt表示可选的，没有opt下角标则是必需的

    - 例子：
      ```c#
      using System;
      using System.Collections.Generic;
      using System.Linq;
      using System.Text;
      using System.Threading.Tasks;
      using System.Windows.Forms;
      
      namespace TypeInCSharp
      {
          class Program
          {
              static void Main(string[] args)
              {
                  int a; // 声明变量
                  a = 100;
                  int b; // 声明变量
                  b = 200;
                  int c = a + b; // 声明变量
                  Console.WriteLine(c);
              }
          }
      
          class Student
          {
              // 有效的修饰符组合: public static
              // 类型: int
              // 变量名: Amount
              // 初始化器: = 0
              public static int Amount = 0;
          }
      }
      ```

- 值类型的变量

  - 值类型没有实例，所谓的“实例”与变量合二为一。比如`int a = 100`，`a`既是变量，也是`int`类型的实例。

  - 基本知识：计算机内存的最小单位是bit，1个bit存储1个二进制数。8个bit组成一个字节（Byte），计算机内存中以字节为单元进行存取数据和读取数据，计算机为每个字节准备了一个唯一的编号，内存地址就是某个字节在计算机中的编号。寻找某个特定字节的过程：寻址。

    操作系统如何使用内存：

    - 部分内存保留给计算机操作系统，别的应用程序不能用
    - 其他内存为自由内存

  - 以byte/sbyte/short/ushort这四种结构体为例，演示值类型的变量在内存中如何存储。

    - byte: vs中输入byte，然后快捷键ctrl+shift+F1查看其文档，获取基本信息

    - 例子：
      ```c#
      using System;
      using System.Collections.Generic;
      using System.Linq;
      using System.Text;
      using System.Threading.Tasks;
      using System.Windows.Forms;
      
      namespace TypeInCSharp
      {
          class Program
          {
              static void Main(string[] args)
              {
                  byte b;
                  b = 100; // 内存中存储为二进制，值为01100100
      
                  sbyte sb; // Signed 8-bit integer, range -128 to 127
                  sb = 100; // 内存中存储为二进制，值为01100100，最高位为符号位
                  // 负数 = 正数按位取反加1，故-100 = 10011100（注意进位）
      
                  ushort us; // Unsigned 16-bit integer, range 0 to 65,535
                  us = 1000; // 内存中存储为二进制，值为000000 + 1111101000, 注意高位存储在内存地址（字节编号）较大处
      
                  short s; // Signed 16-bit integer, range -32,768 to 32,767
                  s = 1000; // 值为000000 + 1111101000
                  s = -1000; // 按位取反加1, -1000存储为1111110000011000
                  string str = Convert.ToString(s, 2); // s转为二进制，然后打印为字符串
                  Console.WriteLine(str); // 验证-1000存储为1111110000011000
              }
          }
      }
      ```

- 引用类型的变量与实例

  - 引用类型变量与实例的关系：引用类型变量里存储的数据是对象/实例的内存地址

  - 以类为例：
    ```c#
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Windows.Forms;
    
    namespace TypeInCSharp
    {
        class Program
        {
            static void Main(string[] args)
            {
                Student stu; // 计算机看到引用类型，就分配4 Byte，将其中的所有bit都置为0，说明此时变量stu没有引用任何实例
                stu = new Student(); // 在堆内存中创建一个Student实例，实例才是真正包含ID和Score这两个字段的实体
                // 将实例在堆内存中的地址保存到stu变量中，即将内存编号以二进制的形式写入上面的4 Byte中
    
                // 也可解释为什么可以用两个不同的引用变量来引用同一个实例
                Student stu2;
                stu2 = stu;
            }
        }
    
        class Student
        {
            uint ID; // 32 bit
            ushort Score; // 16 bit
        }
    }
    ```

- 局部变量是在stack上分配内存

- 变量的默认值。例子：
  ```c#
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  using System.Windows.Forms;
  
  namespace TypeInCSharp
  {
      class Program
      {
          static void Main(string[] args)
          {
              Student stu = new Student();
  
              // ID和Score的默认值为0
              // 所有类型的变量，其默认值都是分配好的Byte的各个bit全部置为0
              // 但所有本地变量都需要有显示地赋初值
              Console.WriteLine(stu.ID); 
              Console.WriteLine(stu.Score);
          }
      }
  
      class Student
      {
          public uint ID; 
          public ushort Score; 
      }
  }
  ```

- 常量（值不可改变的变量），例子：
  ```c#
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  using System.Windows.Forms;
  
  namespace TypeInCSharp
  {
      class Program
      {
          static void Main(string[] args)
          {
              const int x = 100; // 常量const，常量不可被二次赋值，常量的初始化器不可省略或者换行
              Console.WriteLine(x);
          }
      }
  }
  ```

- 装箱与拆箱（Boxing & Unboxing）

  在实际编程中少用，因为会导致性能的损失。有以下的例子和笔记：
  ```c#
  using System;
  using System.Collections.Generic;
  using System.Linq;
  using System.Text;
  using System.Threading.Tasks;
  using System.Windows.Forms;
  
  namespace TypeInCSharp
  {
      class Program
      {
          static void Main(string[] args)
          {
              int x = 100;
              object obj = x; // 装箱
              // obj是引用类型，在内存中分配4 Byte的存储单元
              // 分开来写: object obj; // 4 Byte全部置零
              // obj = x;
              // 装箱：当obj要引用的值不是堆上的实例，而是栈上的值类型变量
              // 操作就是在堆上找一片空余的区域，将栈上的值拷贝过去
              // 再将堆上的地址存储到obj对应的内存空间中
              // 总之，obj变量对堆上的实例进行引用，实例中封装着x这个整数，这就是装箱
  
              // 拆箱: 拿到obj在堆上存储的整数值x
              int y = (int)obj;
              // 看到obj在堆上存储的值，将其转换为整数类型，然后存储在y对应的内存空间中
              Console.WriteLine(y);
  
              // 装箱和拆箱会损失性能，因为在栈和堆之间搬运了东西
              // 装箱：将栈上的值类型变量封装为object类型的实例，存储在堆上
              // 拆箱：将堆上object类型的实例里面的值，按照要求拆为目标数据类型，存储在栈上
          }
      }
  }
  ```

### 本节作业

- 理解并熟记所有概念和知识
- 对照视频编写示例程序，直至能够默写

## 8. 方法的定义、调用与调试（上）

### 方法的由来

### 方法的定义与调用（重要）

### 构造器（一种特殊的方法）

### 方法的重载（Overload）

### 如何对方法进行debug

### 方法的调用与栈*

## 9. 方法的定义、调用与调试（下）



