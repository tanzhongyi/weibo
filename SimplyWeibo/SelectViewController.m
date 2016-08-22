//
//  SelectViewController.m
//  SimplyWeibo
//
//  Created by Ibokan on 16/8/19.
//  Copyright © 2016年 ibokan. All rights reserved.
//

#import "SelectViewController.h"
#import "PhodoModel.h"
#import "PhotoCollectionViewCell.h"
#import <Photos/Photos.h>
@interface SelectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
     NSMutableArray *dataSource;
     UICollectionView *photoCollectionView;
     NSMutableArray *images;

}

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     dataSource =[NSMutableArray array];
     images=[NSMutableArray array];
     [self setUI];
     [self getAllPhoto];
}
-(void)setUI{
     self.view.backgroundColor=[UIColor whiteColor];
     self.title=@"图片选择";
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(finishAction:)];
     UICollectionViewFlowLayout *flowLayout=[UICollectionViewFlowLayout new];
     flowLayout.minimumLineSpacing=10;
     flowLayout.minimumInteritemSpacing=10;
     flowLayout.itemSize=CGSizeMake(100, 100);
     photoCollectionView=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
     photoCollectionView.dataSource=self;
     photoCollectionView.delegate=self;
     photoCollectionView.backgroundColor=[UIColor whiteColor];
     [self.view addSubview:photoCollectionView];
     [photoCollectionView registerNib:[UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass([PhotoCollectionViewCell class])];
}
-(void)finishAction:(UIBarButtonItem *)sender{
     self.imageHandle(images);
     [self.navigationController popViewControllerAnimated:YES];
}
-(void)getAllPhoto{
     PHFetchOptions *options=[PHFetchOptions new];
     PHFetchResult *allPhotos=[PHAsset fetchAssetsWithOptions:options];
     for (int i = 0; i<allPhotos.count; i++) {
          PHAsset *asset=allPhotos[i];
          PHImageManager *manager=[PHImageManager new];
          [manager requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
               PhodoModel *m=[PhodoModel new];
               m.image=result;
               m.isSelected=NO;
               [dataSource addObject:m];
               dispatch_async(dispatch_get_main_queue(), ^{
                    [photoCollectionView reloadData];
               });
          }];

     }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     PhotoCollectionViewCell *cell=(PhotoCollectionViewCell *)
     [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PhotoCollectionViewCell class]) forIndexPath:indexPath];
     if (indexPath.row == 0) {
          cell.image.image=[UIImage imageNamed:@"photo"];
          cell.imageView.hidden=YES;
          cell.buttonAction.hidden=YES;
          return cell;
     }
     PhodoModel *pm=dataSource[indexPath.row];
     cell.image.image=pm.image;
     cell.imageView.hidden=NO;
     if (pm.isSelected) {
          cell.imageView.image=[UIImage imageNamed:@"selected"];
     }else{
          cell.imageView.image=[UIImage imageNamed:@"unSelected"];
     }
     cell.buttonAction.hidden=NO;
     cell.buttonAction.selected=pm.isSelected;
     cell.selectBthClickBlock=^(BOOL isSelected){
          if (images.count >= 9 && isSelected) {
               NSLog(@"小伙子可以呀啊");
          }else{
               pm.isSelected=isSelected;
               if (pm.isSelected) {
                    [images addObject:pm];
               }else{
                    [images removeObject:pm];
               }
               [collectionView reloadData];
          }
          
          
     };
     return cell;
 }
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
     return dataSource.count;
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
