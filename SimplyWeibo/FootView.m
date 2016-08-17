//
//  FootView.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/14.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "FootView.h"

@implementation FootView

@synthesize activity;
@synthesize imageView;
@synthesize infolabel;
@synthesize refreshState;

- (id)initWithFrame:(CGRect)frame
{
     self = [super initWithFrame:frame];
     if (self) {
          self.backgroundColor = [UIColor orangeColor];
          
          //活动指示器初始化
          activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
          activity.frame = CGRectMake(10, 0, 50, 70);
          [self addSubview:activity];
          
          //箭头图片初始化
          imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 50)];
          imageView.image = [UIImage imageNamed:@"blackArrow.png"];
          [self addSubview:imageView];
          
          //信息label初始化
          infolabel = [[UILabel alloc]initWithFrame:CGRectMake(100,0 ,100, 70)];
          infolabel.text = @"下拉刷新...";
          infolabel.font = [UIFont fontWithName:@"Helvetica" size:20];
          infolabel.textAlignment = NSTextAlignmentCenter;
          infolabel.textColor = [UIColor blackColor];
          [self addSubview:infolabel];
          
          //设置初始状态
          self.refreshState = RefreshStateNomal;
     }
     return self;
}

//初始状态
- (void)refreshStateNomal
{
     self.refreshState = RefreshStateNomal;
     [self.activity stopAnimating];
     self.infolabel.text = @"下拉加载更多...";
     self.imageView.layer.transform = CATransform3DMakeRotation(M_PI * 2, 0, 0, 1);
     self.imageView.hidden = NO;
}

//正在请求数据时
- (void)refreshStateLoading
{
     self.refreshState = RefreshStateLoading;
     self.imageView.hidden = YES;
     [UIView beginAnimations:nil context:nil];
     self.infolabel.text = @"正在加载...";
     [self.activity startAnimating];
     [UIView commitAnimations];
}

//下拉完成后
- (void)refreshStateRelsease
{
     self.refreshState = RefreshStateRelease;
     [UIView beginAnimations:nil context:nil];
     self.infolabel.text = @"释放后加载...";
     self.imageView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
     [UIView commitAnimations];
     
}



@end


