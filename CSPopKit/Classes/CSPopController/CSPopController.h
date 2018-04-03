//
//  CSPopController.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/4.
//  Copyright © 2018年 IntSig Information Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CSPopTheme.h"
#import "CSPopControllerProviderProtocol.h"

extern NSString *const CSPopControllerDissmissNotification;

@interface CSPopController : NSObject<CSPopControllerProviderProtocol>

@property (nonatomic,strong) CSPopTheme *theme;

- (instancetype)initWithContent:(UIView *)content;

- (void)presentPopControllerAnimated:(BOOL)animated;

- (void)dismissPopControllerAnimated:(BOOL)animated;

@end
