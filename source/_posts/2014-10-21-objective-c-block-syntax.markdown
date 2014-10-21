---
layout: post
title: "Objective C中Block的几种常用写法"
date: 2014-10-21 18:33:29 +0800
comments: true
categories: [开发, ObjectiveC]
tags: [develop, ios, objectivec]
keywords: ios, objective c, block, syntax
description: Objective C以语法臃肿难记著名，其中Block的写法更是让人蛋疼，因此在这里留着Block的几种常用写法，以供大家备忘查阅。
---

> 孔乙己显出极高兴的样子，将两个指头的长指甲敲着柜台，点头说，“对呀对呀！……回字有四样写法,你知道么？”

现在，Block有多少种写法，你知道吗？Xcode的智能提示与补全虽然强大，但总有需要手写的时候，比如Block的声明与定义，这就是考验你记忆力的时候了。

<!--more-->

Objective C以语法臃肿难记著名，其中Block的写法更是让人蛋疼，有个健忘的外国人不堪折磨，特地建立了一个网站：[How Do I Declare A Block in Objective-C?](http://fuckingblocksyntax.com/)

总结了几种常用的Block的声明方法：

###用作本地变量

``` c
    returnType (^blockName)(parameterTypes) = ^returnType(parameters) {...};
```

###用作属性

``` c
    @property (nonatomic, copy) returnType (^blockName)(parameterTypes);
```

###用作方法参数声明

``` c
    - (void)someMethodThatTakesABlock:(returnType (^)(parameterTypes))blockName;
```

###被方法调用时

``` c
    [someObject someMethodThatTakesABlock: ^returnType (parameters) {...}];
```

###用作Typedef定义

``` c
    typedef returnType (^TypeName)(parameterTypes);
    TypeName blockName = ^returnType(parameters) {...};
```

