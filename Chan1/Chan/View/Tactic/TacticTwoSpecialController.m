//
//  TacticTwoSpecialController.m
//  Chan
//
//  Created by MS on 15-9-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoSpecialController.h"
#import "RDVTabBarController.h"
#import "TacticTwoSpecialCell.h"
#import "TacticCollModel.h"
#import "TacticTwoSpecialTwoController.h"
@interface TacticTwoSpecialController ()

@end

@implementation TacticTwoSpecialController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    
    [_dataSource removeAllObjects];
    [self.tableView reloadData];
    [DownLoadData getTacticDetailsSpecialPageData:^(id obj, NSError *err) {
    
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
    TacticTwoSpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[TacticTwoSpecialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    TacticCollModel * model=_dataSource[indexPath.row];
    [cell updateCellWithNewsModel:model andIndexPath:indexPath];
  
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 240;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TacticTwoSpecialTwoController * travelTwo=[[TacticTwoSpecialTwoController alloc]init];
    travelTwo.page=[_dataSource [indexPath.row] udid];
    
    
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
