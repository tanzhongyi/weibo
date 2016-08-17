//
//  AddFriendViewController.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/12.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "AddFriendViewController.h"
#import "FootView.h"
#import <MJRefresh.h>
#define TABLE_CELL_HIGHT 50.0
@interface AddFriendViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>{
     
          FootView *footView;
     UITableView *mytable;
     NSArray *dataArray;
     
}

@end

@implementation AddFriendViewController




- (void)viewDidLoad {
    [super viewDidLoad];
     [self setUI];
     [self addsx];
     dataArray = [NSMutableArray arrayWithArray:@[@"扫一扫",@"通讯录好友"]];
     self.view.backgroundColor=RGBColor(227, 227, 227);
     }
-(void)addsx{
     
     MJRefreshGifHeader *header=[MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(up)];
     header.lastUpdatedTimeLabel.hidden=YES;
     [header setImages:@[[UIImage imageNamed:@"1"]] forState:MJRefreshStateRefreshing];
     [header setTitle:@"加载中" forState:MJRefreshStateRefreshing];
     [header setTitle:@"刷新完毕" forState:MJRefreshStateIdle];
     [header setImages:@[[UIImage imageNamed:@"2"]] forState:MJRefreshStateIdle];
     
     [header setTitle:@"下拉刷新" forState:MJRefreshStatePulling];
     mytable.mj_header=header;
     //     [mytableview.mj_header beginRefreshing];
     [header setImages:@[[UIImage imageNamed:@"1"]] forState:MJRefreshStatePulling];
     
     
}
-(void)setUI{
     self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
     UISearchBar *search=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 64,WIDTH, 50)];
     [self.view addSubview:search];
     mytable=[[UITableView alloc]initWithFrame:CGRectMake(0, 114, WIDTH, HEIGHT-50)];
     mytable.delegate=self;
     mytable.dataSource=self;
     mytable.backgroundColor=[UIColor clearColor];
     [self.view addSubview:mytable];
}
-(void)up{
     [NSThread sleepForTimeInterval:3];
     [mytable.mj_header endRefreshing];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     return 80;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"reuse"];
     if (!cell) {
          cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuse"];
     }
     if (indexPath.section == 0) {
          if (indexPath.row == 0) {
               cell.detailTextLabel.text=@"扫描二维码名片";
               cell.textLabel.text=@"扫一扫";
               cell.imageView.image=[UIImage imageNamed:@"sweep"];
               
          }else{
               cell.textLabel.text=@"通讯录好友";
               cell.detailTextLabel.text=@"添加或邀请通讯录中的好友";
               cell.imageView.image=[UIImage imageNamed:@"addressbook"];
          }
          
     }
     cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
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
