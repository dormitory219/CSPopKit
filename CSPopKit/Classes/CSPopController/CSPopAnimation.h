//
//  CSPopAnimationManager.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/4.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSPopTheme.h"
#import "CSPopController.h"

@interface CSPopAnimation : NSObject

@property (nonatomic,strong) UIView *content;

@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, strong) CSPopTheme *theme;

@property (nonatomic, weak) CSPopController *popController;

- (void)animationWithPop:(BOOL)isPop;

@end
