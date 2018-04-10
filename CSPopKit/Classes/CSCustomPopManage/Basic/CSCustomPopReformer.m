//
//  CSCustomPopReformer.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSCustomPopReformer.h"
#import "CSCustomPopControllerLoader.h"
#import "CSCustomPopViewLoader.h"
#import "CSCustomPopView.h"

@implementation CSCustomPopReformer

- (void)dealloc
{
    NSLog(@"popReformer dealloc");
}

+ (instancetype)reformer
{
    return [[self alloc] init];
}

- (CSCustomPopView*)fetchPopViewWithData:(id)data viewLoader:(id<CSCustomPopViewLoaderProtocol>)viewLoader
{
    id<CSCustomPopViewLoaderProtocol>popViewLoader = nil;
    if (viewLoader == nil)
    {
        popViewLoader = [CSCustomPopViewLoader loader];
    }
    else
    {
        popViewLoader = viewLoader;
    }
    
    CSCustomPopView *popView = nil;
    if ([popViewLoader respondsToSelector:@selector(view)] && [popViewLoader respondsToSelector:@selector(viewWithData:)])
    {
        NSLog(@"not need implemention view and viewWithData: method,implemention either");
    }
    if ([popViewLoader respondsToSelector:@selector(viewWithData:)])
    {
        popView = [popViewLoader viewWithData:data];
        [popView setData:data];
        return popView;
    }
    if ([popViewLoader respondsToSelector:@selector(view)])
    {
        popView = [popViewLoader view];
        [popView setData:data];
        return popView;
    }
    NSLog(@"popView is nil,not implementation view or viewWithData: protocol method");
    return popView;
}

- (id<CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol>)fetchPopControllerWithData:(id)data popControllerLoader:(id<CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol>)popControllerLoader view:(CSCustomPopView *)popView
{
    id<CSCustomPopControllerLoaderProtocol,CSPopControllerProviderProtocol> popLoader = nil;
    if (popControllerLoader == nil)
    {
        popLoader = [CSCustomPopControllerLoader loader];
    }
    else
    {
        popLoader = popControllerLoader;
    }
    
    if ([popLoader respondsToSelector:@selector(setContent:)] && [popLoader respondsToSelector:@selector(setContent:data:)])
    {
        NSLog(@"not need implemention setContent: and setContent:data: method,implemention either");
    }
    
    if ([popLoader respondsToSelector:@selector(setContent:data:)])
    {
        [popLoader setContent:popView data:data];
        return popLoader;
    }
    if ([popLoader respondsToSelector:@selector(setContent:)])
    {
        [popLoader setContent:popView];
        return popLoader;
    }
    NSLog(@"popLoader is nil,not implementation setContent:data: or setContent: protocol method");
    return popLoader;
}
@end
