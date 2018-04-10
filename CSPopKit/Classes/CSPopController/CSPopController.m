//
//  CSPopController.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/4.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSPopController.h"
#import "CSPopAnimation.h"
#import "Masonry.h"

NSString *const CSPopControllerDissmissNotification = @"CSPopControllerDissmissNotification";

static inline UIViewAnimationOptions UIViewAnimationCurveToAnimationOptions(UIViewAnimationCurve curve)
{
    return curve << 16;
}

@interface CSPopController()

/**
 外界自定义视图：需要满足autolayOut约束，可做到自适应高度
 */
@property (nonatomic,strong) UIView *content;

/**
 window
 */
@property (nonatomic, strong) UIWindow *applicationWindow;

/**
 蒙版
 */
@property (nonatomic, strong) UIView *maskView;

/**
 动画处理类：present,dismiss
 */
@property (nonatomic, strong) CSPopAnimation *animationHandler;

@end

@implementation CSPopController

- (instancetype)initWithContent:(UIView *)content
{
    self = [super init];
    if (self)
    {
        self.content = content;
        content.layer.masksToBounds = YES;
        
        UIView *maskView = [[UIView alloc] initWithFrame:self.applicationWindow.bounds];
        UITapGestureRecognizer *backgroundTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapAction:)];
        self.maskView = maskView;
        maskView.hidden = YES;
        [self.applicationWindow addSubview:maskView];
        [maskView addGestureRecognizer:backgroundTapRecognizer];
        [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            (void)make.left.right.top.bottom;
        }];
        
        [self.applicationWindow addSubview:content];
        
        CSPopTheme *theme = [CSPopTheme defaultTheme];
        self.content.hidden = YES;
        self.theme = theme;
        [self applyTheme];
        
        CSPopAnimation *animationHandler = [[CSPopAnimation alloc] init];
        animationHandler.content = content;
        animationHandler.maskView = maskView;
        animationHandler.popController = self;
        self.animationHandler = animationHandler;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"popController dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)setTheme:(CSPopTheme *)theme
{
    if (_theme != theme)
    {
        _theme = theme;
        [self applyTheme];
    }
    _theme = theme;
}

- (void)applyTheme
{
    if (self.theme.maskType == CSPopThemeMaskTypeClear)
    {
        self.maskView.backgroundColor = [UIColor clearColor];
    }
    else if (self.theme.maskType == CSPopThemeMaskTypeDimmed)
    {
        self.maskView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
    }
    self.animationHandler.theme = self.theme;
//    self.content.backgroundColor = self.theme.backgroundColor;
    [self.content mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(self.theme.verticalOffset);
        make.centerX.mas_offset(-self.theme.horizontalOffset);
        make.width.mas_equalTo(self.theme.maxPopupWidth);
    }];
    self.content.layer.cornerRadius = self.theme.cornerRadius;
}

- (void)presentPopControllerAnimated:(BOOL)flag
{
    self.content.hidden = NO;
    self.maskView.hidden = NO;
    if (flag)
    {
        [self.animationHandler animationWithPop:YES];
    }
}

- (void)backgroundTapAction:(UITapGestureRecognizer *)gesture
{
    if (self.theme.shouldDismissOnBackgroundTouch)
    {
        [self dismissPopControllerAnimated:YES];
    }
}

- (void)dismissPopControllerAnimated:(BOOL)flag
{
    if (flag)
    {
        [self.animationHandler animationWithPop:NO];
    }
    else
    {
        [self.maskView removeFromSuperview];
        [self.content removeFromSuperview];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (UIWindow *)applicationWindow
{
    return [UIApplication sharedApplication].keyWindow;
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    CGRect frame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval duration = [(notification.userInfo)[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve = [(notification.userInfo)[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    CGRect popupViewIntersection = CGRectIntersection(self.content.frame, frame);
    CGFloat intersectionHeight = popupViewIntersection.size.height + 5;
    if (intersectionHeight > 0)
    {
        [self.content mas_updateConstraints:^(MASConstraintMaker *make) {
             (void)make.centerY.offset(-intersectionHeight);
        }];
        
        [UIView animateWithDuration:duration delay:0.0f options:UIViewAnimationCurveToAnimationOptions(curve) animations:^{
            [self.content layoutIfNeeded];
        } completion:nil];
    }
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    NSTimeInterval duration = [(notification.userInfo)[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve = [(notification.userInfo)[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    [self.content mas_updateConstraints:^(MASConstraintMaker *make) {
        (void)make.center;
    }];
    [UIView animateWithDuration:duration delay:0.0f options:UIViewAnimationCurveToAnimationOptions(curve) animations:^{
        [self.content layoutIfNeeded];
    } completion:nil];
}

@end
