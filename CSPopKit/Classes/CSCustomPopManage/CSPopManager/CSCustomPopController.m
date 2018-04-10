//
//  CSCustomPopController.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/5.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSCustomPopController.h"

@implementation CSCustomPopController

- (instancetype)initWithContent:(UIView *)content
{
    self = [super init];
    if (self)
    {
        CSPopController *popController = [[CSPopController alloc] initWithContent:content];
        popController.theme = [CSPopTheme defaultTheme];
        self.popController = popController;
    }
    return self;
}


- (void)presentPopControllerAnimated:(BOOL)animated
{
    if (self.popController && [self.popController respondsToSelector:@selector(presentPopControllerAnimated:)])
    {
        [self.popController presentPopControllerAnimated:YES];
    }
}

- (void)dismissPopControllerAnimated:(BOOL)animated
{
    if (self.popController && [self.popController respondsToSelector:@selector(dismissPopControllerAnimated:)])
    {
        [self.popController dismissPopControllerAnimated:YES];
    }
}

@end
