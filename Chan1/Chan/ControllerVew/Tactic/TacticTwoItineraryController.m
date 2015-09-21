//
//  TacticTwoItineraryController.m
//  Chan
//
//  Created by MS on 15-9-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoItineraryController.h"
#import "RDVTabBarController.h"
#import "TacticCollModel.h"

#import "TacticTwoItineraryCell.h"
@interface TacticTwoItineraryController ()

@end

@implementation TacticTwoItineraryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    
    [_dataSource removeAllObjects];
    [self.tableView reloadData];
    
    [DownLoadData getTacticDetailPlanPageData:^(id obj, NSError *err) {
        if (obj)
        {
            [_dataSource addObjectsFromArray:obj];
            [self.tableView reloadData];
        }
        else
        {
            NSLog(@"下载失败");
            
        }
        

        
    } withPage:_page];
  }
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = nil;
    cellID = @"news";
   TacticTwoItineraryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[TacticTwoItineraryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    //隐藏分隔线
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    TacticCollModel * model=_dataSource[indexPath.row];
    [cell  updateCellWithNewsModel:model andIndexPath:indexPath];

  
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
            
            
            NSString *text = [_dataSource[indexPath.row] des];
            
            CGSize constraint = CGSizeMake(SCREEN_WIDTH - 20, 20000.0f);
            
            CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:19] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
            
            CGFloat height =MAX(size.height, 44.0f);
            
            return height + (10 *2)+180;
            
            
            
 
    
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
