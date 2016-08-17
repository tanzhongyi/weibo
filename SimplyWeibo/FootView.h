//
//  FootView.h
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/14.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
     RefreshStateLoading = 1,//刷新状态为正在加载
     RefreshStateRelease,    //下拉完成释放之前
     RefreshStateNomal,      //原始状态
}RefreshState;

@interface FootView : UIView
@property (nonatomic,strong) UIActivityIndicatorView *activity;//活动指示条
@property (nonatomic,strong) UIImageView *imageView;            //箭头图片
@property (nonatomic,strong) UILabel *infolabel;                //文字指示
@property (nonatomic,assign)RefreshState refreshState;         //刷新的状态

- (void)refreshStateLoading;
- (void)refreshStateNomal;
- (void)refreshStateRelsease;
@end
