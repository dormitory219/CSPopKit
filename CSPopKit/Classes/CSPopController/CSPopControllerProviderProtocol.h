//
//  CSPopControllerProviderProtocol.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/4.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#ifndef CSPopControllerProviderProtocol_h
#define CSPopControllerProviderProtocol_h

#import <UIKit/UIKit.h>

@protocol CSPopControllerProviderProtocol <NSObject>

- (instancetype)initWithContent:(UIView *)content;

- (void)presentPopControllerAnimated:(BOOL)animated;

- (void)dismissPopControllerAnimated:(BOOL)animated;

@end

#endif /* CSPopControllerProviderProtocol_h */
