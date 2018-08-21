# BZCategory

[![Version](https://img.shields.io/cocoapods/v/BZCategory.svg?style=flat)](https://cocoapods.org/pods/BZCategory)
[![License](https://img.shields.io/cocoapods/l/BZCategory.svg?style=flat)](https://cocoapods.org/pods/BZCategory)
[![Platform](https://img.shields.io/cocoapods/p/BZCategory.svg?style=flat)](https://cocoapods.org/pods/BZCategory)
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)

中文介绍
==============
项目通用分类库。
    
    现有功能：
        1.能直接打印字典，数组，集合内Unicode码内容。
        2.能直接通过NSUserDefault写入、读取自定义对象。
        3.安全字典、数组，避免空值或者越界导致崩溃。（在debug模式下不生效，在Release模式下才生效）。
        4.校验合法手机号码，邮箱，自定义账号密码校验规则。
        5.可将模型数组转换成字典。
        6.UITextField可以直接添加光标左边距以及右边按钮，便于实现密码明文显示等功能。
    准备加入功能：
        1...


安装
==============

### CocoaPods

1. 在 Podfile 中添加  `pod 'BZCategory'`。
2. 执行 `pod install` 或 `pod update`。
3. 导入 "BZCategory.h"。

```ruby
pod 'BZCategory'
```

### 手动安装

1. 下载 BZCategory 文件夹内的所有内容。
2. 将 BZCategory 内的源文件添加(拖放)到你的工程。
3. 导入 "BZCategory.h"。

作者
==============
EricBZH，eric__b@163.com

许可证
==============
BZCategory 使用 MIT 许可证，详情见 LICENSE 文件。
