//
//  SecurityAccountViewController.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/10.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "SecurityAccountViewController.h"

@interface SecurityAccountViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     NSArray *dataSource;
     NSArray *rightArray;
}
@end

@implementation SecurityAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBColor(227, 227, 227);
     [self setUI];
}
-(void)setUI{
     self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
     
     UITableView *myTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-254)];
     myTableView.delegate=self;
     myTableView.dataSource=self;
     [self.view addSubview:myTableView];
     myTableView.rowHeight=(HEIGHT- 244)/8;
     myTableView.scrollEnabled=NO;
     dataSource=@[@[@"登录名"],@[@"修改密码",@"绑定手机",@"证件信息"],@[@"登陆保护",@"微盾保护"]];
     rightArray=@[@[@"12345678912"],@[@"",@"123456789",@"未绑定"],@[@"未开启",@"未开启",]];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     NSMutableArray *mArr=[NSMutableArray array];
     mArr=dataSource[section];
     return mArr.count;
}
-(void)jump{
     self.tabBarController.tabBar.hidden = NO;
     [self.navigationController popViewControllerAnimated:YES];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"reuse"];
     if (cell == nil) {
          cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
     }
     cell.textLabel.text=dataSource[indexPath.section][indexPath.row];
     cell.detailTextLabel.text=rightArray[indexPath.section][indexPath.row];
     return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
     return 20;
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
