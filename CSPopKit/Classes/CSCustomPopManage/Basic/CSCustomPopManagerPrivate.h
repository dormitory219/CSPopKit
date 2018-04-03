//
//  CSCustomPopManagerPrivate.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2017年 IntSig Information Co., Ltd. All rights reserved.
//

#ifndef CSCustomPopManagerPrivate_h
#define CSCustomPopManagerPrivate_h

#import "CSPopViewManager.h"

#import "CSCustomPopHandler.h"
#import "CSCustomPopReformer.h"
#import "CSCustomPopViewLoader.h"
#import "CSCustomPopControllerLoader.h"
#import "CSCustomPopView.h"

@interface CSCustomPopManager()<CSCustomPopHandlerDelegate>

@property (nonatomic,strong) NSMutableArray<id<CSCustomPopHandlerProtocol,CSCustomPopViewProrocol,CSPopPriorityProtocol>> *handlers;

@end

#endif /* CSCustomPopManagerPrivate_h */
