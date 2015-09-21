//
//  TacticTwoViewController.m
//  Chan
//
//  Created by MS on 15-9-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoViewController.h"
#import "TacticTwoCell.h"
#import "TacticCollModel.h"
#import "RDVTabBarController.h"
#import "TacticTwoSpecialController.h"
#import "TacticTwoTravelPlayController.h"
#import "TacticTwoItineraryController.h"

#import "TacticTTacticController.h"
@interface TacticTwoViewController ()

@end

@implementation TacticTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    
    [_dataSource removeAllObjects];
    [self.tableView reloadData];
    
   [DownLoadData getTacticDetailsPageData:^(id obj, NSError *err) {
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
        TacticTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
        if (cell == nil) {
            cell = [[TacticTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.downButton1.tag=indexPath.row*10+1;
    [cell.downButton1 addTarget:self  action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.downButton2.tag=indexPath.row*10+2;
     [cell.downButton2 addTarget:self  action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.downButton3.tag=indexPath.row*10+3;
     [cell.downButton3 addTarget:self  action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.downButton4.tag=indexPath.row*10+4;
     [cell.downButton4 addTarget:self  action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    TacticCollModel * model=_dataSource[indexPath.row];

    [cell updateCellWithNewsModel:model andIndexPath:indexPath];
    
    
          return cell;
    
  }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 360;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)pressBtn:(id)sender
{ 
    TacticTwoTravelPlayController * trave=[[TacticTwoTravelPlayController alloc]init];
    TacticTwoItineraryController * ititnerary=[[TacticTwoItineraryController alloc]init];
    TacticTwoSpecialController * tactiac=[[TacticTwoSpecialController alloc]init];
    TacticTTacticController * tac=[[TacticTTacticController alloc]init];
    UIButton * btn=(UIButton *)sender;
    tac.page=[_dataSource[btn.tag/10] udid];
    tactiac.page=[_dataSource[btn.tag/10] udid];
    trave.page=[_dataSource[btn.tag/10] udid];
    ititnerary.page=[_dataSource[btn.tag/10] udid];
    if (btn.tag%10==1) {
        [self.navigationController pushViewController:tac  animated:YES];
    }
    if (btn.tag%10==2) {
    
    
    [self.navigationController pushViewController:ititnerary animated:YES];
    }
    if (btn.tag%10==3) {
    
    [self.navigationController pushViewController:trave animated:YES];
    
    }
    if (btn.tag%10==4) {
    
    [self.navigationController pushViewController:tactiac animated:YES];
                
    
   }
    
    
    
  

}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)viewWillDisappear:(BOOL)animated
{
    //控制器将要消失展示tabBar
    
    
    [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
    
    
}

@end
