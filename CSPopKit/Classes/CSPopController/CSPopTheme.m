//
//  CSPopTheme.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/4.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSPopTheme.h"

@implementation CSPopTheme

+ (instancetype)defaultTheme
{
    CSPopTheme *defaultTheme = [[CSPopTheme alloc] init];
    defaultTheme.maskTypeTheme(CSPopThemeMaskTypeDimmed).cornerRadiusTheme(16.0f).maxPopupWidthTheme(300.0f).animationPresentionDurationTheme(0.3f).animationDismissDurationTheme(0.3f).shouldDismissOnBackgroundTouchTheme(NO).popThemePresentationStyleTheme(CSPPopThemePresentationStyleFadeIn).popThemeDismissStyleTheme(CSPPopThemeDismissStyleFadeOut).horizontalOffsetTheme(0.f).verticalOffsetTheme(0.f);
    return defaultTheme;
}

+ (instancetype)defaultGuideTheme
{
    CSPopTheme *defaultTheme = [[CSPopTheme alloc] init];
    defaultTheme.maskTypeTheme(CSPopThemeMaskTypeDimmed).cornerRadiusTheme(16.0f).maxPopupWidthTheme(300.0f).animationPresentionDurationTheme(0.8f).animationDismissDurationTheme(0.45f).shouldDismissOnBackgroundTouchTheme(NO).popThemePresentationStyleTheme(CSPPopThemePresentationStyleSlideInFromTop).popThemeDismissStyleTheme(CSPPopThemeDismissStyleSlideInToBottom).horizontalOffsetTheme(0.f).verticalOffsetTheme(0.f);
    return defaultTheme;
}

//- (CSPopTheme *(^)(UIColor *))backgroundColorTheme
//{
//    return ^CSPopTheme *(UIColor * color)
//    {
//        self.backgroundColor = color;
//        return self;
//    };
//}

- (CSPopTheme *(^)(CGFloat))cornerRadiusTheme
{
    return ^CSPopTheme *(CGFloat cornerRadius)
    {
        self.cornerRadius = cornerRadius;
        return self;
    };
}

- (CSPopTheme *(^)(CSPPopThemeStyle))popThemePresentationStyleTheme
{
    return ^CSPopTheme *(CSPPopThemeStyle popThemePresentationStyle)
    {
        self.presentationStyle = popThemePresentationStyle;
        return self;
    };
}

- (CSPopTheme *(^)(CSPPopThemeStyle))popThemeDismissStyleTheme
{
    return ^CSPopTheme *(CSPPopThemeStyle popThemeDismissStyleTheme)
    {
        self.dismissStyle = popThemeDismissStyleTheme;
        return self;
    };
}
- (CSPopTheme *(^)(CSPopThemeLocationType))popThemeLocationTheme
{
    return ^CSPopTheme *(CSPopThemeLocationType popThemeLocationTheme)
    {
        self.locationType = popThemeLocationTheme;
        return self;
    };
}

- (CSPopTheme *(^)(CGPoint))dismissPointTheme
{
    return ^CSPopTheme *(CGPoint dismissPoint)
    {
        self.dismissPoint = dismissPoint;
        return self;
    };
}

- (CSPopTheme *(^)(CSPopThemeMaskType))maskTypeTheme
{
    return ^CSPopTheme *(CSPopThemeMaskType maskType)
    {
        self.maskType = maskType;
        return self;
    };
}

- (CSPopTheme *(^)(BOOL))shouldDismissOnBackgroundTouchTheme
{
    return ^CSPopTheme *(BOOL shouldDismissOnBackgroundTouch)
    {
        self.shouldDismissOnBackgroundTouch = shouldDismissOnBackgroundTouch;
        return self;
    };
}

- (CSPopTheme *(^)(CGFloat))maxPopupWidthTheme
{
    return ^CSPopTheme *(CGFloat maxPopupWidth)
    {
        self.maxPopupWidth = maxPopupWidth;
        return self;
    };
}

- (CSPopTheme *(^)(BOOL))flexPopupWidthTheme
{
    return ^CSPopTheme *(BOOL flexPopupWidth)
    {
        self.flexPopupWidth = flexPopupWidth;
        return self;
    };
}

- (CSPopTheme *(^)(CGFloat))animationPresentionDurationTheme
{
    return ^CSPopTheme *(CGFloat animationPresentionDuration)
    {
        self.animationPresentionDuration = animationPresentionDuration;
        return self;
    };
}

- (CSPopTheme *(^)(CGFloat))animationDismissDurationTheme
{
    return ^CSPopTheme *(CGFloat animationDismissDuration)
    {
        self.animationDismissDuration = animationDismissDuration;
        return self;
    };
}

- (CSPopTheme *(^)(CGFloat))verticalOffsetTheme
{
    return ^CSPopTheme *(CGFloat verticalOffset)
    {
        self.verticalOffset = verticalOffset;
        return self;
    };
}

- (CSPopTheme *(^)(CGFloat))horizontalOffsetTheme
{
    return ^CSPopTheme *(CGFloat horizontalOffset)
    {
        self.horizontalOffset = horizontalOffset;
        return self;
    };
}

@end

