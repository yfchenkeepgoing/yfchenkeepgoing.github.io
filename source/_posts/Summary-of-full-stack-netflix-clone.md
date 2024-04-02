---
title: Summary of full stack netflix clone
date: 2024-03-07 09:39:45
tags:
- 总结
categories: 
- web开发
---

## 技术栈

- Frontend: React
- Server-side Rendering: Next.js
- Styling: Tailwind CSS
- Data abstraction layer: Prisma
- Storage: MongoDB
- Authentication: NextAuth
- Deploy: Vercel
- Typescript
- the entire website fully

The entire website fully responsive across all devices.

## 实现的功能

- credential login: username + password
- profile: automatically generated once we register
- homepage: loaded with a random movie-billboard
- movies: load from database
- favourites: add movies as favourites
- botton:  shows more information about the movie
- play the movie
- Google and GitHub oauth login

## 精简笔记与全栈开发的一般流程

### 登录页面

先在pages中创建auth.tsx，然后在components中创建Input.tsx，将其加入到auth.tsx中。实现next auth时需要创建pages/api/[...nextauth].ts文件。

### 通过授权登录保护登录界面以外的路径
保护路由：

- serverAuth.ts（lib）：利用 next-auth 的 getSession 实现API路由的用户登录检查，防止未登录用户访问。
- current.ts（pages/api）：API路由，使用 serverAuth.ts 验证用户登录，返回用户信息或错误。
  

前端用户信息获取：
- fetcher.ts（lib）：通过 axios 封装的简易数据获取函数。
- useCurrentUser.ts（hooks）：自定义Hook，结合 swr 和 fetcher.ts 从 /api/current 获取当前登录用户信息。
  

客户端路由保护与个人资料页面：
- index.tsx 和 profiles.tsx（pages）：通过 getServerSideProps 中的 getSession 实现路由保护，控制访问权限。
- 页面重定向：auth.tsx 调整登录后重定向逻辑，确保正确导向 /profiles。

实现细节：
- 用户状态展示：在 profiles.tsx 中展示用户信息，并实现点击默认头像返回首页的功能。
- 环境配置调整：通过修改 .env 和 package.json 解决开发中遇到的端口配置问题，保证登录流程正常。

### 导航组件

在这个项目中，开发了一个导航组件（Navigation Component），涉及了几个主要的文件和它们之间的关系，以及各自的功能和作用：

1. index.tsx（主页文件）：这是应用的入口页面，最初被清理以只保留基本结构。它通过 getServerSideProps 功能检查用户的会话，基于会话存在与否决定重定向到登录页面或显示主内容。后续，Navbar 组件被引入到此文件中，作为页面的一部分。

2. Navbar.tsx（导航栏组件）：位于 components 文件夹内，Navbar 是顶部的导航条组件，负责显示应用的导航链接。它包括了一个动态背景变化的功能，随着页面滚动，背景从透明变为不透明。

3. NavbarItem.tsx（导航项组件）：同样位于 components 文件夹内，用于表示 Navbar 中的单个导航链接。它通过 props 接收 label 来显示不同的导航项。

4. MobileMenu.tsx（移动菜单组件）：这个组件负责在小屏幕上显示一个可展开的移动菜单。它通过 visible prop 控制显示状态，包含多个 NavbarItem 组件来展示导航选项。

5. AccountMenu.tsx（账户菜单组件）：用于在 Navbar 组件中显示用户的账户菜单，它提供了注销功能并可以通过 visible prop 控制其显示。

项目中还实现了一些额外的交互特性，比如：

- 使用 React 的 useState 和 useEffect Hooks 来管理组件的状态和生命周期，例如控制菜单的显示状态和根据页面滚动动态改变导航栏背景。
- 通过 useCallback 来优化事件处理函数，避免不必要的重新渲染。
- 导航组件和移动菜单的显示逻辑，包括在小屏幕上通过点击“浏览”来展开和隐藏导航项。
- 在 Navbar 组件中，引入了 react-icons 库中的图标来增强视觉效果，并通过条件渲染实现了箭头图标的旋转动画，以指示菜单的展开和收起状态。
  

整体而言，这个导航组件通过组合多个子组件和利用 React 的特性，实现了一个响应式、具有交互性的用户界面，能够适应不同的设备和屏幕尺寸。

### 广告牌组件

首先将定义有电影信息的json文件手动添加到MongoDB中。
然后创建新的api：random，用于随机返回一部电影。
在`hooks/useBillboard.ts`中写代码以避免对首页推荐电影的重复加载。在`components`中新建`Billboard.tsx`，然后在`index.tsx`中引入`Billboard`。
接着在`Billboard.tsx`中填入具体的内容，目的是fetch the data for a random movie，并继续加入电影、电影名、电影介绍和More info按钮。

### 电影列表和电影卡片组件

定义api: `pages/api/movies/index.ts`，加载所有电影。
接着在hooks文件夹中创建`useMovieList.ts`，用于返回`api/movies`中得到的数据。
接着在`components`中创建`MovieList.tsx`，并在`pages/index.tsx`中装入MovieList并传入必要的参数，并使用上面定义的hook: `useMovieList.ts`。
接着在`components`文件夹中创建`MovieCard.tsx`文件，用于实现电影卡片组件，并将`MovieCard`放入`MovieList.tsx`中。

### 收藏功能

定义api: `pages/api/favorite.ts`，用于实现用户在收藏和取消收藏电影时对数据库的操作。
再定义一个api: `pages/api/favorites.ts`，用于加载我们收藏的电影列表。
接着写一个hook: `useFavorites.ts`，用于调用第二个api从而加载我们收藏的电影列表。
再写一个组件`components/FavoriteButton.tsx`，作为收藏按钮。
将该按钮加入MovieCard中。然后在Trending Now列表以外再创建一个My Favorites列表，这是在`pages/index.tsx`中实现的。
最后让favorite按钮变得可交互。这样在Trending Now列表上的电影上的加号时，其就会被添加到My List，然后加号会变成勾。这样一部电影就被收藏了。取消收藏也是同理。

### 电影播放功能
首先定义api: 创建`pages/api/movies/[movieId].ts`，用于通过外部传入的movieId找到电影。
再创建`hooks/useMovie.ts`，调用上述api，并负责给上述api传入参数movieId。
接着写播放按钮：`components/PlayButton.tsx`，并在`components/Billboard.tsx`中加入播放按钮。
现在实现了点击播放按钮，跳转到另一个页面的功能，接着在MovieCard组件中也实现这个功能。
然后具体写跳转到的`/watch`页面，创建`pages/watch/[movieId].tsx`，并在这个页面中实现加载视频名字、返回等功能。

### 电影详细信息功能

实现的功能：点击More Info按钮，会显示电影的信息。
创建用于状态管理（打开或关闭More Info）的钩子：`hooks/useInfoModel.ts`。
创建显示电影详细信息的组件：`components/InfoModal.tsx`
在pages/index.tsx中加入上述组件。
给InfoModal组件加上关闭、播放、收藏按钮，最后加上电影信息等字样。
利用onClick函数实现点击关闭按钮关闭页面的功能。
在`pages/index.tsx`中实现对组件`InfoModal.tsx`的触发，从而展现电影的详细信息。
`components/Billboard.tsx`中实现点击More Info按钮触发组件`InfoModal.tsx`，从而展现电影的详细信息。
在电影卡片组件中同样实现点击按钮展现电影详细信息。
修复个人profile中名字始终加载为username的问题。

### 给全栈项目开发新功能的一般过程

熟悉了上述精简版本的笔记后，我们可以对全栈项目（react + next.js）的开发做一些总结。

对于实现登录页面和通过授权登录保护登录界面以外的路径，这两项属于偏后端的范畴，主要利用的是next.js的一些特性（特别是pages和api）。这两个任务没有什么一般性的套路，需要用到的文件夹也比较复杂，包括pages, hooks, lib等，跟着讲义一步步实现。

对于实现导航组件，这个属于偏前端的范畴，主要需要在pages中定义一个菜单界面，再在components中定义若干个组件。在这里需要注意组件的复用。组件拼凑组合起来就能实现一个网页。同时还需要注意如何实现交互特性和其他的一些细节。

对于广告牌组件、电影列表和电影卡片组件、收藏功能、电影播放功能、电影详细信息功能，这些都属于前后端交互的范畴，是有统一的开发套路的。**一般来说是先定义api，再定义hook（调用api），再定义组件（调用hook获取api的数据），再将组件加入到页面（pages）中**。这就是开发全栈项目的一般的新功能（非拓荒）的一般过程。

## 我的思考

1. Tailwind CSS的好处：我的主要感受是不需要手写css文件，直接在classname中写内容就可以。注意使用Tailwind CSS前，需要进行必要的配置。Tailwind CSS的具体优点如下所示：

   - 快速原型开发
   Tailwind 的实用工具类使得快速原型设计变得非常简单。你可以通过组合不同的类来快速构建界面，而不需要离开 HTML 文件去编写和调试 CSS 文件，这可以显著加快开发速度。

   - 一致性和可重用性
   通过使用 Tailwind 提供的实用工具类，可以在整个项目中保持样式的一致性。由于你在不同的地方复用相同的实用工具类，这自然而然地导致了样式的可重用性和一致性。

   - 可定制和可配置
   Tailwind CSS 高度可定制。你可以根据项目的设计指南调整配置文件（如颜色、字体大小、边距等），这使得创建符合品牌指南的设计变得简单。

   - 减少 CSS 的复杂性
   由于采用实用工具类的方式，你可以避免编写过多的自定义 CSS 和处理复杂的 CSS 继承关系，这降低了代码的复杂性。

   - 响应式设计友好
   Tailwind CSS 内置了响应式设计的支持，通过简单的前缀可以轻松地实现不同屏幕尺寸的样式适配，而不需要编写额外的媒体查询。

   - 减少未使用的 CSS
   通过与 PurgeCSS 的集成，Tailwind CSS 可以在构建过程中自动移除未使用的 CSS，这意味着最终的样式表非常精简，加载时间快。

   - 总结
   尽管 Tailwind CSS 提供了诸多好处，如加速开发、提高一致性和可维护性，但它也有一定的学习曲线，尤其是对于习惯了传统 CSS 开发方式的开发者来说。此外，一些开发者可能会对在 HTML 中大量使用实用工具类表示担忧，担心这会导致 HTML 文件的可读性降低。不过，对于许多项目和团队而言，Tailwind CSS 提供的好处远远超过了这些潜在的缺点。

2. Google oauth比较难用。在本地将项目跑起来时，Google oauth功能正常，但当我尝试在vercel上部署本项目时，Google oauth就完全无法正常使用，甚至每次产生的报错信息都不相同。与此形成鲜明对比的是，GitHub oauth比较好用，配置和更改都较为简单，且将项目部署在vercel上以后再使用GitHub oauth也不会出问题。

3. Next.js和React各自的作用：

   React 和 Next.js 在一个项目中的共存实际上非常常见，并且它们各自扮演着互补的角色。理解它们的主要用途有助于更好地利用这两个库/框架来构建你的应用。

   React

   React 是一个用于构建用户界面的 JavaScript 库，由 Facebook 开发。它的主要特点是组件化开发和声明式编程，使得开发复杂、高性能的单页应用（SPA）变得简单。React 本身主要关注于视图层（UI），允许开发者以组件的形式构建复杂的用户界面。它并不提供诸如路由、服务器端渲染等功能，这些通常需要通过其他库或框架来实现。

   Next.js

   Next.js 是一个基于 Node.js 的框架，它为 React 应用提供了额外的结构和功能，如自动的代码分割、服务器端渲染（SSR）、静态站点生成（SSG）、基于文件的路由系统、API 路由等。Next.js 旨在解决 React 单页应用的一些限制，特别是在 SEO 和首屏加载性能方面。通过服务器端渲染，Next.js 可以提前渲染页面，使其内容能够被搜索引擎索引，同时也提升了页面加载的速度。

   它们是如何一起工作的

   - React 在项目中的角色：负责定义应用的组件结构、状态管理和用户交互逻辑。开发者会使用 React 来创建应用的各个界面组件。
   - Next.js 在项目中的角色：提供框架和额外功能，帮助这些 React 组件以更高效、优化的方式被呈现和服务。**例如，Next.js 通过文件系统提供的路由功能，自动将位于 `pages/` 目录下的 React 组件转换为可访问的页面**。

   总结

   在一个项目中，React 用来构建用户界面的组件，而 Next.js 则用来增强 React 应用，提供路由、预渲染（SSR 或 SSG）等功能，以及优化应用的性能和可访问性。Next.js 让开发者能够更专注于业务逻辑和组件本身，而不是底层的架构问题，从而简化了 React 应用的开发和部署过程。简言之，你可以将 React 视为构建应用的砖块，而 Next.js 则是将这些砖块组织起来，建造出结构化、高效、易于维护的应用的框架。**我的理解：React只能做前端，而React+Next.js就可以做全栈了**。

4. Prisma是一款现代化的ORM框架，它可以连接到多种数据库类型（如 PostgreSQL 、 MySQL 、 SQLite 和 SQL Server等），在本项目中我们用Prisma连接了MongoDB。在ORM的帮助下，我们不需要写SQL语句，只需要定义数据库中的数据名称和数据类型，就可以实现对数据库的各种操作。

5. 本项目中的大多数代码都是Typescript（.ts）代码或者TypeScript JSX(.tsx)代码。前者是基于javascript开发的。TypeScript 是 JavaScript 的一个超集，这意味着它包含了 JavaScript 的所有功能，并在此基础上添加了更多的特性。后者是 TypeScript 的扩展，允许在 TypeScript 文件中使用 JSX 语法。JSX 是一种语法糖，允许开发者在 JavaScript 代码中写像HTML一样的标记语言，这在React 开发中非常常见。由于 TypeScript 默认不理解 JSX 语法，TSX（`.tsx` 文件扩展名）提供了一种方式来使用 TypeScript 和 JSX。因此，`.tsx` 文件通常用于包含 JSX 的 TypeScript 项目，尤其是在开发 React 组件时。**简而言之，当代码中需要有类似HTML的代码时，即需要创建一个页面或者页面的一部分时，用tsx。无类似HTML的代码，则用ts**。在本项目中，定义所有组件的components文件夹中的文件全用了tsx，因为要写HTML代码；同理，pages文件夹中除了api文件夹以外的所有文件用的也是tsx。剩下的文件夹中的文件普遍用的是ts，包括hooks文件夹，lib文件夹和pages/api文件夹。

6. 本项目中几个主要文件夹的作用：

   属于 Next.js 的特定文件夹：

   - **pages**：这是 Next.js 特有的一个文件夹，用于基于文件系统的路由。在 Next.js 中，`pages` 目录下的每一个文件都会自动对应一个路由，这是 Next.js 框架的核心特性之一。pages中还有api文件夹，因此在本项目中可以像前后端分离的项目那样在后端定义api，然后在前端调用。**只不过本项目中是在next.js实现的伪后端中定义api，然后在react实现的纯前端中调用api**。
   - **public**：这个文件夹也是 Next.js 的标准部分，用于存放静态文件，如图片、字体等。在项目中，你可以通过相对路径直接引用 `public` 文件夹中的资源。
   - **styles**：虽然存放样式的做法在前端项目中非常常见，但在 Next.js 项目中，`styles` 文件夹通常用于组织 CSS 或 SCSS 文件。Next.js 支持 CSS Modules 和内置的 Sass 支持，这个文件夹通常用来利用这些特性。本项目中的styles文件夹中只有一个global.css文件，主要负责对tailwind css的配置和定义一些默认的css格式。

   通常属于开发者根据项目需求创建的文件夹（既适用于 React，也适用于 Next.js）：

   - components：存放 React 组件的文件夹。这些组件可以在不同的页面中复用。这是 React 项目的常见结构，但在 Next.js 项目中同样适用。

   - hooks：存放自定义 React 钩子（Hooks）。自定义钩子是 React 16.8 引入的功能，用于在函数组件之间复用状态逻辑。

   - lib：通常用于存放一些工具库或者用于与 API 交互的函数等。这个文件夹的具体用途依项目需求而定，既适用于纯 React 项目，也适用于 Next.js 项目。

   数据库相关的文件：

   prisma：这个文件夹通常用于存放与 Prisma 相关的配置和模型文件。Prisma 是一个流行的 Node.js 和 TypeScript ORM（对象关系映射），用于构建数据库访问。这不是 Next.js 或 React 特有的，而是根据你的项目是否需要与数据库交互来决定使用。

   总结：
   Next.js 特有：pages 和 public 文件夹是 Next.js 特定的，而 styles 虽然不是 Next.js 特有的，但其在 Next.js 项目中的使用方式往往利用了 Next.js 的一些特性。

   React 和 Next.js 通用：components、hooks、lib 和 prisma 文件夹是根据开发者的项目需求创建的，它们既适用于 React 项目，也适用于 Next.js 项目。这些文件夹的使用反映了现代前端项目的一些最佳实践，如组件化开发、自定义钩子的使用等。

7. 本项目中使用到了hook的以下功能：

   - 状态管理 (`useState`)
     这是 Hooks 最基本的用途之一，允许在函数组件中添加状态。这对于实现按钮点击、输入表单处理、切换UI组件显示隐藏等功能至关重要。
     
   - 数据获取（`useSWR`）
     `useSWR` 是一个由 Vercel 团队开发的 React Hook，它是 SWR (Stale-While-Revalidate) 数据获取库的一部分。SWR 是一种缓存策略，其名称来自 HTTP 缓存无效化策略，意味着“先返回缓存中的数据（陈旧的），然后发送请求（重新验证），最后用新数据替换旧数据”。`useSWR` 主要用于数据获取场景，特别是在需要频繁请求更新数据的应用中，它提供了一种简单而强大的方法来获取、缓存、更新远程数据。
     
   - 副作用处理 (`useEffect`)
   用于执行副作用操作，如数据获取（调用API）、订阅/取消订阅事件、直接操作DOM。这对于在组件加载、更新或卸载时执行外部操作非常有用。
   
   - 性能优化 (`useCallback`)
     `useCallback` 可以避免在每次渲染时都进行不必要的计算或创建新的函数实例，从而提高性能。
   
     需要特别注意的是，hook是一种概念，因此不局限于定义在某个特定的文件夹（如 `hooks` 文件夹）中，而是可以在函数的任何地方使用。在本项目中，hooks文件夹中的hooks主要负责对api的调用，而components, pages等文件夹中的hooks主要负责状态管理和性能优化。
   
   
   
   



