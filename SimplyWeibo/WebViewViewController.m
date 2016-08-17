//
//  WebViewViewController.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/11.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     UIWebView *weibView=[[UIWebView alloc]initWithFrame:self.view.frame];
     [weibView loadRequest:[NSURLRequest requestWithURL:_url]];
     [self.view addSubview:weibView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
