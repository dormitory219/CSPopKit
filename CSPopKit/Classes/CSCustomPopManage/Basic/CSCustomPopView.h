//
//  CSCustomPopView.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSCustomPopHeader.h"
#import "CSCustomPopModel.h"

/*
 view组件
 
 该组件是弹窗的内容视图，在内部只需做好宽高自适应约束匹配即可做到自适应，其他的交给popController处理
 可用xib，手动约束布局,视图容器必须是高度可知（容器内最底部子视图+下约束），否则异常（外部无法计算容器高度）
 高度可知两种：
 1.高度固定
 2.高度自适应
 */

@interface CSCustomPopView : UIView

@property (nonatomic,weak) id<CSCustomPopViewProrocol> delegate;
@property (nonatomic,strong) id data;

+ (instancetype)popView;

@end
