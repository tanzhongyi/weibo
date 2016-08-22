//
//  transmitTextViewController.h
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/16.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger ,WBStatusComposViewType) {
     WBStatusComposViewTypeStatus,//发送微博
     WBStatusComposViewTypeRetweet,//转发微博
     WBStatusComposViewTypeComment,//发送评论

     
};
@interface transmitTextViewController : UIViewController
@property(nonatomic,assign)WBStatusComposViewType type;
@end
