---
title: Django Project Summary
date: 2024-01-21 21:23:39
tags:
- Backend
- Django
- Frontend
- JQuery
- Ajax
- Database
- SQLite
- Redis
categories: 
- web开发
---
# Django项目总结

## 项目介绍

Game based on Django framework, developed by yifanChen

### Website

https://app5894.acapp.acwing.com.cn/

### Repository

https://github.com/yfchenkeepgoing/Django_app

### Gameplay

1. Right-click to move
2. Left-click plus 'Q' for the skill: Fireball, with a cooldown of 3 seconds
3. Left-click plus 'F' for the skill: Flash, with a cooldown of 5 seconds
4. In multiplayer mode, the winning player gains 10 points, and the losing player loses 5 points

### Technology Stack

1. Frontend: JQuery
2. Backend: Django
3. Database: SQLite, Redis
4. Network Protocols: HTTPS, WSS
5. RPC: Thrift
6. Authorization Protocol: OAuth
7. Authentication: JWT

### Features

1. Complete menu interface and game interface
2. Frontend and backend separation, with AcApp and Web versions on the frontend
3. Deployed with Nginx to interface with the AcApp
4. Comprehensive account system, username and password login, and one-click login with AcWing & GitHub OAuth
5. Online multiplayer and chat system implemented via WSS protocol
6. Matchmaking system implemented through Thrift service
7. Cross-origin issues resolved through Rest Framework and JWT authentication, achieving complete frontend-backend separation
8. The ranking board displays the top ten players ranked by score

## Django项目的框架

一个Django项目，大致由以下六部分组成：

1. templates目录：管理html文件
2. urls目录：管理路由，即链接与函数的对应关系，即每个链接交给哪个函数处理的信息，存储在urls文件夹中。
3. views目录：视图，管理http函数（函数实现在views目录中）
4. models目录：管理数据库数据。
5. consumers目录：管理websocket函数（views管理http函数，即负责单向连接的函数；consumers管理双向连接的函数，比如联机对战和聊天的逻辑）
6. static目录：管理静态文件，比如：
- css文件：对象的格式（网页每部分的格式），比如位置、长宽、颜色、背景、字体大小等
- js：对象的逻辑（项目的核心），比如对象的创建与销毁、事件函数、移动、变色等，渲染html也会在js部分（前端）
- image：图片
- audio：声音

urls文件夹、views文件夹、models文件夹和consumers文件夹都由python文件组成，如果想通过import将文件导入，则需要在文件夹下创建 `__init__.py`文件（即索引文件，内容为空即可）。在所有python文件夹中都需要创建这样的函数，否则在import时就无法进去，会报错。

## 项目核心逻辑

本项目由于是一个小游戏，因此前端的js代码占比较大。游戏单人模式的实现纯粹由前端完成，我用js代码实现了一个简易的游戏引擎。游戏的单人模式不需要前后端交互。

需要前后端交互的部分有：

1. 注册与登录：涉及到写入、读取、查询数据库
2. acwing和GitHub一键登录：即OAuth授权登录
3. 实现联机对战和聊天系统：涉及到在多名玩家之间同步五个事件（函数）：create_player, move_to, shoot_fireball, attack, message。前四个用于实现联机对战，最后一个用于实现聊天系统。
4. Rest Framework与JWT身份验证：是对第一点和第二点的补充。

- JWT（json web token）相比于django自带的登录验证方式（通过session_id）安全性更高。
- 方便实现真正意义上的前后端分离，即后端只需要提供实现好的api给前端调用，而Rest Framework为这些api的调试提供了可视化界面。
- JWT可以解决跨域产生的问题。
- 可以使用http的四大类请求方法：get, post, delete, put，而不像之前仅仅使用get方法，这又提高了令牌的安全性。

纯后端的部分只有匹配系统的实现。匹配系统的实现涉及到两个后端（即django web server和match system）之间的通信，匹配系统本身涉及到多线程和锁等方面的知识。

我认为本项目的重点主要在于前后端交互的部分，前后端交互其实有一套统一的范式：先在views中实现后端的函数；然后在urls中为后端的函数定义url链接；再在前端代码中利用ajax技术通过url获得后端传来的数据（前后端一般以json的格式传递数据）；最后通过前端使用或展示数据。如果给用户设计了一套通过点击鼠标或者使用键盘向后端请求数据的模式，那么还需要在前端进行按键索引和绑定监听函数等操作。

## 改进项目

1. 使用功能更强大的前端框架，比如Vue或者React，取代简单的JQuey。
2. 使用更多种类型的数据库，比如关系型数据库MySQL，文档数据库MongoDB，对象存储服务等等。
3. 使用另外几种实现前后端通信的技术取代ajax，比如Fetch API，Server-Sent Events (SSE)，GraphQL和WebRTC，以提高系统的性能。
4. 学习并尝试使用Springboot框架和Go语言的后端框架。
5. 使用k8s来自动化部署、扩展和管理容器化应用程序。

## 漫谈

### 后端的主要分类
算法与推荐系统、开发各种服务、数据库
### 对于实现客户端与服务器之间的通信功能的技术的选择

除了AJAX，现代Web开发中还有几种其他技术可以实现类似的客户端与服务器之间的通信功能。一些技术在特定场景下比AJAX更高效。以下是一些常用的技术：

1. **Fetch API**： Fetch API提供了一种更简洁和强大的方式来发起网络请求。它基于Promise，使得写异步代码更加简洁和直观。Fetch API是AJAX的现代替代方案，被广泛支持和使用。
2. **WebSocket**： WebSocket提供了全双工通信渠道，使得客户端和服务器可以实时、双向地通信。它非常适用于需要频繁和即时数据更新的应用，如在线游戏、聊天应用和实时数据流。
3. **Server-Sent Events (SSE)**： SSE允许服务器主动向客户端发送新数据。它是单向的，只有服务器可以发送消息给客户端。SSE适合实现如股票行情、新闻订阅等场景，其中服务器定期推送更新。
4. **GraphQL**： GraphQL是一种数据查询和操作语言，它允许客户端以更灵活的方式请求数据。与REST相比，GraphQL可以减少数据传输量，因为它允许客户端精确指定所需的数据。
5. **WebRTC**： WebRTC（Web Real-Time Communication）允许在不需要安装插件的情况下在Web应用中实现实时通信功能，常用于视频聊天和点对点数据共享。

每种技术都有其特定的应用场景和优势。选择哪一种技术取决于应用的具体需求：

- 对于简单的异步数据请求，AJAX和Fetch API都是不错的选择。
- 对于需要高实时性的应用，WebSocket或WebRTC可能更合适。
- 对于服务器主动推送数据的场景，SSE是一个好的选择。
- 对于需要更灵活数据交互的场景，GraphQL提供了更好的解决方案。

在性能方面，WebSocket和WebRTC通常在需要频繁和快速通信的场景下比AJAX更高效，因为它们建立了持久的连接，而不是像AJAX那样为每个请求创建新的连接。

### 如何使用MySQL，MongoDB，对象存储服务等外置的数据库（它们不像sqlite，不集成于后端框架内）

- 租一台数据库服务器
- 在框架中负责数据库的部分配置数据库服务器的连接/登录
- 下载该框架下使用该种数据库的包
- 在框架中负责数据库的部分调用包中的api完成对数据库的各种操作，比如读、写、删除等。

在 Django 中，通常不需要直接使用 SQL 语句来操作 MySQL 数据库，因为 Django 提供了一个强大的 ORM（对象关系映射）系统，允许你通过 Python 代码来操作数据库。这意味着你可以使用 Django 的模型和查询 API 来查询和操作数据，而无需直接编写 SQL 语句。

Django 本身不直接支持 MongoDB，因为它是一个 NoSQL 数据库，与 Django 的 ORM 系统设计理念不同。如果你想在 Django 项目中使用 MongoDB，可以采取以下方法：
- 使用 Djongo： Djongo 是一个将 Django ORM 映射到 MongoDB 的工具。通过 Djongo，你可以在一定程度上使用 Django ORM 的风格来操作 MongoDB。
- 使用 PyMongo： PyMongo 是 MongoDB 的官方 Python 驱动程序。使用 PyMongo，你可以直接以 Python 代码与 MongoDB 交互，但这意味着你需要手动编写数据库操作逻辑，而不是使用 Django ORM。

对于对象存储服务（如 Amazon S3），通常使用的是 RESTful API 而非传统的数据库查询语言。在 Django 项目中使用对象存储通常涉及以下步骤：
- 选择合适的库： 例如，对于 Amazon S3，你可以使用 boto3，这是 AWS 的官方 Python SDK。
- 进行配置和认证： 通常需要设置认证凭据和相关配置。
- 使用 SDK 提供的 API： 使用 SDK 提供的方法来上传、下载、列出文件等。

### JWT可以存放在内存、local storage和cookie中，这三个存放地各自有优缺点

Cookie：
优点：自动由浏览器管理，并且可以设置为HttpOnly（无法通过JavaScript访问，增加安全性），支持跨域访问控制（SameSite属性）。
缺点：容易受到CSRF（跨站请求伪造）攻击，尽管可以通过适当的防范措施（如使用CSRF Token）来缓解。

LocalStorage：
优点：易于使用，可以在浏览器会话间持久存储。
缺点：容易受到XSS（跨站脚本攻击）攻击，因为恶意脚本可以访问LocalStorage并窃取令牌。

内存（JavaScript变量）：
优点：在浏览器关闭时自动清除，不容易受到XSS攻击（只要不将令牌暴露给恶意脚本）。
缺点：不持久，用户刷新页面或关闭浏览器时会丢失，可能需要重新认证。

最佳实践：
安全性考虑：通常推荐将JWT存储在HttpOnly的Cookie中，因为这样可以防止JavaScript访问令牌，从而减少XSS攻击的风险。

CSRF防范：如果使用Cookie，应结合CSRF保护机制。

易用性：如果需要在会话间持久保存用户的登录状态，LocalStorage可能更为方便。但是，务必注意XSS攻击的风险，并采取适当的安全措施。

短期使用：对于需要高安全性且可接受在会话结束后用户需要重新登录的场景，可以考虑仅将JWT存储在内存中。

在实践中，选择哪种方式取决于应用的安全需求、用户体验需求以及开发者对相关安全风险的管理能力。在处理任何形式的认证信息时，安全总是首要考虑的因素。**在本项目中，出于安全性和短期使用的考量，我将JWT存储在了内存，即js变量中**。如果没有明确地将JWT存储在Local Storage或Cookie中，那么它们就是存储在内存中。这意味着令牌只在当前页面会话中有效，一旦页面被关闭或刷新，令牌就会丢失。
