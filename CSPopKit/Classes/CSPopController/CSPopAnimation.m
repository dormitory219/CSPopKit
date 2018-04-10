//
//  CSPopAnimationManager.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/4.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSPopAnimation.h"

@implementation CSPopAnimation

- (void)animationWithPop:(BOOL)isPop
{
    CGPoint translatePoint = CGPointZero;
    CSPPopThemeStyle style;
    if (isPop)
    {
        style = self.theme.presentationStyle;
    }
    else
    {
        style = self.theme.dismissStyle;
    }
    switch (style)
    {
        case CSPPopThemePresentationStyleFadeIn:
        {
            self.maskView.alpha = 0.0;
            self.content.alpha = 0.0;
            [UIView animateWithDuration:self.theme.animationPresentionDuration animations:^{
                self.maskView.alpha = 1.0;
                self.content.alpha = 1.0;
            }];
            return;
            break;
        }
        case CSPPopThemePresentationStyleSlideInFromTop:
        case CSPPopThemePresentationStyleSlideInFromTopAndAngleBounce:
            translatePoint = CGPointMake(0,  -[UIScreen mainScreen].bounds.size.height/2);
            break;
        case CSPPopThemePresentationStyleSlideInFromBottom:
            translatePoint = CGPointMake(0,  [UIScreen mainScreen].bounds.size.height/2);
            break;
        case CSPPopThemePresentationStyleSlideInFromLeft:
            translatePoint = CGPointMake(-[UIScreen mainScreen].bounds.size.width/2,0);
            break;
        case CSPPopThemePresentationStyleSlideInFromRight:
            translatePoint = CGPointMake([UIScreen mainScreen].bounds.size.width/2,0);
            break;
            
        case CSPPopThemeDismissStyleFadeOut:
        {
            [UIView animateWithDuration:self.theme.animationDismissDuration animations:^{
                self.maskView.alpha = 0.0;
                self.content.alpha = 0.0;
            } completion:^(BOOL finished) {
                [self.maskView removeFromSuperview];
                [self.content removeFromSuperview];
            }];
            return;
            break;
        }
        case CSPPopThemeDismissStyleSlideInToTop:
            translatePoint = CGPointMake(0,  -[UIScreen mainScreen].bounds.size.height/2);
            break;
        case CSPPopThemeDismissStyleSlideInToBottom:
        case CSPPopThemeDismissStyleSlideInToBottomAndAngle:
            translatePoint = CGPointMake(0,  [UIScreen mainScreen].bounds.size.height/2);
            break;
        case CSPPopThemeDismissStyleSlideInToPointAndScale:
            translatePoint = CGPointMake(self.theme.dismissPoint.x-self.content.center.x, self.theme.dismissPoint.y-self.content.center.y);
            break;
        case CSPPopThemeDismissStyleSlideInToLeft:
            translatePoint = CGPointMake(-[UIScreen mainScreen].bounds.size.width/2,0);
            break;
        case CSPPopThemeDismissStyleSlideInToRight:
            translatePoint = CGPointMake([UIScreen mainScreen].bounds.size.width/2,0);
            break;
        default:
            break;
    }
    
    if (isPop)
    {
        self.maskView.alpha = 0.0;
        self.content.alpha = 0.0;
        CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4/5.0);
        if (style == CSPPopThemePresentationStyleSlideInFromTopAndAngleBounce)
        {
            transform = CGAffineTransformTranslate(transform, translatePoint.x, translatePoint.y);
        }
        else
        {
            transform =  CGAffineTransformMakeTranslation(translatePoint.x,translatePoint.y);
        }
        self.content.transform = transform;;
        
        [UIView animateWithDuration:self.theme.animationPresentionDuration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.content.transform = CGAffineTransformIdentity;
            self.maskView.alpha = 1.0;
            self.content.alpha = 1.0;
        } completion:^(BOOL finished) {
           
        }];
    }
    else
    {
        [UIView animateWithDuration:self.theme.animationDismissDuration animations:^{
            
            CGAffineTransform transform = CGAffineTransformIdentity;
            if (style == CSPPopThemeDismissStyleSlideInToPointAndScale)
            {
                transform =  CGAffineTransformMakeTranslation(translatePoint.x, translatePoint.y);
                transform = CGAffineTransformScale(transform, 0.01, 0.01);
            }
            else if (style == CSPPopThemeDismissStyleSlideInToBottomAndAngle)
            {
                transform = CGAffineTransformMakeRotation(-M_PI_4/5.0);
                transform = CGAffineTransformTranslate(transform, translatePoint.x, translatePoint.y);
            }
            else
            {
                transform = CGAffineTransformMakeTranslation(translatePoint.x,translatePoint.y);
            }
            
            self.content.transform = transform;
            
            self.maskView.alpha = 0.0;
            self.content.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            [self.maskView removeFromSuperview];
            [self.content removeFromSuperview];
             [[NSNotificationCenter defaultCenter] postNotificationName:CSPopControllerDissmissNotification object:self];
        }];
    }
}


@end
