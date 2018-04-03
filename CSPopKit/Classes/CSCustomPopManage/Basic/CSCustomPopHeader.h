//
//  CSCustomPopHeader.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2017年 IntSig Information Co., Ltd. All rights reserved.
//

#ifndef CSCustomPopHeader_h
#define CSCustomPopHeader_h

#import <UIKit/UIKit.h>

@class CSCustomPopModel;
@class CSCustomPopController;
@class CSCustomPopView;
@protocol CSCustomPopHandlerDelegate;
@protocol CSPopControllerProviderProtocol;
@protocol CSCustomReformerProtocol;
@protocol CSPopPriorityProtocol;

/**
 popController protocol:
 */
@protocol CSCustomPopControllerLoaderProtocol <CSPopControllerProviderProtocol>

@optional
+ (instancetype)loader;

- (void)setContent:(UIView *)view;

- (void)setContent:(UIView *)view data:(id)data;

@end



/**
 popViewLoader protocol:
 */
@protocol CSCustomPopViewLoaderProtocol <NSObject>

@optional
+ (instancetype)loader;

- (CSCustomPopView *)view;

- (CSCustomPopView *)viewWithData:(id)data;

@end


/**
 handler protocol:
 */
@protocol CSCustomPopHandlerProtocol <NSObject>

@optional
+ (instancetype)handler;

+ (instancetype)handlerWithData:(id)data;

- (BOOL)shouldShow;

- (void)markShow:(BOOL)show;

- (void)willPresentPopView;

- (void)didPresentPopView;

- (void)cancelPresentPopView;

@required
@property (nonatomic,strong) id data;

@property (nonatomic, strong) void (^completeBlock)(id);

@property (nonatomic, weak) UIViewController *fromViewController;

@property (nonatomic, strong) id<CSPopControllerProviderProtocol,CSCustomPopControllerLoaderProtocol> popController;

@property (nonatomic,strong) id<CSCustomReformerProtocol>reformer;

@property (nonatomic,weak) id<CSCustomPopHandlerDelegate>delegate;

@property (nonatomic, strong) CSCustomPopView *popView;

@end


/**
 handler delegate
 */
@protocol CSCustomPopHandlerDelegate <NSObject>

@required
- (void)removeHandler:(id)handler;

@end



/**
reformerProtocol
 */
@protocol CSCustomReformerProtocol <NSObject>

@optional
+ (instancetype)reformer;

- (CSCustomPopView*)fetchPopViewWithData:(id)data viewLoader:(id<CSCustomPopViewLoaderProtocol>)viewLoader;

- (id<CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol>)fetchPopControllerWithData:(id)data popControllerLoader:(id<CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol>)popControllerLoader view:(CSCustomPopView *)popView;
@end



/**
 popview 关闭代理protocol
 */
@protocol CSCustomPopViewProrocol <NSObject>

@optional
- (void)dismissPopView:(CSCustomPopView *)popView;

@end


#endif /* CSCustomPopHeader_h */
