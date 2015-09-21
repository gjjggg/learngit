//
//  TacticTwoTravelPlayController.m
//  Chan
//
//  Created by MS on 15-9-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoTravelPlayController.h"
#import "TacticTwoTravePlayTableViewCell.h"
#import "TravelDownModel.h"
#import "RDVTabBarController.h"
@interface TacticTwoTravelPlayController ()

@end

@implementation TacticTwoTravelPlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    
    [_dataSource removeAllObjects];
    [self.tableView reloadData];
   
    
    
    [DownLoadData getTacticDetailPlayPageData:^(id obj, NSError *err) {
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
    TacticTwoTravePlayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[TacticTwoTravePlayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    TacticCollModel * model=_dataSource[indexPath.row];
    [cell updateCellWithNewsModel:model andIndexPath:indexPath];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 130;
    
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
