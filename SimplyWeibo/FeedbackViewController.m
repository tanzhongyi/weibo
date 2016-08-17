//
//  FeedbackViewController.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/10.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     NSArray *dataSource;
     NSArray *rightArray;
}

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
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
     
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 return  dataSource.count;
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
    
     return cell;
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

