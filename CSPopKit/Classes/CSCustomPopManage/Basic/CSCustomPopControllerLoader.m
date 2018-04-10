//
//  CSCustomPopLoader.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSCustomPopControllerLoader.h"
#import "CSPopController.h"

@implementation CSCustomPopControllerLoader

+ (instancetype)loader
{
    return [[self alloc] init];
}

- (instancetype)initWithContent:(UIView *)content
{
    self = [super init];
    if (self)
    {
       
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

- (void)setContent:(UIView *)content
{
    CSPopController *popController = [[CSPopController alloc] initWithContent:content];
    self.popController = popController;
    
    CSPopTheme *theme = [CSPopTheme defaultTheme];
    popController.theme = theme;
}

//- (void)setContent:(UIView *)content data:(id)data
//{
//    // do sth
//    /*
//    CSPopController *popController = [[CSPopController alloc] initWithContent:content];
//    self.popController = popController;
//    
//    CSPopTheme *theme = [[CSPopTheme alloc] init];
//    theme.maskTypeTheme(CSPopThemeMaskTypeDimmed).cornerRadiusTheme(6.0f).maxPopupWidthTheme(280.0f).animationDurationTheme(0.3f).shouldDismissOnBackgroundTouchTheme(NO).popThemePresentationStyleTheme(CSPPopThemePresentationStyleFadeIn).popThemeDismissStyleTheme(CSPPopThemeDismissStyleFadeOut);
//    popController.theme = theme;
//     */
//}



@end
