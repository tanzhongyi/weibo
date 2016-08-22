//
//  SelectViewController.h
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/19.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ImagesHandle) (NSArray *images);
@interface SelectViewController : UIViewController
@property(nonatomic,strong)ImagesHandle imageHandle;
@end
