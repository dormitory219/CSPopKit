//
//  CSPopPriorityProtocol.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/5.
//  Copyright © 2018年 IntSig Information Co., Ltd. All rights reserved.
//

#ifndef CSPopPriorityProtocol_h
#define CSPopPriorityProtocol_h

/*
 弹窗业务类中优先级业务需要遵守的协议：
 1.优先级：优先级高，展示权限越高，反之，默认可传100.
 2.dismiss:弹窗管理类需要根据权限将当前正在展示的但优先级低的弹窗dismiss掉
 */

@protocol CSPopPriorityProtocol <NSObject>

@optional
- (NSInteger)priority;

- (void)dismissPopView;

@end


#endif /* CSPopPriorityProtocol_h */
