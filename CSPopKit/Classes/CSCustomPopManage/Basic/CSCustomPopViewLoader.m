//
//  CSCustomViewLoader.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSCustomPopViewLoader.h"
#import "CSCustomPopView.h"
//#import "CSCustomPopNoXibView.h"

@implementation CSCustomPopViewLoader

+ (instancetype)loader
{
    return [[self alloc] init];
}

- (CSCustomPopView *)view
{
    return [CSCustomPopView popView];
   // return [CSCustomPopNoXibView popView];
}

//- (CSCustomPopView *)viewWithData:(id)data
//{
//    /*
//      do sth
//    if ([data isKindOfClass:[CSCustomPopModel class]])
//    {
//        return [CSCustomPopView popView];
//    }
//    
//    else if ([data isKindOfClass:[NSArray class]])
//    {
//        return [UIView new];
//    }
//    else
//    {
//        return [CSCustomPopView popView];
//    }
//     */
//    return [CSCustomPopView popView];
//}

@end
