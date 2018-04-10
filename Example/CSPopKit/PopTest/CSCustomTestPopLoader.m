//
//  CSCustomTestPopController.m
//  CSPopKit_Example
//
//  Created by joy_yu on 2018/4/10.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSCustomTestPopLoader.h"

@implementation CSCustomTestPopLoader

- (void)setContent:(UIView *)content
{
    CSPopController *popController = [[CSPopController alloc] initWithContent:content];
    CSPopTheme *theme = [[CSPopTheme alloc] init];
    theme.maskTypeTheme(CSPopThemeMaskTypeDimmed).cornerRadiusTheme(16.0f).maxPopupWidthTheme(280.0f).animationPresentionDurationTheme(0.6f).animationDismissDurationTheme(0.6f).shouldDismissOnBackgroundTouchTheme(NO).popThemePresentationStyleTheme(CSPPopThemePresentationStyleSlideInFromTopAndAngleBounce).popThemeDismissStyleTheme(CSPPopThemeDismissStyleSlideInToBottomAndAngle).horizontalOffsetTheme(0.f).verticalOffsetTheme(0.f);
    
    popController.theme = theme;
    self.popController = popController;
}


@end
