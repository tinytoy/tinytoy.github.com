---
layout: post
title: "最受欢迎的iOS开源库，以及找到最热门开源框架的方法"
date: 2014-10-16 10:28:20 +0800
comments: true
categories: [开发, iOS, ObjectiveC]
tags: [develop, ios, objectivec]
keywords: iOS, Open Source, CocoaPods, Github
description: 本文列举了在iOS开发届最受欢迎、用户最多的开源框架，并授人以渔地提供了找到最热门的开源框架的方法。
---

{% img left /images/develop/lessfun_ios_open_source_github.png 'ios open source projects on github' %}

"我就是要重复造轮子"，几乎每个程序员都这么想，一方面是由于程序员觉得自己造出来的轮子才是世界上最完美的轮子，无论是接口设计、遍历命名、代码对齐还是文档注释，一切看起来都那么顺眼。  
另一方面，则是程序员不知道别人已经造出来了功能类似但质量更好的轮子。

本文列举了在iOS开发届最受欢迎、用户最多的开源框架，并授人以渔地提供了找到最热门的开源框架的方法。旨在帮助iOS开发者发现更大的轮子，避免重复造轮子。

当然，你可以自己开发一个更好用更受欢迎的开源库。

<!--more-->
###最受欢迎的iOS开源库

开发iOS App，总是避免不了这些模块：`网络检测`，`网络访问`，`文件解析`，`数据存储`，`进度显示`，`统计上报`，等等。数一下，如果每个模块都得自己重新写代码，那得耗费多少时间。

好消息是，上述所有的模块，在网上都有很优秀的开源库可以使用，而且基本都提供了CocoaPods的集成方法，最大程度简化了iOS开发者的代码量。

####网络检测：Reachability

这是苹果官方提供的开源代码，用于检测设备的网络状态，判断网络是否可用，当前的网络类型是2G/3G，还是WiFi。  
主页：[Reachability](https://developer.apple.com/library/IOs/samplecode/Reachability/Listings/Reachability_Reachability_h.html)

####网络访问：AFNetworking

一个轻量级的网络访问库，在GitHub上得到的Star是10000+，可见其受欢迎程度。几乎每个需要访问网络的App，必定都集成了这个开源库。  
主页：https://github.com/AFNetworking/AFNetworking

####数据存储：FMDB

iOS与Mac OS中对SQLite的封装，简化数据库存储的代码。  
主页：https://github.com/ccgus/fmdb

####文件解析：JSONKit与RaptureXML

解析json与xml文件的工具。  
JSONKit主页：https://github.com/johnezang/JSONKit  
RaptureXML主页：https://github.com/ZaBlanc/RaptureXML

####进度显示：SVProgressHUD

简洁好用的状态、进度显示框。  
主页：https://github.com/TransitApp/SVProgressHUD

####网络图片：SDWebImage

一个UIImageView的扩展，可以支持显示网络上的图片。  
主页：https://github.com/rs/SDWebImage

####统计上报：友盟

数据统计、错误上报，推荐使用友盟提供的SDK，同时还提供了用户反馈功能。  
主页：http://www.umeng.com/

###找到最热门开源框架的方法

####Google

谷歌是一切网站的入口，互联网上的所有数据，基本上都可以通过谷歌找到，而你所需要的只是提供适当的关键字进行搜索。

####Github

开源库基本上都集中在GitHub，所以可以跳过谷歌，直接在GitHub中搜索。

####CocoaPods Search

如果使用CocoaPods，那么也可以在pod中搜索。如下：

``` bash

    MacBook-Air:develop user$ pod search autolayout

  -> AutoLayoutCells (0.4.2)
   AutoLayoutCells makes working with dynamic table view cells easy.
   pod 'AutoLayoutCells', '~> 0.4.2'
   - Homepage: https://github.com/JRG-Developer/AutoLayoutCells
   - Source:   https://github.com/JRG-Developer/AutoLayoutCells.git
   - Versions: 0.4.2, 0.4.1, 0.4.0, 0.3.0, 0.2.1, 0.2.0 [master repo]
   - Sub specs:   - AutoLayoutCells/SharedCategories (0.4.2)   - AutoLayoutCells/TableViewCells (0.4.2)

```

####ios.hew.io

这是一个网站，收录了iOS、Android、JavaScript相关的开源库，并且按照热门程度给出搜索结果。
主页：http://ios.hew.io

