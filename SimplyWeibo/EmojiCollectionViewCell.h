//
//  EmojiCollectionViewCell.h
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/19.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmojiCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *EmojiImage;

@property (strong, nonatomic) IBOutlet UIButton *Emojibutton;

- (IBAction)EmojiButtonAction:(UIButton *)sender;

@end
