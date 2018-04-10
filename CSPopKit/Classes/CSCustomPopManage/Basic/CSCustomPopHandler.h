//
//  CSCustomPopHandler.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSCustomPopHeader.h"
#import "CSPopPriorityProtocol.h"
#import "CSPopControllerProviderProtocol.h"
/*
handler组件
 
handler为每种弹窗的业务中心处理类，该类作用是轻量manager，分离manager里不同弹窗的业务（manager+category的处理方式或许不是最明智？）：比如升级新特性业务，贺卡引导业务，贺卡新特性引导业务
 从manager里持有外部的fromViewController，popController样式，completeBlock回调，以及该弹窗的优先级处理，并持有弹窗视图view,如果view需要数据支持，在handler中应完成数据的初始化操作
 
 注意，处理的业务逻辑比较多，但并不包括根据数据model匹配弹窗view的展示和为view根据model定制不同的popController样式，该逻辑抽离到reformer中专门处理（当然不细粒度分的话reformer的逻辑可以完全移到handler中去做）。
 
 不同的业务即使业务相近，也最好不要共用handler，涉及优先级等无法区分处理了
 
 实现的接口如下：
 CSCustomPopHandlerProtocol：弹窗业务将显示，已显示，取消显示，是否显示等业务，以及相关属性
 CSCustomPopViewProrocol：弹窗关闭业务处理
 CSPopPriorityProtocol：弹窗优先级相关
 */

@interface CSCustomPopHandler : NSObject<CSCustomPopHandlerProtocol,CSCustomPopViewProrocol,CSPopPriorityProtocol>

@end
