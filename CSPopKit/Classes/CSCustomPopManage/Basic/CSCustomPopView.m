//
//  CSCustomPopView.m
//  CSPopKit
//
//  Created by joy_yu on 2018/1/12.
//  Copyright © 2018年 joy_yu. All rights reserved.
//

#import "CSCustomPopView.h"

@interface CSCustomPopView()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CSCustomPopView

- (void)dealloc
{
    NSLog(@"popView dealloc");
}

+ (instancetype)popView
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *bundleName = bundle.infoDictionary[@"CFBundleName"];
    bundleName = [NSString stringWithFormat:@"%@.bundle",bundleName];
    NSString *nibName = [NSString stringWithFormat:@"%@/%@",bundleName,NSStringFromClass([self class])];
    return [bundle loadNibNamed:nibName owner:self options:nil].lastObject;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.masksToBounds = YES;
    NSArray *texts = @[
                       @"这是一个默认弹窗",
                       @"这是一个默认弹窗\n这是一个默认弹窗\n这是一个默认弹窗",
                       @"这是一个默认弹窗\n这是一个默认弹窗\n这是一个默认弹窗\n这是一个默认弹窗\n这是一个默认弹窗",
                       @"这是一个默认弹窗\n这是一个默认弹窗\n这是一个默认弹窗\n这是一个默认弹窗\n这是一个默认弹窗\n这是一个默认弹窗\n这是一个默认弹窗\n这是一个默认弹窗",
                       ];
    self.titleLabel.text = texts[arc4random_uniform(4)];
}

- (IBAction)dismissAction:(id)sender
{
    NSLog(@"dismiss popView type:%@,data:%@",NSStringFromClass([self class]),self.data);
    if (self.delegate && [self.delegate respondsToSelector:@selector(dismissPopView:)])
    {
        [self.delegate dismissPopView:self];
    }
}

- (void)setData:(id)data
{
    _data = data;
}


@end
