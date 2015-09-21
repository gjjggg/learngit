//
//  TravelTwoViewController.m
//  Chan
//
//  Created by MS on 15-9-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TravelTwoViewController.h"
#import "RDVTabBarController.h"
#import "TraveDownTwoCell.h"
#import "TraveDownPTCell.h"
#import "TraveDownPCell.h"
#import "TravelDownModel.h"
const CGFloat BackGroupHeight = 320;
const CGFloat HeadImageHeight= 80;
@interface TravelTwoViewController ()<UIScrollViewDelegate>



@end

@implementation TravelTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
    
    
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
       [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
  
    [_dataSource removeAllObjects];
    [self.tableView reloadData];

    [DownLoadData getTraveDetailsPageData:^(id obj, NSError *err) {
        
        
        
        if (obj)
        {
            
            [_dataSource addObjectsFromArray:obj];
            [self.tableView reloadData];
            
            
          
            NSArray * arr=[_dataSource[0] nodes];
           
            NSLog(@"%@", [arr[0] objectForKey:@"notes"]) ;
            
        }
        else
        {
            
            NSLog(@"新闻滚动视图下载失败");
            
        }
        

        
        
        
    } withPage:_page];
    
    
   
    
   
    
    
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = nil;
//    cellID = @"news";
//    TraveDownPCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    
//    if (cell == nil) {
//        cell = [[TraveDownPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
    
 //   return cell;

    
        cellID = @"scroll";
    if (indexPath.row==0) {
        

        TraveDownTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil) {
            cell = [[TraveDownTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        return cell;
       }
    
        

    if(indexPath.row==1)
    {
        cellID = @"news";
        TraveDownPCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil) {
            cell = [[TraveDownPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
              return cell;
        
    }
    else
    {
    
        cellID = @"news";
        TraveDownPTCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil) {
            cell = [[TraveDownPTCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        return cell;
        

    
    
    
    
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        
    
    NSString *text = @"dfghjkl;';lkjbhgvcfvhbjnkm.";
    
    CGSize constraint = CGSizeMake(SCREEN_WIDTH - 20, 20000.0f);
    
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    CGFloat height =MAX(size.height, 44.0f);
    
    return height + (10 *2);
    }
    if (indexPath.row==1)
    {
        return 200;
    
    
    }
    else
    {
        
                
                
                NSString *text = @"dfghjkl;';lkjbhgvcfvhbjnkm.";
                
                CGSize constraint = CGSizeMake(SCREEN_WIDTH - 20, 20000.0f);
                
                CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
                
                CGFloat height =MAX(size.height, 44.0f);
                
                return height + (10 *2)+200;
            
    
    
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
























//-(void) viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    
// 
//    
//    
//    
//}

-(void)viewWillDisappear:(BOOL)animated
{
    //控制器将要消失展示tabBar
    
    
    [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
    
    
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
