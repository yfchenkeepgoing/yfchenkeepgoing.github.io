---
title: Detailed Explanation of Java Stream
date: 2024-10-13 18:39:20
tags:
- Java
- Java Stream
categories: 
- web开发
---

# Details Explanation of Java Stream

## 注意

wsl和本地上用IDEA运行java代码，最新修改的结果往往都无法被正常运行出来，我推测是缓存没有及时刷新之类的。有两个解决办法：

- 每次运行前按下快捷键：ctrl + shift + f9，达到rebuild project的目的
- 手动点击上边栏，选择build-rebuild project，选择build project没有作用

根据这个[帖子](https://youtrack.jetbrains.com/issue/IDEA-339871/Line-numbers-are-likely-diverged...-tooltip-is-wrong)，要彻底解决这个问题，恐怕要更新到2024.1以后的版本，我暂时不要更新自己的IDEA，因为当前的IDEA还能够正常使用，而我使用的是破解版的密钥，贸然更新可能会导致反而无法正常使用的情况出现。

## 不可变集合详解

### 创建不可变集合

不可变集合：不可以被修改的集合。其长度和内容都不可以被修改。

创建不可变集合的应用场景：

- 如果某个数据不能被修改，把它防御性地拷贝到不可变集合中是个很好的实践。
- 当集合对象被不可信的库调用时，不可变形式是安全的。
- 某些确定的规则。
- 电脑中的硬件信息。

**简单理解**：不想让别人修改集合中的内容，就可以给他提供一个不可变的集合。拿到不可变集合的人只能做查询操作，不能删除、修改、添加。

创建不可变集合的书写格式：
在List, Set, Map接口中，都存在静态的of方法，可以获取一个不可变的集合。
|                  方法名称                  |                说明                |
| :----------------------------------------: | :--------------------------------: |
|   `static <E> List<E> of(E...elements)`    | 创建一个具有指定元素的List集合对象 |
|    `static <E> Set<E> of(E...elements)`    | 创建一个具有指定元素的Set集合对象  |
| `static <K, V> Map<K, V> of(E...elements)` | 创建一个具有指定元素的Map集合对象  |

`List of`:

```java
package com.cyf.a01immutable;

import java.util.Iterator;
import java.util.List;

public class ImmutableDemo1 {
    public static void main(String[] args) {
    /*
        创建不可变的List集合
        "张三", "李四", "王五", "赵六"
    */

        // ctrl + alt + v可以自动生成List<String> list，只需要自己写List.of即可
        // 一旦创建完毕之后，是无法进行修改的，在下面的代码中，只能进行查询操作
        List<String> list = List.of("张三", "李四", "王五", "赵六");

        // 查询
        System.out.println(list.get(0));
        System.out.println(list.get(1));
        System.out.println(list.get(2));
        System.out.println(list.get(3));

        System.out.println("-----------------------------");

        // 遍历
        for (String s : list) {
            System.out.println(s);
        }

        System.out.println("-----------------------------");

        // 迭代器遍历
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            String s = it.next();
            System.out.println(s);
        }

        System.out.println("-----------------------------");

        // 普通for循环
        for (int i = 0; i < list.size(); i++) {
            String s = list.get(i);
            System.out.println(s);
        }

        System.out.println("-----------------------------");

        // list.remove("李四");
        // list.add("aaa");
        // list.set(0, "aaa");
    }
}
```

`Set of`:

```java
package com.cyf.a01immutable;

import java.util.Iterator;
import java.util.Set;

public class ImmutableDemo2 {
  public static void main(String[] args) {
    /*
        创建不可变的Set集合
        "张三", "李四", "王五", "赵六"
    */

    // ctrl + alt + v可以自动生成List<String> list，只需要自己写List.of即可
    // 一旦创建完毕之后，是无法进行修改的，在下面的代码中，只能进行查询操作
    // 细节：当我们要获取一个不可变的Set集合时，里面的参数一定要保证唯一性
    Set<String> set = Set.of("张三", "李四", "王五", "赵六");

    // set中没有索引，因此查询只能遍历
    for (String s : set) {
      System.out.println(s);
    }

    System.out.println("-----------------------------");

    Iterator<String> it = set.iterator();
    while(it.hasNext()) {
      String s = it.next();
      System.out.println(s);
    }

    System.out.println("-----------------------------");

    // 不能删除、添加、修改
    // set.remove("王五");
  }
}
```

`Map.of`:

```java
package com.cyf.a01immutable;

import java.util.Map;
import java.util.Set;

public class ImmutableDemo3 {
  public static void main(String[] args) {
    /*
    创建Map的不可变集合
    细节1：键是不能重复的
    细节2：Map里面的of方法，参数是有上限的，最多只能传递20个参数，即10个键值对
    细节3：如果我们要传递多个键值对对象，数量大于10个，在Map接口中还有一个方法：Map.ofEntries()
    其将键和值看作一个整体，由于形参中可以有一个可变参数，因此可以实现传递多个键值对对象的功能
    */

    // 一旦创建完毕之后，是无法进行修改的，在下面的代码中，只能进行查询操作
    Map<String, String> map =
        Map.of(
            "张三", "南京", "李四", "北京", "王五", "上海", "赵六", "广州", "孙七", "深圳", "周八", "杭州", "吴九", "宁波",
            "郑十", "苏州", "刘一", "无锡", "陈二", "嘉兴");

    // map.keySet获取所有的键
    Set<String> keys = map.keySet();
    for (String key : keys) {
      String value = map.get(key);
      System.out.println(key + "=" + value);
    }

    System.out.println("-----------------------------");

    // map的第二种遍历方式
    // map.entrySet()获取所有键值对
    Set<Map.Entry<String, String>> entries = map.entrySet();
    for (Map.Entry<String, String> entry : entries) {
      String key = entry.getKey();
      String value = entry.getValue();
      System.out.println(key + "=" + value);
    }

    System.out.println("-----------------------------");
  }

  // 如果我想让这个方法能够接收多个键和值
  // 解决方案：
  // 键 可变参数
  // 值 可变参数
  // 键和值的类型不确定：泛型方法<>
  // 由于两个可变参数无法在形参中共存，因此无法设计这个方法
  //  public static<K, V> void of(K...keys, V...values) {
  //
  //  }

}
```

`Map.ofEntries`:

```java
package com.cyf.a01immutable;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class ImmutableDemo4 {
  public static void main(String[] args) {
    /*
    创建Map的不可变集合，键值对的数量超过10个
    细节3：如果我们要传递多个键值对对象，数量大于10个，在Map接口中还有一个方法：Map.ofEntries()
    其将键和值看作一个整体，由于形参中可以有一个可变参数，因此可以实现传递多个键值对对象的功能
    */

    // 1. 创建一个普通的Map集合
    HashMap<String, String> hm = new HashMap<>();
    hm.put("张三", "南京");
    hm.put("李四", "北京");
    hm.put("王五", "上海");
    hm.put("赵六", "广州");
    hm.put("孙七", "深圳");
    hm.put("周八", "杭州");
    hm.put("吴九", "宁波");
    hm.put("郑十", "苏州");
    hm.put("刘一", "无锡");
    hm.put("陈二", "嘉兴");
    hm.put("aaa", "111");

    // 2. 利用上面的数据来获取一个不可变的集合
    // 获取所有的键值对对象（Entry对象）
    Set<Map.Entry<String, String>> entries = hm.entrySet();
    // 由于可变参数在底层就是一个数组，因此需要将上面的entries变成数组
    // 需要调用指定类型的toArray函数，类型是Map.Entry
    Map.Entry[] arr1 = new Map.Entry[0]; // 将map中的所有数据放到arr中
    // toArray方法在底层会比较集合的长度跟数组的长度两者的大小
    // 如果集合的长度11 > 数组的长度0：数据在数组中放不下，此时会根据实际数据的个数11，重新创建数组
    // 如果集合的长度<=数组的长度：数据在数组中放得下，此时不会创建新的数组，而是直接用
    // 因此数组的长度直接写成0就可以，不用想数组的长度是否和集合的长度匹配
    Map.Entry[] arr2 = entries.toArray(arr1);

    // 不可变的map集合
    Map map = Map.ofEntries(arr2);

    // 不可增删改，只可查
    // map.put("bbb", "222");
  }
}
```

上面的代码非常麻烦，可以简化。

### Stream流

### 方法引用



## 初爽Stream流

## Stream流的思想和获取Stream流

