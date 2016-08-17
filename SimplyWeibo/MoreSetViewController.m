//
//  MoreSetViewController.m
//  SimplyWeibo
//
//  Created by Ibokan2 on 16/8/10.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "MoreSetViewController.h"
#import "accountViewController.h"
#import "SecurityAccountViewController.h"
#import "informViewController.h"
#import "PrivacyViewController.h"
#import "SetupViewController.h"
#import "FeedbackViewController.h"
#import "aboutweiboViewController.h"
#import "ClearViewController.h"
#import "exitViewController.h"
#import <WeiboSDK.h>
#import "MyViewController.h"
#import "AppDelegate.h"

@interface MoreSetViewController ()<UITableViewDelegate,UITableViewDataSource,WBHttpRequestDelegate>
{
     UIAlertController *alertController1;
    NSArray *dataSource;
}
@end

@implementation MoreSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBColor(227, 227, 227);
    self.title = @"设置";
    [self setUI];
}
-(void)setUI{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor grayColor];
    
     UITableView *myTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
//    myTableView.rowHeight = (HEIGHT-244)/9;
//    myTableView.scrollEnabled = NO;
    dataSource = @[@[@"账号管理",@"账号安全"],@[@"通知",@"隐私",@"通用设置"],@[@"意见反馈",@"关于微博"],@[@"清楚缓存"],@[@"退出微博"]];
}
-(void)pop{
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return dataSource.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     switch (indexPath.section) {
          case 0:{
               if (indexPath.row == 0) {
                    accountViewController *accountVC=[accountViewController new];
                    accountVC.title=@"账号管理";
                    [self.navigationController pushViewController:accountVC animated:YES];
               }else{
                    SecurityAccountViewController *securityAccountvc=[SecurityAccountViewController new];
                    securityAccountvc.title=@"账号安全";
                    [self.navigationController pushViewController:securityAccountvc  animated:YES];
               }
          }
               break;
          case 1:{
               if (indexPath.row ==0) {
                    informViewController *informvc=[informViewController new];
                    informvc.title=@"通知";
                    [self.navigationController pushViewController:informvc animated:YES];
               }else if (indexPath.row ==1){
                    PrivacyViewController *Privacyvc=[PrivacyViewController new];
                    Privacyvc.title=@"隐藏";
                    [self.navigationController pushViewController:Privacyvc animated:YES];
               }else{
                    SetupViewController *Setupvc=[SetupViewController new];
                    Setupvc.title=@"通用设置";
                    [self.navigationController pushViewController:Setupvc animated:YES];
               }
          }
               break;
          case 2:{
               if (indexPath.row == 0) {
                    FeedbackViewController *Feedbackvc=[FeedbackViewController new];
                    Feedbackvc.title=@"意见反馈";
                    [self.navigationController pushViewController:Feedbackvc animated:YES];
               }else{
                    aboutweiboViewController *aboutweibovc=[aboutweiboViewController new];
                    aboutweibovc.title=@"关于微博";
                    [self.navigationController pushViewController:aboutweibovc animated:YES];
               }
               
          }
               break;
          case 3:{
               if (indexPath.row ==0) {
                    alertController1=[UIAlertController alertControllerWithTitle:@"天王盖地虎" message:@"宝塔镇河妖" preferredStyle:UIAlertControllerStyleActionSheet];
                    //添加方法添加按钮
                    UIAlertAction *sleepAction=[UIAlertAction actionWithTitle:@"清除缓存" style:UIAlertActionStyleDestructive handler:nil];
                    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                    [alertController1 addAction:sleepAction];
                    [alertController1 addAction:cancelAction];
                    [self presentViewController:alertController1 animated:YES completion:nil];

                    
               }
          }
               break;
          case 4:{
               if (indexPath.row == 0 ) {
                   
                    
                    
                    alertController1=[UIAlertController alertControllerWithTitle:@"天王盖地虎" message:@"宝塔镇河妖" preferredStyle:UIAlertControllerStyleActionSheet];
                    //添加方法添加按钮
                    UIAlertAction *sleepAction=[UIAlertAction actionWithTitle:@"确定退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                         [self denchu];
                    }];
                    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                    [alertController1 addAction:sleepAction];
                    [alertController1 addAction:cancelAction];
                    [self presentViewController:alertController1 animated:YES completion:nil];
               }
          }
               break;
          default:
               break;
     }
}
-(void)denchu{
     exit(0);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *mArr = [NSMutableArray array];
    mArr = dataSource[section];
    return mArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
     if (indexPath.section ==dataSource.count-1) {
          cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
          cell.textLabel.textAlignment=NSTextAlignmentCenter;
          cell.textLabel.textColor=[UIColor redColor];
     }
    cell.textLabel.text = dataSource[indexPath.section][indexPath.row];
    
    
    return cell;
}
-(void)didchangetextwithNotfication:(UIAlertController *)sender{
     NSLog(@"1");
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
