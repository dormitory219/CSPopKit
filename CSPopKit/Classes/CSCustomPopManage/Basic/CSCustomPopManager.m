//
//  CSCustomPopManager.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2017年 IntSig Information Co., Ltd. All rights reserved.
//

#import "CSCustomPopManager.h"

#import "CSCustomPopManagerPrivate.h"

@implementation CSCustomPopManager

static CSCustomPopManager *manager;
+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        manager.handlers = [NSMutableArray arrayWithCapacity:1];
    });
    return manager;
}

- (void)showPopViewWithHandler:(id<CSCustomPopHandlerProtocol,CSCustomPopViewProrocol,CSPopPriorityProtocol>)handler
                    viewLoader:(id<CSCustomPopViewLoaderProtocol>)popViewLoader
                     popControllerLoader:(id<CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol>)popControllerLoader
                 completeBlock:(void (^)(id))completeBlock
            fromViewController:(UIViewController *)viewController
{
    [self showPopViewWithHandler:handler viewLoader:popViewLoader popControllerLoader:popControllerLoader popReformer:nil completeBlock:completeBlock fromViewController:viewController];
}

- (void)showPopViewWithHandler:(id<CSCustomPopHandlerProtocol,CSCustomPopViewProrocol,CSPopPriorityProtocol>)handler
                    viewLoader:(id<CSCustomPopViewLoaderProtocol>)popViewLoader
                    popReformer:(id<CSCustomReformerProtocol>)popReformer
                 completeBlock:(void (^)(id))completeBlock
            fromViewController:(UIViewController *)viewController
{
     [self showPopViewWithHandler:handler viewLoader:popViewLoader popControllerLoader:nil popReformer:popReformer completeBlock:completeBlock fromViewController:viewController];
}

- (void)showPopViewWithHandler:(id<CSCustomPopHandlerProtocol,CSCustomPopViewProrocol,CSPopPriorityProtocol>)popHandler
                    viewLoader:(id<CSCustomPopViewLoaderProtocol>)popViewLoader
                     popControllerLoader:(id<CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol>)popControllerLoader
                    popReformer:(id<CSCustomReformerProtocol>)popReformer
                 completeBlock:(void (^)(id))completeBlock
            fromViewController:(UIViewController *)viewController;
{
    NSLog(@"will show popView");
    
    id<CSCustomReformerProtocol> reformer = nil;
    CSCustomPopView *popView = nil;
    id <CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol> popController = nil;
    id<CSCustomPopHandlerProtocol,CSCustomPopViewProrocol,CSPopPriorityProtocol> handler = nil;
   
    //handler组件处理
    if (popHandler == nil)
    {
        handler = [CSCustomPopHandler handler];
    }
    else
    {
        handler = popHandler;
    }
    handler.delegate = self;
    handler.completeBlock = completeBlock;
    handler.fromViewController = viewController;
    [self.handlers addObject:handler];
    
    //reformer组件处理
    if (popReformer == nil)
    {
        reformer = [CSCustomPopReformer reformer];
    }
    else
    {
        reformer = popReformer;
    }
    handler.reformer = reformer;
    
    //viewloader组件处理:reformer内部处理viewloader是否为空以及方法调用
    if (reformer && [reformer respondsToSelector:@selector(fetchPopViewWithData:viewLoader:)])
    {
        popView = [reformer fetchPopViewWithData:handler.data viewLoader:popViewLoader];
    }
    else
    {
        NSLog(@"reformer not implemention fetchPopViewWithModel:viewLoader method");
    }
    popView.delegate = handler;
    handler.popView = popView;
    
    if (handler && [handler respondsToSelector:@selector(willPresentPopView)])
    {
        [handler willPresentPopView];
    }
    else
    {
        NSLog(@"handler not implemention willPresentPopView menthod");
    }
    BOOL cancel = [[CSPopViewManager sharedManager] addPop:handler];
    if (cancel)
    {
        NSLog(@"cancel pop for popView,priority:%ld",[handler priority]);
        if (handler && [handler respondsToSelector:@selector(cancelPresentPopView)])
        {
            [handler cancelPresentPopView];
        }
        else
        {
            NSLog(@"handler not implemention cancelPresentPopView menthod");
        }
        return;
    }
    else
    {
        NSLog(@"popView did show,priority:%ld",[handler priority]);
    }
    
    //popController组件处理：reformer内部处理popController组件是否为空以及方法调用
    if (reformer && [reformer respondsToSelector:@selector(fetchPopControllerWithData:popControllerLoader:view:)])
    {
        popController = [reformer fetchPopControllerWithData:handler.data popControllerLoader:popControllerLoader view:popView];
    }
    else
    {
        NSLog(@"reformer not implemention fetchPopControllerWithData:popControllerLoader:view: method");
    }
   
    
    handler.popController = popController;
  
    [handler.popController presentPopControllerAnimated:YES];
    if (handler && [handler respondsToSelector:@selector(didPresentPopView)])
    {
        [handler didPresentPopView];
    }
    else
    {
        NSLog(@"handler not implemention didPresentPopView menthod");
    }
    NSLog(@"present popView type:%@,data:%@",NSStringFromClass([popView class]),handler.data);
};

#pragma mark --- CSCustomPopHandlerDelegate

/**
弹窗消失，对应的handler业务销毁，handler被manager回收释放
 @param handler handler业务
 */
- (void)removeHandler:(id)handler
{
    [self.handlers removeObject:handler];
}

@end
