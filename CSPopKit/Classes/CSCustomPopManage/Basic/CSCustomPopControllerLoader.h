//
//  CSCustomPopLoader.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2017年 IntSig Information Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSCustomPopHeader.h"
#import "CSPopControllerProviderProtocol.h"

/*
 popControllerLoader组件
 
 该组件是一个弹窗展示的容器，
 包裹一个遵守CSPopControllerProviderProtocol协议的pop控件，该控件提供pop样式，包括圆角，宽高，中心位置，偏移，present,dismiss动画等相关。目前该控件统一使用CSPopController
 
 实现的接口如下：
 CSCustomPopControllerLoader：初始化方法，视窗view设置业务
 CSPopControllerProviderProtocol：弹窗控件调用present ,dismiss,init的接口方法
 */

@interface CSCustomPopControllerLoader :NSObject <CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol>

@property (nonatomic,strong) id<CSPopControllerProviderProtocol> popController;

@end
