//
//  CSCustomPopManager.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CSCustomPopHeader.h"

/*
1. CSCustomPopManager组件的中心处理类：
 外界传入handler,popViewLoader,popControllerLoader,popReformer等组件，各组件按照各自协议约定实现方法，
 manager对这些组件进行相应方法调用，逻辑处理model,view,popContontroller，并present到界面上
 
 2.外部未传入的组件，因内部默认逻辑需要，内部会引用该类组件的默认实现类：
 如handler对应的CSCustomPopHandler
   popControllerLoader对应的CSCustomPopControllerLoader
   popReformer对应的CSCustomPopReformer
   viewloader对应的CSCustomPopViewLoader
 
 3.整个弹窗模块为最基本实现（范式实现），其他业务使用可直接调用CSCustomPopManager作为外部暴露方法，
 真正业务其余组件使用可用两种方法
 1.不用对各协议完全实现，可直接使用对应的组件基类即可，如CSCustomPopHandler，CSCustomPopControllerLoader，popReformer
 ，CSCustomPopViewLoader,使用基类可达到默认实现协议方法的好处。
 
 2.不使用基类，完全按照协议自定义实现
 */



@interface CSCustomPopManager : NSObject

+ (instancetype)shareManager;

/**

 提供handler,popViewLoader,popControllerLoader三种组件在外部组装
 内部封装处理了一个默认reformer提供view,model的绑定更新（提供popControllerLoader的样式）

 @param handler 单个业务的handler，在里面处理如下业务：是否展示弹窗，不再展示弹窗，弹窗willShow,didShow，弹窗销毁,弹窗引起的购买等等附加业务。。。。
 @param popViewLoader 提供该业务所需要的view
 @param popControllerLoader 提供该业务view所需要的pop样式
 @param completeBlock completeBlock
 @param viewController viewController
 
 handler传nil，内部默认CSCustomPopHandler组件处理
 popViewLoader传nil，内部默认CSCustomPopViewLoader组件处理
 popControllerLoader传nil，内部默认CSCustomPopControllerLoader组件处理
 
 */
- (void)showPopViewWithHandler:(id<CSCustomPopHandlerProtocol,CSCustomPopViewProrocol,CSPopPriorityProtocol>)handler
                    viewLoader:(id<CSCustomPopViewLoaderProtocol>)popViewLoader
                     popControllerLoader:(id<CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol>)popControllerLoader
                 completeBlock:(void (^)(id data))completeBlock
            fromViewController:(UIViewController *)viewController;


/**
 提供handler,popViewLoader,popReformer三种组件在外部组装
 外部传入的reformer提供view,model的绑定更新，提供popControllerLoader的个性化样式

 @param handler 单个业务的handler，在里面处理如下业务：是否展示弹窗，不再展示弹窗，弹窗willShow,didShow，弹窗销毁,弹窗引起的购买等等附加业务。。。。
 @param popViewLoader 提供该业务所需要的view
 @param popReformer  提供view，model的数据绑定，在popController外部组件为空时内部定制view的pop样式,一般业务时比较轻量，当同一业务可能需要多种view展示时，在reformer中可按照具体逻辑处理（如高级账号弹窗，根据model类型，展示点券高级账号购买，点券购买，高级账号购买，点券使用等不同弹窗view）
 @param completeBlock completeBlock
 @param viewController viewController
 
 
 handler传nil，内部默认CSCustomPopHandler组件处理
 popViewLoader传nil，内部默认CSCustomPopViewLoader组件处理
 popReformer传nil，内部默认CSCustomPopReformer组件处理
 */
- (void)showPopViewWithHandler:(id<CSCustomPopHandlerProtocol,CSCustomPopViewProrocol,CSPopPriorityProtocol>)handler
                    viewLoader:(id<CSCustomPopViewLoaderProtocol>)popViewLoader
                    popReformer:(id<CSCustomReformerProtocol>)popReformer
                 completeBlock:(void (^)(id data))completeBlock
            fromViewController:(UIViewController *)viewController;



/**
 最底层方法：提供所有组件的拼装，一般没必要调用：handler,popViewLoader,popControllerLoader，popReformer四种组件在外部组装

 @param popHandler 单个业务的handler，在里面处理如下业务：是否展示弹窗，不再展示弹窗，弹窗willShow,didShow，弹窗销毁,弹窗引起的购买等等附加业务。。。。
 @param popViewLoader 提供该业务所需要的view
 @param popControllerLoader 提供该业务view所需要的pop样式
 @param popReformer 提供view，model的数据绑定，在popController外部组件为空时内部定制view的pop样式,一般业务时比较轻量，当同一业务可能需要多种view展示时，在reformer中可按照具体逻辑处理（如高级账号弹窗，根据model类型，展示点券高级账号购买，点券购买，高级账号购买，点券使用等不同弹窗view）
 @param completeBlock completeBlock
 @param viewController viewController
 */
- (void)showPopViewWithHandler:(id<CSCustomPopHandlerProtocol,CSCustomPopViewProrocol,CSPopPriorityProtocol>)popHandler
                    viewLoader:(id<CSCustomPopViewLoaderProtocol>)popViewLoader
           popControllerLoader:(id<CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol>)popControllerLoader
                    popReformer:(id<CSCustomReformerProtocol>)popReformer
                 completeBlock:(void (^)(id data))completeBlock
            fromViewController:(UIViewController *)viewController;

@end

