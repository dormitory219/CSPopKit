//
//  CSCustomViewLoader.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2017年 IntSig Information Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSCustomPopHeader.h"

/*
 viewloader组件
 
 该组件根据protocol提供对应弹窗业务所需的view（不是传统直接传view的方式，而是配置接口）
 可根据data的类型配置不同的接口，在reformer中处理时根据data定制不同的view
 
 实现的接口如下：
 CSCustomPopViewLoader：弹窗view的获取
 */
@interface CSCustomPopViewLoader : NSObject<CSCustomPopViewLoaderProtocol>

@end
