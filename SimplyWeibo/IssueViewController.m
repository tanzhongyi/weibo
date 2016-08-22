//
//  IssueViewController.m
//  SimplyWeibo
//
//  Created by Ibokan2 on 16/8/9.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "IssueViewController.h"
#import "transmitTextViewController.h"
#import "transmitImageViewController.h"
#import "AppDelegate.h"
#import <WeiboSDK.h>
#import "weatherModel.h"
#import "SelectViewController.h"
@interface IssueViewController ()<WBHttpRequestDelegate>
{
     int index;
     NSArray *imageArray;
     NSArray *lableArray;
     UILabel *tqlable;
     UILabel *dataLable;
     UIImageView *imageView;
}
@end

@implementation IssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self setUI];
     [self adddate];
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
               button.frame=CGRectMake(WIDTH/10+(WIDTH/10*3)*j, HEIGHT/2+i*WIDTH/4, WIDTH/5, WIDTH/5);
               
               [button setImage:[UIImage imageNamed:imageArray[index]] forState:0];
               [button setTitle:lableArray[index] forState:0];
               [self.view addSubview:button];
               button.titleLabel.textAlignment=NSTextAlignmentCenter;
               [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
               [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
               button.titleEdgeInsets=UIEdgeInsetsMake(WIDTH/4,-WIDTH/47*11, 0, 0);
               button.titleLabel.font=[UIFont systemFontOfSize:14];
               
               index++;
          }
     }
     UIView *View2=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-44, WIDTH, 44)];
     UIButton *backButton=[UIButton buttonWithType:UIButtonTypeSystem];
     backButton.frame=CGRectMake((WIDTH-80)/2, 0, 80, 44);
     [backButton setImage:[UIImage imageNamed:@"back"] forState:0];
     [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
     [View2 addSubview:backButton];
     View2.backgroundColor=[UIColor whiteColor];
     [self.view addSubview:View2];
     ///////////
     tqlable=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 100, 80)];
     
     [self.view addSubview:tqlable];
     dataLable=[[UILabel alloc]initWithFrame:CGRectMake(20, 130, 150, 50)];
     [self.view addSubview:dataLable];
     
     imageView=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/7*4, HEIGHT/12, WIDTH/5*2, HEIGHT/4)];
     imageView.image=[UIImage imageNamed:@"issue_AD"];
     [self.view addSubview:imageView];
     
     
     
}
-(void)backAction:(UIButton *)sender{
     AppDelegate *d = (AppDelegate *)[UIApplication sharedApplication].delegate;
     d.tabBarController.selectedIndex=0;
     
}
-(void)buttonAction:(UIButton *)sender{
     sender.transform=CGAffineTransformIdentity;
         [UIView animateKeyframesWithDuration:0.5 delay:0 options:0 animations: ^{
              [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 animations:^{
               sender.transform=CGAffineTransformMakeScale(0.8, 0.8);
          }];
          [UIView addKeyframeWithRelativeStartTime:1/3 relativeDuration:1 animations:^{
               sender.transform=CGAffineTransformMakeScale(1.6, 1.6);
          }];
          [UIView addKeyframeWithRelativeStartTime:2/3 relativeDuration:1 animations:^{
               sender.transform=CGAffineTransformMakeScale(0.8, 0.8);
          }];
          [UIView addKeyframeWithRelativeStartTime:1 relativeDuration:1 animations:^{
               sender.transform=CGAffineTransformMakeScale(1.0, 1.0);
          }];
     } completion:nil];

     if (sender.tag == 0) {
          transmitTextViewController *transmitTvc=[transmitTextViewController new];
          [self.navigationController pushViewController:transmitTvc animated:YES];
     }else if (sender.tag ==1){
          SelectViewController *SelectViewVc=[SelectViewController new];
          SelectViewVc.imageHandle=^(NSArray *images){
               NSLog(@"images =%@",images);
          };
          [self.navigationController pushViewController:SelectViewVc animated:YES];
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
-(void)adddate{
     UILabel *rilable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 80)];
     rilable.font=[UIFont systemFontOfSize:30];
     [tqlable addSubview:rilable];
     UILabel *xqlable=[[UILabel alloc]initWithFrame:CGRectMake(50, 0, 80, 30)];
     [tqlable addSubview:xqlable];
     UILabel *nianlable=[[UILabel alloc]initWithFrame:CGRectMake(50, 40, 80, 30)];
     [tqlable addSubview:nianlable];
     NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
     [formatter setDateFormat:@"MM/yyyy"];
     NSDate *date1=[NSDate date];
     NSString *date1string = [formatter stringFromDate:date1];//关键函数
     nianlable.text=date1string;
     NSDateFormatter *dayDate=[[NSDateFormatter alloc]init];
     [dayDate setDateFormat:@"dd"];
     NSDate *date2=[NSDate date];
     NSString *date2string = [dayDate stringFromDate:date2];//关键函数
     rilable.text=date2string;
     
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateStyle:NSDateFormatterFullStyle];
     [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
   xqlable.text=[[[dateFormatter stringFromDate:[NSDate date]] componentsSeparatedByString:@" "] lastObject];
    
}
-(void)weather{
     NSURL *url = [NSURL URLWithString:@"https://api.thinkpage.cn/v3/weather/now.json?key=tdzomgapyhnqj4j0&location=nanchang&language=zh-Hans&unit=c"];
     NSURLRequest *request=[NSURLRequest requestWithURL:url];
     NSURLSessionConfiguration *con=[NSURLSessionConfiguration defaultSessionConfiguration];
     NSURLSession *session=[NSURLSession sessionWithConfiguration:con];
     NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSError *error1;
          NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error1];
          dispatch_async(dispatch_get_main_queue(), ^{
               NSArray *array = dic[@"results"];
               NSDictionary *diction = array[0];
               dataLable.text = [NSString stringWithFormat:@"%@:%@ %@°C",diction[@"location"][@"name"],diction[@"now"][@"text"],diction[@"now"][@"temperature"]];
               
          
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
