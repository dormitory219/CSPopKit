//
//  CSCustomPopController.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/5.
//  Copyright © 2018年 IntSig Information Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSPopControllerProviderProtocol.h"
#import "CSPopController.h"
/*
每个弹窗业务管理类中自定义弹窗样式：供弹窗业务继承
 注意：
 1.该空间提供自适应支持的条件是，自定义视图满足自适应宽高的约束：常见底部约束：
*/

@interface CSCustomPopController : NSObject

@property (nonatomic,strong) id<CSPopControllerProviderProtocol> popController;

- (instancetype)initWithContent:(UIView *)content;

- (void)presentPopControllerAnimated:(BOOL)animated;

- (void)dismissPopControllerAnimated:(BOOL)animated;

@end
