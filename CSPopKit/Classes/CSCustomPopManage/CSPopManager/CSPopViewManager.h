//
//  CSPopViewManager.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/5.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSPopPriorityProtocol.h"

/*
 弹窗管理类，管理程序内所有自定义弹窗：
1.当前无弹窗：
 展示当前弹窗
 
2.当前已经至少有一个弹窗
 1.判断是否展示重复的弹窗（同一个弹窗present两次），若重复，取消当前present;
 2.判断当前优先级的弹窗是否可展示：优先级低，当前弹窗不展示，优先级高，当前弹窗展示，并dismiss调目前正在展示优先级低于当前弹窗的弹窗
 
 */

@interface CSPopViewManager : NSObject

+ (CSPopViewManager *)sharedManager;

- (BOOL)addPop:(id<CSPopPriorityProtocol>)pop;

- (void)removePop:(id<CSPopPriorityProtocol>)pop;

@end
