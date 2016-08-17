//
//  MyTableViewCell.h
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/10.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *introduceLable;
@property (strong, nonatomic) IBOutlet UIImageView *vipButton;
@property (strong, nonatomic) IBOutlet UIButton *weiboButton;
@property (strong, nonatomic) IBOutlet UIButton *attentionButton;
@property (strong, nonatomic) IBOutlet UIButton *fansButton;

@end
