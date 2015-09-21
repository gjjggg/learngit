//
//  TacticViewControlller.m
//  Chan
//
//  Created by MS on 15-9-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticViewControlller.h"
#import "TacticColllCell.h"
#import "TravelDownModel.h"
#import "TacticTwoViewController.h"
@interface TacticViewControlller ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSMutableArray * _datasources;
@property(nonatomic,strong)UICollectionView * collectionView;
@end

@implementation TacticViewControlller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createCollectionView];
    _dataSource=[[NSMutableArray alloc]init];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_dataSource removeAllObjects];
    [DownLoadData getTacticPageData:^(id obj, NSError *err) {

        
        if (obj)
        {
            
            [_dataSource addObjectsFromArray:obj];
            [self.collectionView reloadData];
        }
        else
        {
            
            NSLog(@"新闻滚动视图下载失败");
            
        }
        
        
    }];

}
- (void)createCollectionView {
    // 第一步：新建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat padding    = 10;
    CGFloat itemWidth  = (SCREEN_WIDTH-30)/2.0;
    CGFloat itemHeight = 250;
    layout.itemSize    = CGSizeMake(itemWidth, itemHeight); // 设置cell的宽高
    
    // 头尾高度
    layout.headerReferenceSize = CGSizeMake(0, 170);
 
    
    // 最小间隔
    // 对于垂直滚动，它是行间距
    // 对于水平滚动，它是列间距
    layout.minimumLineSpacing = 10;
    
    // 内边距
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    // 集合视图，用于块状分布
    // 第二步，新建集合视图，关联布局对象
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:layout];
    self.collectionView=collectionView;
    collectionView.backgroundColor=[UIColor whiteColor];
    [collectionView registerClass:[TacticColllCell class] forCellWithReuseIdentifier:@"MyCellID"];
    
    
    // 注册supplementary view
    // 第一个参数：注册的类
    // 第二个参数：追加视图的类型 UICollectionElementKindSectionHeader  表示头，UICollectionElementKindSectionFooter表示尾 相当于tableView 中分区的headerView和footerView
    // 第二个参数：复用标识
//    [collectionView registerClass:[MySectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MySectionHeaderViewID"]; // 注册头
//    [collectionView registerClass:[MySectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MySectionFooterViewID"]; // 注册尾
    
    //extern NSString *dog;
    //NSLog(@"%@", dog);
    
    
    // 第四步，设置代理，并实现代理方法
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
}

#pragma mark - 实现代理方法
// 多少个分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 每个分区有多少cell(item)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

// 每个cell是什么
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TacticColllCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCellID" forIndexPath:indexPath];
   
    TacticCollModel * model=_dataSource[indexPath.row];
    [cell updateCellWithNewsModel:model andIndexPath:indexPath];

    return cell;
}

// 头尾视图
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    // 根据是头视图还是尾视图作判断
////    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
////        MySectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MySectionHeaderViewID" forIndexPath:indexPath];
////        headerView.backgroundColor = [UIColor yellowColor];
////        return headerView;
////    } else {
////        MySectionFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MySectionFooterViewID" forIndexPath:indexPath];
////        footerView.backgroundColor = [UIColor purpleColor];
////        return footerView;
////    }
//}

//通过代理方法设置headerView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 200);
}

//点击
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TacticTwoViewController * tacticView=[[TacticTwoViewController alloc]init];
    tacticView.page=[_dataSource[indexPath.row] udid];
    
    [self.navigationController pushViewController:tacticView animated:YES];




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
