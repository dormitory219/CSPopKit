//
//  CSCustomPopReformer.h
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2017年 IntSig Information Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSCustomPopHeader.h"

/*
 popReformer组件
 
 该组件提供view，model的数据绑定，在popController外部组件为空时内部定制view的pop样式,一般业务时比较轻量，当同一业务可能需要多种view展示时，在reformer中可按照具体逻辑处理（如高级账号业务，根据model类型，可能展示点券高级账号购买，点券购买，高级账号购买，点券使用等不同弹窗view）
 
 可做的事情有：
 1.根据数据model匹配弹窗view的展示,
 fetchPopViewWithModel:(CSCustomPopModel *)model viewLoader:(id<CSCustomPopViewLoader>)viewLoader
 
 2.为view根据model定制不同的popController样式
 fetchPopControllerWithModel:(CSCustomPopModel *)model viewLoader:(id<CSCustomPopViewLoader>)viewLoader;
 
 实现的接口如下：
 CSCustomReformerProtocol：如上
 */

@interface CSCustomPopReformer : NSObject<CSCustomReformerProtocol>

@end
