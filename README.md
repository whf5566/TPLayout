[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/ibireme/YYKit/master/LICENSE)&nbsp;
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/TPLayout.svg?style=flat)](http://cocoapods.org/pods/TPLayout)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/TPLayout.svg?style=flat)](http://cocoadocs.org/docsets/TPLayout)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
[![Build Status](https://travis-ci.org/whf5566/TPLayout.svg?branch=master)](https://travis-ci.org/whf5566/TPLayout)  

# TPLayout
TPLayout是一个轻量、快速、方便的使用代码进行UI布局的高效率工具库。TPLayout同时支持两种常见的代码布局方式，提供非常简短的方法来获取和设置Frame值；也提供了类似Masonry的链式语句的方法来设置view的约束。

## 简介
TPLayout结合了Masonry和PureLayout这两个最常用的UI布局工具的优点。Masonry使用链式语句构建约束，但是我们不能获取到每条链式语句对应的NSLayoutConstraint对象，NSLayoutConstraint对象的生成被隐藏在Masonry的mas_makeConstraints等三个方法内部；PureLayout使用简单的方法构建约束，并返回了NSLayoutConstraint对象，但没有链式语句直观易读。TPLayout结合了两者的优点，每一条链式语句生成一个约束，并返回NSLayoutConstraint对象，如果是复合属性的约束，比如size，center，edge等，则返回对应的
NSLayoutConstraint对象数组。  

-  Frame: 提供简短的方法来设置view的Frame值和两个view间的对齐关系    
-  AutoLayout: 通过链式语句来设置view的约束  
-  AutoLayout: 一条链式语句生成一个NSLayoutConstraint对象或者NSLayoutConstraint对象的数组   
-  AutoLayout: 可以重置、更新使用该库生成的约束  
-  AutoLayout: 通过NSAssert断言防止X轴Y轴方向上设置错误的约束  

## 安装使用
### 开发环境  

-  xcode8及以上
-  ios7及以上  

### 使用CocoaPods安装  
* 添加「 pod 'TPLayout' 」到你的Podfile文件中，然后在命令行中运行 pod install   

### 使用Carthage安装  
* 添加「 git "https://github.com/whf5566/TPLayout.git" "master"  」到你的Cartfile文件中，然后在命令行中运行 carthage update --platform iOS
* 在你的项目中添加刚才生成的TPLayout.framework动态库  

### 源码引入  
* 将TPLayout文件夹拖入到你的项目中即可

## Demo
### Frame布局  
```objectivec
// 设置大小
viewA.tp_size = CGSizeMake(100, 100);  

// 设置左上边距
viewA.tp_top = 10;
viewA.tp_left = 10;  

// 设置左上边距时，保持右下边距并自动调整view的size大小
viewB.tp_topResize = 10;
viewB.tp_leftResize = 10;  

// 设置左右边距距其他view的边距10px.
[viewC leftToViewLeft:otherView offset:10 fixedSize:NO];
[viewC rightToViewRight:otherView offset:-10 fixedSize:NO];

// 在其他的view中居中
[viewD centerInView:otherView]; // or
[viewD centerToView:otherView offsetSize:CGSizeZero];

// 距离其他View中心点左边10px
[viewE centerXToView:otherView offset:10]; // or
[viewE centerToView:otherView offsetSize:CGSizeMake(10,0)];

// 边距距其他view10px
[viewF edgesToView:otherView offsetEdge:UIEdgeInsetsMake(10, 10, 10, 10)];

```  

### AutoLayout布局  
```objectivec
// 设置约束
view.al_top.greaterOrEqual(otherView.al_top).offset(10);
view.al_left.lessOrEqual(otherView.al_left).offset(10);
view.al_bottom.equal(otherview.al_top).offset(-10);
view.al_height.equal(100);
view.al_width.equal(@100);

// 设置复合属性的约束
view.al_size.equal(CGSizeMake(100,100));
view.al_center.equal(otherView).centerOffset(CGPointMake(10,10));
view.al_edges.equal(superview).insets(UIEdgeInsetsMake(10, 10, 10, 10));

// 设置约束优先级
view.al_width.priority(750).equal(@(10));

// 设置约束multiplier
view.al_width.multiplier(3).equal(otherView.al_width);

// 更新约束
view.al_width.update().lessOrEqual(superview);
// or use macros
view.al_update(al_width).lessOrEqual(superview);

// 重置约束
view.al_width.reset().lessOrEqual(superview);
// or use macros
view.al_reset(al_width).lessOrEqual(superview);

// 重置所有约束
view.al_resetAll();

```

