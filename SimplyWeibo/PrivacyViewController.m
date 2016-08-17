//
//  PrivacyViewController.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/10.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "PrivacyViewController.h"

@interface PrivacyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     NSArray *dataSource;
}
@end

@implementation PrivacyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setUI];
     
}
-(void)setUI{
     self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
     UITableView *mytable=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
     mytable.dataSource=self;
     mytable.delegate=self;
     [self.view addSubview:mytable];
     dataSource=@[@[@"隐私设置"],@[@"已屏蔽消息的人",@"已屏蔽微博的人"],@[@"黑名单"]];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     NSMutableArray *m=[NSMutableArray array];
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
     cell.textLabel.text=dataSource[indexPath.section][indexPath.row];
     cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
     return cell;
}
-(void)jump{
     self.tabBarController.tabBar.hidden = NO;
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
