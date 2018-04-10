//
//  CSCustomPopHandler.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSCustomPopHandler.h"
#import "CSPopViewManager.h"
#import "CSPopViewPriority.h"

@implementation CSCustomPopHandler

@synthesize data = _data;

@synthesize completeBlock = _completeBlock;

@synthesize fromViewController = _fromViewController;

@synthesize popController = _popController;

@synthesize reformer = _reformer;

@synthesize delegate = _delegate;

@synthesize popView = _popView;

- (void)dealloc
{
   NSLog(@"popHandler dealloc");
}


#pragma mark --CSCustomPopHandlerProtocol


/**
  初始化方法

 @return <#return value description#>
 */
+ (instancetype)handler
{
    CSCustomPopHandler *handler = [[self alloc] init];
    /*
     do sth with Model
    id data = [CSCustomPopModel new];
    handler.data = data;
     */
    return handler;
}

/**
  初始化方法：该方法和上面方法按业务需要实现其一
 
 @return <#return value description#>
 */
+ (instancetype)handlerWithData:(id)data
{
    CSCustomPopHandler *handler = [[self alloc] init];
    handler.data = data;
    return handler;
}


/**
 　是否要展示该业务弹窗

 @return yes or no
 */
- (BOOL)shouldShow
{
    return YES;
}

/**
 　标记该业务弹窗是否需要展示
 
 @return yes or no
 */
- (void)markShow:(BOOL)show
{
    
}


/**
 该业务弹窗将要展示回调： 调用了show方法，即有该回调
 */
- (void)willPresentPopView
{
    
}

/**
 该业务弹窗根据优先级判断了，可以展示在界面上回调
 */
- (void)didPresentPopView
{
    
}

/**
 该业务弹窗根据优先级判断了，不需要展示，被取消展示了回调
 */
- (void)cancelPresentPopView
{
    
}

#pragma mark --CSCustomPopViewProrocol
/**
 默认实现：可完成handler内所有属性的内存释放，以及优先级逻辑，外界继承可覆盖，也可super调用再实现相应业务逻辑

 @param popView
 */
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

#pragma mark --CSPopPriorityProtocol
/**
 优先级delegate:数字
 
 @return 数字，默认KDefalutPopProprity
 */
- (NSInteger)priority
{
    return KDefalutPopProprity;
}


/**
  优先级delegate:dismiss popview
 */
- (void)dismissPopView
{
    [self dismissPopView:nil];
}

@end
