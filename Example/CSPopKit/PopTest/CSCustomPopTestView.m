//
//  CSCustomPopTestView.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSCustomPopTestView.h"

@implementation CSCustomPopTestView

- (void)dealloc
{
    NSLog(@"popView dealloc");
}

+ (instancetype)popView
{
    return [[self alloc] initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [ UIColor greenColor];
        
        UIButton *dismissButton = [[UIButton alloc]init];
        dismissButton.backgroundColor = [UIColor cyanColor];
        [dismissButton setTitle:@"dismiss" forState:UIControlStateNormal];
        [dismissButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [dismissButton addTarget:self action:@selector(dismissAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:dismissButton];

        dismissButton.translatesAutoresizingMaskIntoConstraints = NO;
        [dismissButton.topAnchor constraintEqualToAnchor:self.topAnchor constant:25].active = YES;
        [dismissButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:0].active = YES;

        UIView *containView = [[UIView alloc]init];
        containView.backgroundColor = [UIColor orangeColor];
        [self addSubview:containView];
        
         containView.translatesAutoresizingMaskIntoConstraints = NO;
        [containView.topAnchor constraintEqualToAnchor:dismissButton.bottomAnchor constant:25].active = YES;
        [containView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:25].active = YES;
        [containView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-25].active = YES;
        [containView.heightAnchor constraintEqualToConstant:120].active = YES;       
        
        //关键下约束
        [containView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-25].active = YES;
    }
    return self;
}

- (void)dismissAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(dismissPopView:)])
    {
        [self.delegate dismissPopView:self];
    }
}

@end
