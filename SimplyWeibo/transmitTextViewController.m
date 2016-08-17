//
//  transmitTextViewController.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/16.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "transmitTextViewController.h"
#import <WeiboSDK.h>
#import "AppDelegate.h"
#define APPIRATER   NSLocalizedString(@"人终有一死,而有些人却需要一些帮助.", nil)

@interface transmitTextViewController ()<UITextViewDelegate,WBHttpRequestDelegate>
{
     NSArray *transmitTextArray;
     int index;
     UITextView *transmittextView;
}
@end

@implementation transmitTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setUI];
     self.view.backgroundColor=[UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1];
}
-(void)setUI{
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(longinAction:)];
     self.navigationItem.rightBarButtonItem.width=12;
     self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(jump:)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
     index =0;
     transmitTextArray =@[@"picture",@"@",@"topic",@"emoji",@"add"];
     UIView *transmitTextview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-60, WIDTH, 60)];
     for (int i=0; i<5; i++) {
          UIButton *transmitTextbutton=[UIButton buttonWithType:UIButtonTypeSystem];
          transmitTextbutton.tag=index;
          [transmitTextbutton setImage:[UIImage imageNamed:transmitTextArray[index]] forState:0];
          index++;
          [transmitTextbutton addTarget:self action:@selector(transmitTextbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
          transmitTextbutton.frame=CGRectMake(20+((WIDTH-120)/5+20)*i, 0, (WIDTH-120)/5, 60);
          [transmitTextview addSubview:transmitTextbutton];
          
          
     }
     [self.view addSubview:transmitTextview];
     transmitTextview.backgroundColor=[UIColor colorWithRed:227/255.0 green:227/255.0 blue:227/255.0 alpha:1];
     transmittextView=[[UITextView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-120)];
     transmittextView.backgroundColor=[UIColor whiteColor];
     transmittextView.font=[UIFont systemFontOfSize:20];
     transmittextView.textColor=[UIColor lightGrayColor];//设置提示内容颜色
     transmittextView.text=APPIRATER;
    transmittextView.selectedRange=NSMakeRange(0,0) ;//光标起始位置
     transmittextView.delegate=self;
     [self.view addSubview:transmittextView];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
     if (![text isEqualToString:@""]&&textView.textColor==[UIColor lightGrayColor])
     {
          textView.text=@"";
          textView.textColor=[UIColor blackColor];
     }
     
     if ([text isEqualToString:@"\n"])
     {
          if ([textView.text isEqualToString:@""])
          {
               textView.textColor=[UIColor lightGrayColor];
               textView.text=APPIRATER;
          }
          [textView resignFirstResponder];
          return NO;
     }
     return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
     if ([textView.text isEqualToString:@""])
     {
          textView.text=APPIRATER;
          textView.textColor=[UIColor lightGrayColor];
     }
}
-(void)jump:(UITabBarItem *)sender{
     [self.navigationController popViewControllerAnimated:YES];
}
-(void)transmitTextbuttonAction:(UIButton *)sender{
     if (sender.tag == 0) {
          
     }else if (sender.tag ==1){
          NSLog(@"诺克萨斯");
     }else if (sender.tag ==2){
          NSLog(@"面对疾风吧");
     }else if (sender.tag ==3){
          NSLog(@"我想射点什么");
     }else if (sender.tag ==4){
          NSLog(@"提莫队长正在送命");
     }}

-(void)viewDidAppear:(BOOL)animated{
     [super viewDidAppear:animated];
     self.navigationController.navigationBarHidden=NO;
}
-(void)longinAction:(UITabBarItem *)sender{
//WBAuthorizeRequest *request=[WBAuthorizeRequest request];
//     request.redirectURI=KRedirectURI;
//     request.scope=@"all";
//     request.userInfo=@{@"SSO_From":@"transmitTextViewController",@"Other_Info_1":[NSNumber numberWithInteger:123]};
//     [WeiboSDK sendRequest:request];
//     UITableViewCell *cell;
//     cell.accessoryType=UITableViewCellAccessoryDetailButton;
     NSString *text=transmittextView.text;
     NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
     NSString *access_token=[user valueForKey:@"accessToken"];
     
     
//     text=[text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
     [WBHttpRequest requestWithAccessToken:access_token url:@"https://api.weibo.com/2/statuses/update.json" httpMethod:@"POST" params:@{@"status":text} delegate:self withTag:@"101"];
}

-(void)request:(WBHttpRequest *)request didReceiveResponse:(NSURLResponse *)response{
     NSLog(@"收到响应 %@",response);
}
-(void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error{
     NSLog(@"错误 %@",error);
}
-(void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result{
     NSLog(@"结果 %@",result);
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
