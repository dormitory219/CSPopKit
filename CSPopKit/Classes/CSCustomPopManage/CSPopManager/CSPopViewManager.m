//
//  CSPopViewManager.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/5.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSPopViewManager.h"

@interface CSPopViewManager()

@property (nonatomic,strong) NSMutableArray *pops;

@property (nonatomic,weak) id <CSPopPriorityProtocol> currentPop;

@end

@implementation CSPopViewManager

static CSPopViewManager *_sharedManager;
+ (CSPopViewManager *)sharedManager
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^
                  {
                      _sharedManager = [[self alloc] init];
                      _sharedManager.pops = [NSMutableArray array];
                  });
    return _sharedManager;
}

/**
 
 当前展示的弹窗present时统一调用该方法，将该弹窗加入弹窗管理中：优先级低，不加入；优先级高，加入

 @param pop 每个弹窗业务对应的相应的pop
 @return 当前弹窗是否可展示：优先级低，不展示；优先级高，不展示，需要相应的弹窗业务自己处理该值
 */
- (BOOL)addPop:(id<CSPopPriorityProtocol>)pop
{
    self.currentPop = pop;
    __block BOOL cancelCurrentPop = NO;
    if (self.pops.count)
    {
        NSLog(@"the window has pop present");
    }
    else
    {
        NSLog(@"the window has no pop present,so present");
    }
    if (pop)
    {
        [self.pops enumerateObjectsUsingBlock:^(id<CSPopPriorityProtocol> popPriority, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if ([NSStringFromClass(popPriority.class) isEqualToString:NSStringFromClass(pop.class)])
            {
                NSLog(@"try to present the same pop already present");
                cancelCurrentPop = YES;
            }
            else
            {
                if (pop.priority > popPriority.priority)
                {
                    NSLog(@"the pop will present has higher priority,so dismiss current pop");
                    if ([popPriority respondsToSelector:@selector(dismissPopView)])
                    {
                        [popPriority dismissPopView];
                    }
                    else
                    {
                        NSLog(@"reformer not implemetion the protocol method,cannot be dismiss");
                    }
                }
                else
                {
                    NSLog(@"the pop will present has lower priority,so don't pop");
                    cancelCurrentPop = YES;
                }
            }
        }];
        
        if (!cancelCurrentPop)
        {
            [self.pops addObject:pop];
        }
    }
    else
    {
        NSLog(@"reformer is nil");
    }
    return cancelCurrentPop;    
}


/**
 当前展示的弹窗dismiss时统一调用该方法，将该弹窗从弹窗管理中移除

 @param pop 每个弹窗业务对应的相应的pop
 */
- (void)removePop:(id<CSPopPriorityProtocol>)pop
{
    [self.pops removeObject:pop];
}

@end
