//
//  HomeViewController.m
//  SimplyWeibo
//
//  Created by Ibokan2 on 16/8/9.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBColor(227, 227, 227);
//     UIButton *titleButton=[UIButton buttonWithType:UIButtonTypeCustom];
//     [titleButton setTitle:@"首页" forState:0];
//     [titleButton addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//     UIView *titleView=[[UIView alloc]init];
//     [titleView addSubview:titleButton];
     
//     UITapGestureRecognizer *tapRecognizer=[[]
     self.navigationItem.title=@"首页";
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"user"] style:UIBarButtonItemStylePlain target:self action:@selector(user)];
    
}
-(void)user{
    
}
-(void)titleButtonAction:(UIButton *)sender{
     NSLog(@"面对疾风吧");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
     self.tabBarController.tabBar.hidden = NO;
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
