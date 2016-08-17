//
//  accountViewController.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/10.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "accountViewController.h"
#import <UIImageView+YYWebImage.h>
#import "User.h"
#import "AppDelegate.h"
#import <WeiboSDK.h>
@interface accountViewController ()<UITableViewDelegate,UITableViewDataSource,WBHttpRequestDelegate>
{
     NSArray *dataSoure;
     User *user;
     UIAlertController *alertController1;
}
@end

@implementation accountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor=RGBColor(227, 227, 227);
     [self setUI];
     user=[User shareUser];
     NSLog(@"%@",user);
     
}
-(void)setUI{
     self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
     UITableView *myTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
     myTableView.delegate=self;
     myTableView.dataSource=self;
     [self.view addSubview:myTableView];
    
     
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     if (section == 0) {
          return 2;
     }else{
          return 1;
     }
}
-(void)jump{
     self.tabBarController.tabBar.hidden=NO;
     [self.navigationController popViewControllerAnimated:YES];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"reuse"];
     if (cell == nil) {
          cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
     }
     if (indexPath.section == 1) {
          cell.textLabel.text=@"退出当前账户";
          cell.textLabel.textAlignment=NSTextAlignmentCenter;
          cell.textLabel.textColor=[UIColor redColor];
          return cell;
     }else{
          if (indexPath.row ==0) {
               [cell.imageView setImageWithURL:[NSURL URLWithString:user.avatar_large] placeholder:[UIImage imageNamed:@"head"]];
               cell.imageView.layer.cornerRadius=22;
               cell.imageView.layer.masksToBounds=YES;
               cell.textLabel.text=user.name;
               
               
          }else{
               cell.imageView.image=[UIImage imageNamed:@"add"];
               cell.textLabel.text=@"添加账户";
          }
          return cell;
     }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     if (indexPath.section==1) {
          [self denchu];
     }
}
-(void)denchu{
     alertController1=[UIAlertController alertControllerWithTitle:@"天王盖地虎" message:@"宝塔镇河妖" preferredStyle:UIAlertControllerStyleAlert];
     //添加方法添加按钮
     UIAlertAction *sleepAction=[UIAlertAction actionWithTitle:@"确定退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
          [self denchuAction];
     }];
     UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
     [alertController1 addAction:sleepAction];
     [alertController1 addAction:cancelAction];
     [self presentViewController:alertController1 animated:YES completion:nil];
}
-(void)denchuAction{
     NSString *access_token = [[NSUserDefaults standardUserDefaults]objectForKey:@"accessToken"];
     [WBHttpRequest requestWithAccessToken:access_token url:@"https://api.weibo.com/oauth2/revokeoauth2" httpMethod:@"GET" params:nil delegate:self withTag:@"100"];
}
-(void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result{
     if ([result containsString:@"true"]) {
          [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"accessToken"];
          [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"userID"];
          AppDelegate *d = (AppDelegate *)[UIApplication sharedApplication].delegate;
          d.tabBarController.viewControllers = @[d.homeVc,d.issueVc,d.myVc];
          d.tabBarController.viewControllers[2].tabBarItem.image = [UIImage imageNamed:@"user"];
          d.tabBarController.tabBar.tintColor = RGBColor(252, 119, 33);
     }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
     return 15;
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
