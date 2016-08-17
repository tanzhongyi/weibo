//
//  SetupViewController.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/10.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     NSArray *dataSource;
     NSArray *rightArray;
}
@end

@implementation SetupViewController
-(void)viewDidLoad{
     [super viewDidLoad];
     [self setUI];
}
-(void)setUI{
     self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc ]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
     UITableView *mytableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
     mytableView.delegate=self;
     mytableView.dataSource=self;
     [self.view addSubview:mytableView];
     dataSource=@[@[@"阅读模式",@"字号设置",@"显示备注信息"],@[@"开启快速拖动"],@[@"横竖屏自动切换"],@[@"图片浏览设置",@"视图自动播放设置"],@[@"wifi自动下载微博安装包"],@[@"声音与震动",@"多语言环境"]];
     rightArray=@[@[@"有图模式",@"中",@""],@[@""],@[@""],@[@"自适应",@"关闭"],@[@""],@[@"",@"简体中文"]];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return  dataSource.count;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
     if (section == 1) {
          return  @"浏览列表时可使用拖动条快速拖动";
     }else{
          return nil;
     }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     NSMutableArray *m=[NSMutableArray alloc];
     m=dataSource[section];
     return m.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
     return 20;
     
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"reuse"];
     if (!cell) {
          cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
     }
     if (indexPath.section == 0) {
          if (indexPath.row ==2) {
               cell.accessoryView=[UISwitch new];
          }else{
               cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
          }
     }else if (indexPath.section == 1){
          if (indexPath.row ==0) {
               cell.accessoryView=[UISwitch new];
          }
     }else if (indexPath.section == 2){
          cell.accessoryView=[UISwitch new];
     }else if (indexPath.section == 3){
          cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
     }else if (indexPath.section == 4){
          cell.accessoryView=[UISwitch new];
     }else if (indexPath.section == 5){
          cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
     }
     cell.textLabel.text=dataSource[indexPath.section][indexPath.row];
     cell.detailTextLabel.text=rightArray[indexPath.section][indexPath.row];
     return cell;
}
-(void)jump{
     self.tabBarController.tabBar.hidden=NO;
     [self.navigationController popViewControllerAnimated:YES];
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
