//
//  IssueViewController.m
//  SimplyWeibo
//
//  Created by Ibokan2 on 16/8/9.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "IssueViewController.h"
#import "transmitTextViewController.h"
#import "AppDelegate.h"
#import <WeiboSDK.h>
#import "weatherModel.h"
@interface IssueViewController ()<WBHttpRequestDelegate>
{
     int index;
     NSArray *imageArray;
     NSArray *lableArray;
     UILabel *tqlable;
}
@end

@implementation IssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self setUI];
     self.view.backgroundColor=[UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1];
     [self weather];
}
-(void)setUI{
 imageArray=@[@"word",@"image",@"topline",@"checkin",@"video",@"issue_more"];
     lableArray=@[@"文字",@"图片/视频",@"头条文字",@"签到",@"直播",@"更多"];
     index =0;
     for (int i = 0; i < 2; i++) {
          for (int j = 0; j < 3; j++) {
               UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
               [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
               button.tag=index;
               button.frame=CGRectMake(40+(WIDTH-160)/3*j+j*40, (HEIGHT-400)+i*120, (WIDTH-160)/3, 100);
               
               [button setImage:[UIImage imageNamed:imageArray[index]] forState:0];
               [self.view addSubview:button];
               UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(40+(WIDTH-160)/3*j+j*40, (HEIGHT-310)+i*120, (WIDTH-160)/3, 20)];
               [label1 setText:lableArray[index]];
               label1.textAlignment=NSTextAlignmentCenter;
               [self.view addSubview:label1];
               
               
               index++;
          }
     }
     UIView *View2=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-60, WIDTH, 60)];
     UIButton *backButton=[UIButton buttonWithType:UIButtonTypeSystem];
     backButton.frame=CGRectMake((WIDTH-80)/2, 0, 80, 60);
     [backButton setImage:[UIImage imageNamed:@"back"] forState:0];
     [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
     [View2 addSubview:backButton];
     View2.backgroundColor=[UIColor whiteColor];
     [self.view addSubview:View2];
     ///////////
     tqlable=[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 160, 100)];
     
     [self.view addSubview:tqlable];
     
     
}
-(void)backAction:(UIButton *)sender{
     AppDelegate *d = (AppDelegate *)[UIApplication sharedApplication].delegate;
     d.tabBarController.selectedIndex=0;
     
}
-(void)buttonAction:(UIButton *)sender{
     if (sender.tag == 0) {
          transmitTextViewController *transmitTvc=[transmitTextViewController new];
          [self.navigationController pushViewController:transmitTvc animated:YES];
     }else if (sender.tag ==1){
          NSLog(@"诺克萨斯");
     }else if (sender.tag ==2){
          NSLog(@"面对疾风吧");
     }else if (sender.tag ==3){
          NSLog(@"我想射点什么");
     }else if (sender.tag ==4){
          NSLog(@"提莫队长正在送命");
     }else if (sender.tag ==5){
          NSLog(@"我的大刀已经饥渴难耐了");
     }
}
-(void)weather{
     
     NSURL *url = [NSURL URLWithString:@"https://api.thinkpage.cn/v3/weather/now.json?key=tdzomgapyhnqj4j0&location=guangzhou&language=zh-Hans&unit=c"];
     NSURLRequest *request=[NSURLRequest requestWithURL:url];
     NSURLSessionConfiguration *con=[NSURLSessionConfiguration defaultSessionConfiguration];
     NSURLSession *session=[NSURLSession sessionWithConfiguration:con];
     NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSError *error1;
          NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error1];

         
               
          

          dispatch_async(dispatch_get_main_queue(), ^{
               NSArray *array = dic[@"results"];
               NSDictionary *diction = array[0];
               tqlable.text = [NSString stringWithFormat:@"%@:%@ %@°C",diction[@"location"][@"name"],diction[@"now"][@"text"],diction[@"now"][@"temperature"]];
          
          });
          }];
     [dataTask resume];
     
     
}
-(void)addlable{
     
     
}
-(void)viewDidAppear:(BOOL)animated{
     [super viewDidAppear:animated];
     self.tabBarController.tabBar.hidden = YES;
     self.navigationController.navigationBarHidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{

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
