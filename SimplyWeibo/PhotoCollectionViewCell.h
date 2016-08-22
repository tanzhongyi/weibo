//
//  PhotoCollectionViewCell.h
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/19.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SelectedBthClickBlock)(BOOL isSelect);
@interface PhotoCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *buttonAction;
@property(nonatomic,copy)SelectedBthClickBlock selectBthClickBlock;
- (IBAction)selectButtonAction:(UIButton *)sender;



@end
