//
//  informViewController.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/10.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "informViewController.h"

@interface informViewController ()<UITableViewDelegate,UITableViewDataSource>{
     NSArray *dataSource;
     NSArray *rightArray;
}

@end

@implementation informViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor=RGBColor(227, 227, 227);
     [self setUI];
}
-(void)setUI{
     self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
     UITableView *myTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
     myTableView.delegate=self;
     myTableView.dataSource=self;
     [self.view addSubview:myTableView];
     dataSource=@[@[@"@我的",@"评论",@"赞",@"消息",@"群通知",@"未关注人消息",@"新粉丝"],@[@"好友圈微博",@"特别关注微博",@"群微博",@"微博热点"],@[@"免打扰设置",@"获取新消息"]];
     rightArray=@[@[@"所有人",@"所有人",@"",@"",@"",@"我关注的人",@"所有人"],@[@"",@"智能通知",@"",@""],@[@"",@"每两分钟"]];
     
}
-(void)jump{
     self.tabBarController.tabBar.hidden=NO;
     [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
     return 20;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     NSMutableArray *arr=[NSMutableArray alloc];
     arr=dataSource[section];
     return arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"reuse"];
     if (!cell) {
          cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
//          cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
          
          
     }
     if (indexPath.section ==0 ) {
          if (indexPath.row==3||indexPath.row==4) {
               cell.accessoryView = [UISwitch new];
          }else{

               cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
          }
     }
     if (indexPath.section == 1) {
          if (indexPath.row == 1) {
                cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
          }else{
               cell.accessoryView=[UISwitch new];
          }
     }
     if (indexPath.section ==2 ) {
          cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
     }
     cell.detailTextLabel.text=rightArray[indexPath.section][indexPath.row];
     cell.textLabel.text=dataSource[indexPath.section][indexPath.row];
     return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
     if (section ==1) {
          return @"新浪微博推送消息";
     }else{
          return nil;
     }
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
