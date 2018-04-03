//
//  CSPopTheme.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/4.
//  Copyright © 2018年 IntSig Information Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 弹窗的遮罩模式

 - CSPopThemeMaskTypeClear: 透明
 - CSPopThemeMaskTypeDimmed: 带灰色
 */
typedef NS_ENUM(NSInteger, CSPopThemeMaskType)
{
    CSPopThemeMaskTypeClear,
    CSPopThemeMaskTypeDimmed
};



/**
  弹出，消失动画类型

 - CSPPopThemePresentationStyleFadeIn: <#CSPPopThemePresentationStyleFadeIn description#>
 - CSPPopThemePresentationStyleSlideInFromTop: <#CSPPopThemePresentationStyleSlideInFromTop description#>
 - CSPPopThemePresentationStyleSlideInFromTopAndAngleBounce: <#CSPPopThemePresentationStyleSlideInFromTopAndAngleBounce description#>
 - CSPPopThemePresentationStyleSlideInFromBottom: <#CSPPopThemePresentationStyleSlideInFromBottom description#>
 - CSPPopThemePresentationStyleSlideInFromLeft: <#CSPPopThemePresentationStyleSlideInFromLeft description#>
 - CSPPopThemePresentationStyleSlideInFromRight: <#CSPPopThemePresentationStyleSlideInFromRight description#>
 - CSPPopThemeDismissStyleFadeOut: <#CSPPopThemeDismissStyleFadeOut description#>
 - CSPPopThemeDismissStyleSlideInToTop: <#CSPPopThemeDismissStyleSlideInToTop description#>
 - CSPPopThemeDismissStyleSlideInToBottom: <#CSPPopThemeDismissStyleSlideInToBottom description#>
 - CSPPopThemeDismissStyleSlideInToBottomAndAngle: <#CSPPopThemeDismissStyleSlideInToBottomAndAngle description#>
 - CSPPopThemeDismissStyleSlideInToLeft: <#CSPPopThemeDismissStyleSlideInToLeft description#>
 - CSPPopThemeDismissStyleSlideInToRight: <#CSPPopThemeDismissStyleSlideInToRight description#>
 */
typedef NS_ENUM(NSInteger, CSPPopThemeStyle)
{
    CSPPopThemePresentationStyleFadeIn,
    CSPPopThemePresentationStyleSlideInFromTop,
    CSPPopThemePresentationStyleSlideInFromTopAndAngleBounce,
    CSPPopThemePresentationStyleSlideInFromBottom,
    CSPPopThemePresentationStyleSlideInFromLeft,
    CSPPopThemePresentationStyleSlideInFromRight,
    
    CSPPopThemeDismissStyleFadeOut,
    CSPPopThemeDismissStyleSlideInToTop,
    CSPPopThemeDismissStyleSlideInToBottom,
    CSPPopThemeDismissStyleSlideInToBottomAndAngle,
    CSPPopThemeDismissStyleSlideInToPointAndScale,
    CSPPopThemeDismissStyleSlideInToLeft,
    CSPPopThemeDismissStyleSlideInToRight
};

@interface CSPopTheme : NSObject

//@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CSPPopThemeStyle presentationStyle;
@property (nonatomic, assign) CSPPopThemeStyle dismissStyle;
@property (nonatomic, assign) CSPopThemeMaskType maskType;
@property (nonatomic, assign) BOOL shouldDismissOnBackgroundTouch;
@property (nonatomic, assign) CGFloat maxPopupWidth;
@property (nonatomic, assign) CGFloat animationPresentionDuration;
@property (nonatomic, assign) CGFloat animationDismissDuration;
@property (nonatomic, assign) CGFloat verticalOffset;
@property (nonatomic, assign) CGFloat horizontalOffset;
@property (nonatomic, assign) CGPoint dismissPoint;

//链式赋值属性
//@property (nonatomic, copy) CSPopTheme *(^backgroundColorTheme)(UIColor *);
@property (nonatomic, copy) CSPopTheme *(^cornerRadiusTheme)(CGFloat);
@property (nonatomic, copy) CSPopTheme *(^popThemePresentationStyleTheme)(CSPPopThemeStyle);
@property (nonatomic, copy) CSPopTheme *(^popThemeDismissStyleTheme)(CSPPopThemeStyle);
@property (nonatomic, copy) CSPopTheme *(^maskTypeTheme)(CSPopThemeMaskType);
@property (nonatomic, copy) CSPopTheme *(^shouldDismissOnBackgroundTouchTheme)(BOOL);
@property (nonatomic, copy) CSPopTheme *(^maxPopupWidthTheme)(CGFloat);
@property (nonatomic, copy) CSPopTheme *(^animationPresentionDurationTheme)(CGFloat);
@property (nonatomic, copy) CSPopTheme *(^animationDismissDurationTheme)(CGFloat);
@property (nonatomic, assign) CSPopTheme *(^verticalOffsetTheme)(CGFloat);
@property (nonatomic, assign) CSPopTheme *(^horizontalOffsetTheme)(CGFloat);
@property (nonatomic, assign) CSPopTheme *(^dismissPointTheme)(CGPoint);
+ (instancetype)defaultTheme;

+ (instancetype)defaultGuideTheme;

@end
