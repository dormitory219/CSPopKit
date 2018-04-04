# CSPopKit

[![CI Status](http://img.shields.io/travis/dormitory219/CSPopKit.svg?style=flat)](https://travis-ci.org/dormitory219/CSPopKit)
[![Version](https://img.shields.io/cocoapods/v/CSPopKit.svg?style=flat)](http://cocoapods.org/pods/CSPopKit)
[![License](https://img.shields.io/cocoapods/l/CSPopKit.svg?style=flat)](http://cocoapods.org/pods/CSPopKit)
[![Platform](https://img.shields.io/cocoapods/p/CSPopKit.svg?style=flat)](http://cocoapods.org/pods/CSPopKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

CSPopKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CSPopKit'
```

## Author

dormitory219, 289067005@qq.com

## License

CSPopKit is available under the MIT license. See the LICENSE file for more info.


## Getting Started
**CSPopKit是从项目中抽离出的一套弹窗框架，旨在为app内所有的弹窗业务提供一套规范的实现。**

在我司项目中，经过CSPopkit这套方案，重构的弹窗业务已经独立成一个模块，结构如下图
![Alt text](https://github.com/dormitory219/CSPopKit/blob/master/README/屏幕快照%202018-04-04%20下午2.03.07.png)


#### 背景：
多人维护的项目，针对产品需求需要定制各种弹窗，因为没有一套规范实现，每个人根据自己的代码习惯定制不同风格的弹窗，久而久之，项目内出现了各种各种的弹窗代码，有的是直接定制view，添加到superView上，有的是用controller定制，有的加window上，这些杂乱的代码分散在各处，无法清晰梳理出弹窗相关业务的逻辑，而且由于各种各种的弹窗增多，触发时机不同，有可能会出现界面上出现多个弹窗的case，这时候如果要做弹窗的优先级展示，因没有一个底层去维护这些弹窗逻辑，根本就无力做到弹窗的分级控制，基于这些，对项目中的弹窗进行了全部重构。

#### CSPopKit使用：

```
//CSPopKit定义的弹窗三要素组件拼装
CSCustomPopHandler *handler = [CSCustomPopHandler handler];
CSCustomPopViewLoader *viewloader = [CSCustomPopViewLoader loader];
CSCustomPopControllerLoader *popLoader = [CSCustomPopControllerLoader loader];

//CSCustomPopManager底层方法调用
[[CSCustomPopManager shareManager] showPopViewWithHandler:handler viewLoader:viewloader popControllerLoader:popLoader completeBlock:^(id data) {

} fromViewController:nil];
```

你可以理解CSPopKit这套方案为：
CSCustomPopManager为一个厨子（工具类），通过不同的食材元素（弹窗元素）拼接，烹饪出各种不同的食品（弹窗）。

#### CSPopKit设计：

弹窗这类业务较轻，而且多重业务弹窗业务相近，而且同一个app内的弹窗风格相近，所以在设计时容易直接想到用一个manager去中心化管理弹窗，视图在尽量重用的基础上根据业务的不同做各种区分判断，弹窗一多，manager成了一个业务处理的中心爆炸类，包含各类弹窗业务展示条件判断，弹窗视图上元素点击业务处理，数据埋点处理等等，视图这层同样也因为被复用的太多，各种元素选择性的hidden，同一按钮事件根据业务区分不同的delegate回调出去，整个业务线已经纠缠的傻傻分不清了。

这也是我司项目的第一步状况；

在此基础上可以根据弹窗业务线将不同的弹窗业务划分到不同的manager当中，a类业务弹窗用aManager,b类弹窗用bManager,这样从业务职责上就区分出了不同业务，每个业务间相对独立，但这样同样面临以下问题:

1. 弹窗一多，单例太多；
2. 弹窗manager各自独立，没有统一规则，无法做到优先级展示

这也是我重构后弹窗业务的第二步状况；

希望每一个弹窗都能灵活的个性化内容配置，能定制各种弹出，消失动画，能单独处理自己的业务逻辑，基于这些，想到用组件的形式去拼接一个弹窗业务。用组件方式，解决了所有以上的痛点，并且该模块已经形成一个模板，对接触这类业务的新人，也能轻松接入新的弹窗业务。

在CSPopKit中，弹窗的完整实现由以下三要素组成：

- CSCustomPopViewLoader
每个弹窗都有独特定制的view,该view仅仅表达弹窗的内容元素，它与弹窗在什么位置，通过什么方法展示，消失都无关，CSCustomPopViewLoader就是负责装载这个内容view；

```
//CSCustomPopViewLoader.m

- (CSCustomPopView *)view
{
return [CSCustomPopView popView];
}
```

- CSCustomPopControllerLoader
每个弹窗都有自己的展示，消失方式，渐变出现，消失，展示在屏幕的中间，这些都是可以个性化控制，CSCustomPopControllerLoader负责个性化展示；

```
//CSCustomPopControllerLoader.m

- (void)setContent:(UIView *)content
{
CSPopController *popController = [[CSPopController alloc] initWithContent:content];
self.popController = popController;

//通过popTheme来定义不同的展示风格
CSPopTheme *theme = [CSPopTheme defaultTheme];
popController.theme = theme;
}

```

- CSCustomPopHandler
每个弹窗都应该有自己的业务处理，弹窗是否需要展示，展示时机是什么，弹窗视图上的元素点击后如何响应，这些都交给CSCustomPopHandler处理

```
//CSCustomPopHandler.m

- (void)dismissPopView:(CSCustomPopView *)popView
{
[[CSPopViewManager sharedManager] removePop:self];
[self.popController dismissPopControllerAnimated:YES];
self.reformer = nil;
self.popView = nil;
self.popController = nil;
self.completeBlock = nil;
self.fromViewController = nil;
//remove self from manager handlers array
if (self.delegate && [self.delegate respondsToSelector:@selector(removeHandler:)])
{
[self.delegate removeHandler:self];
}
}

```
定制不同的元素后，如何将这些元素装载再一起，展示在界面上形成一个弹窗呢，这就是CSCustomPopManager做的事情。
具体实现逻辑参照这一底层最核心方法：
```
- (void)showPopViewWithHandler:(id<CSCustomPopHandlerProtocol,CSCustomPopViewProrocol,CSPopPriorityProtocol>)popHandler
viewLoader:(id<CSCustomPopViewLoaderProtocol>)popViewLoader
popControllerLoader:(id<CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol>)popControllerLoader
popReformer:(id<CSCustomReformerProtocol>)popReformer
completeBlock:(void (^)(id))completeBlock
fromViewController:(UIViewController *)viewController;
```

##### 其他1：
该弹窗方案提供一套弹窗优先级控制逻辑，每个弹窗业务都可以自定义自己的优先级priority，规定界面上只允许展示一个弹窗。当present一个弹窗a，首先判断当前是否有弹窗展示，没有则直接展示，若有弹窗b，比较弹窗a和弹窗b的优先级，如果a优先级高于b，dismiss当前展示的弹窗b，再present弹窗a，如果a优先级低，弹窗a取消这次present。
这套优先级控制通过该模块控制：
![Alt text](https://github.com/dormitory219/CSPopKit/blob/master/README/屏幕快照%202018-04-04%20下午11.44.53.png)



#### 其他2:

![Alt text](https://github.com/dormitory219/CSPopKit/blob/master/README/屏幕快照%202018-04-04%20下午11.39.12.png)

CSPopController是一个独立的弹窗展示控件，可以单独使用，使用很简单:
内部就是通过外界传入的弹窗视图contentView进行包裹，
```
- (instancetype)initWithContent:(UIView *)content;
```

在外界直接通过present,dissmiss方法来present，dismiss弹窗。

```
//present
- (void)presentPopControllerAnimated:(BOOL)animated;

//dismiss
- (void)dismissPopControllerAnimated:(BOOL)animated;
```

唯一需要注意的是，传入的conyentView需要遵循autolayout布局，而且需要添加底部约束，popcontroller会在内部通过约束帮你做到高度自适应。

popTheme的主题定制
```
+ (instancetype)defaultTheme
{
    CSPopTheme *defaultTheme = [[CSPopTheme alloc] init];
    
//圆角，宽度，弹出，消失动画，动画时间，是否支持点击空白消除等等  defaultTheme.maskTypeTheme(CSPopThemeMaskTypeDimmed).cornerRadiusTheme(16.0f).maxPopupWidthTheme(280.0f).animationPresentionDurationTheme(0.6f).animationDismissDurationTheme(0.6f).shouldDismissOnBackgroundTouchTheme(NO).popThemePresentationStyleTheme(CSPPopThemePresentationStyleSlideInFromTopAndAngleBounce).popThemeDismissStyleTheme(CSPPopThemeDismissStyleSlideInToBottomAndAngle).horizontalOffsetTheme(0.f).verticalOffsetTheme(0.f);
    return defaultTheme;
}

```



