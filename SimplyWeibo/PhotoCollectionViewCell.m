//
//  PhotoCollectionViewCell.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/19.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (IBAction)selectButtonAction:(UIButton *)sender {
     sender.selected=!sender.selected;
     self.selectBthClickBlock(sender.selected);
}
@end
