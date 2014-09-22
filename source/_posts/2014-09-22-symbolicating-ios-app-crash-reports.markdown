---
layout: post
title: "iOS App 崩溃报告符号化，.ips崩溃报告文件分析"
date: 2014-09-22 10:22:22 +0800
comments: true
categories: [开发, iOS, ObjectiveC]
tags: [develop, ios, objectivec]
keywords: iOS, App, crash, symbol, 崩溃分析
description: 收到Windows上传的.ips崩溃报告文件后，对其符号化并分析错误的方法。
---

本文为翻译整理。来源: [Symbolicating iPhone App Crash Reports](http://stackoverflow.com/questions/1460892/symbolicating-iphone-app-crash-reports)

对于App的崩溃分析，一般有两种情形：

* App在本机构建、打包（所以本机已经有了对应的符号表）
* App在别的机器上构建、打包（需要下载.dSYM符号文件）

<!--more-->

###1. App在本机构建、打包

由于我们本机在构建过程中已经生成了符号信息，所以符号化崩溃文件的过程很简单：

1. 重命名崩溃报告文件为`.crash`后缀（对于从Windows导出的崩溃文件适用）
2. 打开`Xcode` - `Organizer` - `Device Logs`
3. 点击`import`，导入.crash文件

这时就可以看到符号化了的崩溃日记。

###2. App在别的机器构建、打包

首先我们从构建机器下载对应的app和.dSYM文件，为了结构清晰，可以和.crash文件放在同一个目录，如`CrashReport`。接下来需要通过终端完成：

1. 用`cd`命令切换到`CrashReport`目录
2. 输入`atos -arch armv7  -o 'APPNAME.app'/'APPNAME'`
3. 这时可以看到光标闪动，被atos命令控制住了。
4. 输入崩溃的堆栈地址，如：`0x0003b508`，可以看到打印出来的错误信息，见下面：

``` bash

  MyMac:CrashReport MyMac$ atos -arch armv7 -o 'myapp.app'/'myapp'
  0x000cdc32 ;崩溃地址
  +[UMANUtil sha1WithData:] (in kiwi) + 86 ;对应的代码

```
