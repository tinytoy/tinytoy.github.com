---
layout: post
title: "Objective C提高开发效率的10个实用的宏定义"
date: 2014-09-18 15:59:36 +0800
comments: true
categories: [开发, ObjectiveC, iOS]
tags: [develop, ios, objectivec]
keywords: Objective C, 宏, iOS
description: 在使用Objective C开发iOS项目时，用上这10个实用的宏，可以有效提高开发效率，简洁代码。
---

{% img left /images/develop/lessfun_c_macros.gif 'c macros' 'c macros' %}

在类C语言中，宏的存在一直具有争议性，支持者觉得宏可以大大提高效率，使代码更简洁，用起来得心应手；反对者则认为，宏使得变量失去了类型，并且难以调试，降低了代码的可读性。这里我不准备探讨宏本身的意义，只想说明，在使用Objective C开发iOS项目时，这10个实用的宏，可以大大地提高你的开发效率，并且不影响可读性。

<!--more-->

Objective C的语法十分冗余，命名也是长不忍睹，虽然有自动补全，但是写起来还是很不方便，而宏定义就是为解决这些烦恼而生。如果你是宏定义一生黑，也可以用函数替换。

以下宏定义保存在一个文件`YourMacro.h`中，并且在预编译头文件xx-Prefix.pch中#import，就可以在全局工程中使用了。

###Device Info

判断设备类型：

``` c

	#define IsIPad   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    #define IsIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

```

###System Version

获取系统版本信息：

``` c

	#define SystemVersionLessThan(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

```

例如，判断iOS版本，是否低于iOS7：

``` c

	if (SystemVersionLessThan(@"7.0")) {
		return;
	}

```


###UI

判断是否为高清屏：

``` c

	#define IsRetina  ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] >= 2)

```

###Color

``` c

	#define Color_RGB(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]
	#define Color_RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]

	//用法
	view.backgroundColor = Color_RGB(0, 0, 0);

```

###NSString

``` c

	#define NSStringFromInt(d) [NSString stringWithFormat:@"%d", (d)]
	#define NSStringFromLong(d) [NSString stringWithFormat:@"%lld", (d)]
	#define NSStringConcat(str1, str2) [NSString stringWithFormat:@"%@%@", (str1), (str2)]
	#define NSStringFromNSData(data) [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
	#define NSDataFromNSString(str) [str dataUsingEncoding:NSUTF8StringEncoding]

```

###Number

``` c

	//比较浮点数
	#define FloatEqual(f1, f2)     ( fabs( (f1) - (f2) ) < 0.0001 )
	//使数值在上下限内
    #define MID(x, y, z)                    ( y < x ? x : (z < y ? z : y) )

```

###Notification

``` c

	/**
	 * 通知声明
	 */
	#define N_Dec(notification) extern NSString * const notification
	
	/**
	 * 通知定义
	 */
	#define N_Def(notification) NSString * const notification = @#notification

```

###Localization

``` c

	#define L(key) NSLocalizedString(key, nil)
	//用法
	label.text = L(@"Hello");

```

###Debug & Log

NSLog默认会在Debug和Release版都打印，如果希望Release版本不打印Log：

``` c
	#ifdef DEBUG
		#define MyLog( s, ... ) NSLog( @"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  [NSString stringWithFormat:(s), ##__VA_ARGS__] )
	#else
		#define MyLog( s, ... )
	#endif

```

###App

``` c

	/**
	 * 是否内测版本
	 */
	#define IsInternalApp ([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.inc.enterprise.proj"])
	
```