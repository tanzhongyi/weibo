//
//  AppDelegate.h
//  SimplyWeibo
//
//  Created by Ibokan2 on 16/8/8.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property(strong,nonatomic)UINavigationController *myVc;
@property(strong,nonatomic)UINavigationController *issueVc;
@property(strong,nonatomic)UINavigationController *homeVc;
@property(strong,nonatomic)UINavigationController *loginVc;
@property(strong,nonatomic)UITabBarController *tabBarController;

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)NSString *access_token;
@property(nonatomic,strong)NSString *user_id;

@end

