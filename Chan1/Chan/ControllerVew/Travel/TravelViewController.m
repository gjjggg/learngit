//
//  TravelViewController.m
//  Chan
//
//  Created by MS on 15-9-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TravelViewController.h"
#import "TravelTwoViewController.h"
#import "TravelScrollTableViewCell.h"
#import "TravelDownTableViewCell.h"
#import "travelSrollerModel.h"

#import "TravelDownModel.h"


@interface TravelViewController ()



@end

@implementation TravelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self analysis];

}











- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [_scrollerSource removeAllObjects];
    [self.tableView reloadData];
    [DownLoadData getTravePageData:^(id obj, NSError *err) {
        
        
        if (obj)
        {
        
         [_scrollerSource addObjectsFromArray:obj];
           
            [self.tableView reloadData];
            
        }
        else
        {
    
             NSLog(@"新闻滚动视图下载失败");

        }
        
        
    }];
    
    [_dataSource removeAllObjects];
    [self.tableView reloadData];
    [DownLoadData getNewsScrollPageData:^(id obj, NSError *err) {
        
        if (obj)
        {

            [_dataSource addObjectsFromArray:obj];
           [self.tableView reloadData];
            
            
           
        }
        else
        {
            
            NSLog(@"新闻滚动视图下载失败");
            
        }

    } withPage:1];
    













}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = nil;
    
    if (indexPath.row == 0) {
        
        cellID = @"scroll";
        TravelScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil) {
            cell = [[TravelScrollTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
       
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
   [cell updateCellWithNewsModel:_scrollerSource];
      
        return cell;
    }
    else
    {
        cellID = @"news";
       TravelDownTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil) {
            cell = [[TravelDownTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
      cell.selectionStyle=UITableViewCellSelectionStyleNone;
      [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
      TravelDownModel * model = _dataSource[indexPath.row-1];
      [cell updateCellWithNewsModel:model andIndexPath:indexPath];
       
        return cell;
      
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TravelTwoViewController * travelTwo=[[TravelTwoViewController alloc]init];
    travelTwo.page=[_dataSource[indexPath.row-1] udid];
    
    
    [self.navigationController pushViewController:travelTwo animated:YES];
    
    
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
