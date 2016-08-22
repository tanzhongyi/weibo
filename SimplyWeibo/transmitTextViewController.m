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
#import "SelectViewController.h"
#import "EmojiModel.h"
#import "EmojiCollectionViewCell.h"
#import <UIImageView+YYWebImage.h>
#define APPIRATER   NSLocalizedString(@"人终有一死,而有些人却需要一些帮助.", nil)

@interface transmitTextViewController ()<UITextViewDelegate,WBHttpRequestDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
     NSArray *transmitTextArray;
     int index;
     UITextView *transmittextView;
     UICollectionView *Emojivc;
     NSMutableArray *dataSouer;
     UIView *transmitView;
     CGRect keyFrame;
     UIButton *weizhiAction;
     UIButton *gongkaiAction;
     CGFloat contentOffsetY;
     CGFloat oldContentOffsetY;
     CGFloat newContentOffsetY;
     
}

@end

@implementation transmitTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setUI];
     [self setEmoji];
      dataSouer=[NSMutableArray array];

}

-(void)tcjianpan{
     UITextField *test = [UITextField new] ;
     test.delegate = self;
     
     
}
-(void)setUI{
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(longinAction:)];
     self.navigationItem.rightBarButtonItem.width=12;
     self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(jump:)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
     index =0;
     transmitTextArray =@[@"picture",@"@",@"topic",@"emoji",@"add"];
     
     UIButton *xianshiButton=[UIButton buttonWithType:UIButtonTypeCustom];
     xianshiButton.frame=CGRectMake(0, HEIGHT-40, 40, 40);
     xianshiButton.backgroundColor=[UIColor redColor];
     transmitView=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-60, WIDTH, 60)];
     transmitView.backgroundColor=RGBColor(225, 225, 225);
     for (int i=0; i<5; i++) {
          UIButton *transmitTextbutton=[UIButton buttonWithType:UIButtonTypeSystem];
          transmitTextbutton.tag=index;
          [transmitTextbutton setImage:[UIImage imageNamed:transmitTextArray[index]] forState:0];
          index++;
          [transmitTextbutton addTarget:self action:@selector(transmitTextbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
          transmitTextbutton.frame=CGRectMake(20+((WIDTH-120)/5+20)*i, 0, (WIDTH-120)/5, 60);
          [transmitView addSubview:transmitTextbutton];
          
          
     }
     transmittextView.backgroundColor=[UIColor colorWithRed:227/255.0 green:227/255.0 blue:227/255.0 alpha:1];
     transmittextView=[[UITextView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-120)];
     transmittextView.font=[UIFont systemFontOfSize:20];
     transmittextView.textColor=[UIColor lightGrayColor];//设置提示内容颜色
     transmittextView.text=APPIRATER;
     
    transmittextView.selectedRange=NSMakeRange(0,0) ;//光标起始位置
     transmittextView.delegate=self;
     [self.view addSubview:transmittextView];
     [self.view addSubview:transmitView];
     self.automaticallyAdjustsScrollViewInsets=NO;
     
     weizhiAction=[UIButton buttonWithType:UIButtonTypeCustom];
     weizhiAction.frame=CGRectMake(10, HEIGHT-100, 150, 40);
     [weizhiAction setImage:[UIImage imageNamed:@"location"] forState:0];
     [weizhiAction setTitle:@"显示位置" forState:0];
     weizhiAction.backgroundColor=RGBColor(245, 245, 245);
     [weizhiAction setTitleColor:[UIColor blackColor] forState:0];
     weizhiAction.layer.masksToBounds=YES;
     weizhiAction.layer.cornerRadius=15;
     [self.view addSubview:weizhiAction];
     
     gongkaiAction=[UIButton buttonWithType:UIButtonTypeCustom];
     gongkaiAction.layer.cornerRadius=15;
     gongkaiAction.layer.masksToBounds=YES;
     gongkaiAction.frame=CGRectMake(WIDTH-100, HEIGHT-100, 80, 40);
     [gongkaiAction setImage:[UIImage imageNamed:@"global"] forState:0];
     [gongkaiAction setTitle:@"公开" forState:0];
     [gongkaiAction setTitleColor:[UIColor blackColor] forState:0];
     gongkaiAction.backgroundColor=RGBColor(249, 249, 249);
     [self.view addSubview:gongkaiAction];
     
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyShow:) name:UIKeyboardWillShowNotification object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyHidden:) name:UIKeyboardWillHideNotification object:nil];
     
}
-(void)keyShow:(NSNotification *)noti{
     keyFrame = [[[noti userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
     transmitView.frame = CGRectMake(0, keyFrame.origin.y-60, WIDTH, 60);
     weizhiAction.frame=CGRectMake(10, keyFrame.origin.y-100, 150, 40);
     gongkaiAction.frame=CGRectMake(WIDTH-100, keyFrame.origin.y-100, 80, 40);
     
}
-(void)keyHidden:(NSNotification *)noti{
     transmitView.frame = CGRectMake(0, HEIGHT-60,WIDTH,60);
     weizhiAction.frame=CGRectMake(10, HEIGHT-100, 150, 40);
     gongkaiAction.frame=CGRectMake(WIDTH-100, HEIGHT-100, 80, 40);
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
          SelectViewController *SelectViewVC=[SelectViewController new];
          SelectViewVC.imageHandle=^(NSArray *images){
               NSLog(@"images =%@",images);
          };
          [self.navigationController pushViewController:SelectViewVC animated:YES];
     }else if (sender.tag ==1){
          NSLog(@"诺克萨斯");
     }else if (sender.tag ==2){
          
     }else if (sender.tag ==3){
          [self BBB];
     }else if (sender.tag ==4){
          NSLog(@"提莫队长正在送命");
     }}

-(void)viewDidAppear:(BOOL)animated{
     [super viewDidAppear:animated];
     self.navigationController.navigationBarHidden=NO;
}
-(void)setEmoji{
     UICollectionViewFlowLayout *flowlayout=[UICollectionViewFlowLayout new];
     flowlayout.minimumLineSpacing=10;
     flowlayout.minimumInteritemSpacing=10;
     flowlayout.itemSize=CGSizeMake(43, 43);
     Emojivc=[[UICollectionView alloc]initWithFrame:CGRectMake(0, HEIGHT-266, WIDTH, 266) collectionViewLayout:flowlayout];
     flowlayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
     Emojivc.delegate=self;
     Emojivc.dataSource=self;
     Emojivc.hidden=YES;
     Emojivc.backgroundColor=[UIColor whiteColor];
     [self.view addSubview:Emojivc];
     [Emojivc registerNib:[UINib nibWithNibName:@"EmojiCollectionViewCell" bundle:[NSBundle mainBundle]]forCellWithReuseIdentifier:NSStringFromClass([EmojiCollectionViewCell class])];
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
     return dataSouer.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     EmojiCollectionViewCell *cell=(EmojiCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EmojiCollectionViewCell class]) forIndexPath:indexPath];
     [cell.EmojiImage setImageURL:[NSURL URLWithString:dataSouer[indexPath.row]]];
     return cell;
}
-(void)longinAction:(UITabBarItem *)sender{
     NSLog(@"呵呵");
}
////////////////////////////
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView

{
     
     contentOffsetY = scrollView.contentOffset.y;
     
}

// 滚动时调用此方法(手指离开屏幕后)

- (void)scrollViewDidScroll:(UIScrollView *)scrollView

{
     
     
     
     newContentOffsetY = scrollView.contentOffset.y;
     if (newContentOffsetY > oldContentOffsetY && oldContentOffsetY > contentOffsetY) {  // 向上滚动
          [transmittextView resignFirstResponder];
          Emojivc.hidden=NO;
     }
     
}

// 完成拖拽(滚动停止时调用此方法，手指离开屏幕前)

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate

{
     
     // NSLog(@"scrollViewDidEndDragging");
     
     oldContentOffsetY = scrollView.contentOffset.y;
     
}


///////////////////////////
-(void)BBB{
     [transmittextView resignFirstResponder];
     Emojivc.hidden=NO;
     NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
     NSString *access_token=[user valueForKey:@"accessToken"];
     [WBHttpRequest requestWithAccessToken:access_token url:@"https://api.weibo.com/2/emotions.json" httpMethod:@"GET" params:nil delegate:self withTag:@"101"];
     transmitView.frame = CGRectMake(0, HEIGHT-326, WIDTH, 60);
     weizhiAction.frame=CGRectMake(10, HEIGHT-366, 150, 40);
     gongkaiAction.frame=CGRectMake(WIDTH-100, HEIGHT-366, 80, 40);
}
-(void)request:(WBHttpRequest *)request didReceiveResponse:(NSURLResponse *)response{
     NSLog(@"收到响应 %@",response);
     
}
//-(void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error{
//     NSLog(@"错误 %@",error);
//}
-(void)request:(WBHttpRequest *)request didFinishLoadingWithDataResult:(NSData *)data{
     NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
     for (int i =0; i<arr.count; i++) {
          EmojiModel *emoji=[EmojiModel new];
          NSString *iconimage=arr[i][@"icon"];
          [dataSouer addObject:iconimage];
          emoji.image=iconimage;
          
     }
     dispatch_async(dispatch_get_main_queue(), ^{
          [Emojivc reloadData];
     });
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
