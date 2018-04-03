//
//  CSCustomPopManagerTest.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSCustomPopManagerTest.h"
#import "CSCustomPopManagerHeader.h"
#import "CSCustomPopLowProprityHandler.h"
#import "CSCustomPopHighProprityHandler.h"

@implementation CSCustomPopManagerTest

/**
 测试单个弹窗弹出效果
 */
+ (void)testPopView
{
    CSCustomPopHandler *handler = [CSCustomPopHandler handler];
    CSCustomPopViewLoader *viewloader = [CSCustomPopViewLoader loader];
    CSCustomPopControllerLoader *popLoader = [CSCustomPopControllerLoader loader];
    
    [[CSCustomPopManager shareManager] showPopViewWithHandler:handler viewLoader:viewloader popControllerLoader:popLoader completeBlock:^(id data) {
        
    } fromViewController:nil];
}


/**
 测试单个弹窗错误调用两次
 */
+ (void)testRepeatPop
{
    [self testPopView];
    [self testPopView];
}


/**
 测试多个优先级的弹窗弹出效果
 */
+ (void)testMultiplePop
{
    CSCustomPopHandler *handler = [CSCustomPopHandler handler];
    CSCustomPopHighProprityHandler *highPriorityHandler = [CSCustomPopHighProprityHandler handler];
    CSCustomPopLowProprityHandler *lowPriorityHandler = [CSCustomPopLowProprityHandler handler];
    CSCustomPopViewLoader *viewloader = [CSCustomPopViewLoader loader];

    CSCustomPopControllerLoader *popLoader = [CSCustomPopControllerLoader loader];
    
    NSMutableArray *handlers = [NSMutableArray arrayWithArray:@ [handler,lowPriorityHandler,highPriorityHandler]];
    
    CSCustomPopHandler *showHandler = handlers[arc4random_uniform((uint32_t)handlers.count)];
    [handlers removeObject:showHandler];
    [self showPopWithHandler:showHandler viewLoader:viewloader popLoader:popLoader];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        CSCustomPopHandler *showHandler = handlers[arc4random_uniform((uint32_t)handlers.count)];
        [handlers removeObject:showHandler];
        [self showPopWithHandler:showHandler viewLoader:viewloader popLoader:popLoader];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        CSCustomPopHandler *showHandler = handlers[arc4random_uniform((uint32_t)handlers.count)];
        [handlers removeObject:showHandler];
        [self showPopWithHandler:showHandler viewLoader:viewloader popLoader:popLoader];
        });
}

+ (void)showPopWithHandler:(CSCustomPopHandler *)handler viewLoader:(CSCustomPopViewLoader *)viewLoader popLoader:(CSCustomPopControllerLoader *)popLoader
{
    [[CSCustomPopManager shareManager] showPopViewWithHandler:handler viewLoader:viewLoader popControllerLoader:popLoader completeBlock:^(id data) {
        
    } fromViewController:nil];
}


@end
