//
//  TacticTTaicTwoController.m
//  Chan
//
//  Created by MS on 15-9-21.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTTaicTwoController.h"
#import "TraveDownTwoCell.h"
#import "TacticTwoTacticTwoCell.h"
#import "TacticTwoTacticTCell.h"
#import "TacticCollModel.h"
@interface TacticTTaicTwoController ()

@end

@implementation TacticTTaicTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
  //  [self.data addObject:@"ftghj\\"];
   
    [_dataSource addObjectsFromArray:self.data];
    NSLog(@"%@",_dataSource);
    NSLog(@"%ld",_dataSource.count);
    // Do any additional setup after loading the view from its nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource [section] sections].count ;

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
    NSArray  *arr= [_dataSource [indexPath.section] sections];
    NSArray * photoArr=[arr [indexPath.row] objectForKey:@"photos"];
   // NSLog(@"++++++++++%@,%ld,%ld",photoArr,indexPath.section,indexPath.row);
   // NSLog(@"%ld,%@ld",indexPath.section,indexPath.row)
    if (photoArr.count==0) {
        
   
        TacticTwoTacticTCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil) {
            cell = [[TacticTwoTacticTCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        [cell updateCellWithNewsModel:arr andIndexPath:indexPath];
        return cell;
    }
    
    
    
    else
    {
        cellID = @"news";
        TacticTwoTacticTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil) {
            cell = [[TacticTwoTacticTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
    
//        for (int i=0; i<photoArr.count; i++)
//        {
//            NSLog(@"%@",[photoArr[i] objectForKey:@"image_url"]);
//        }
        [cell updateCellWithNewsModel:arr andText:photoArr andIndexPath:indexPath];
        return cell;
        
    }
    
        
        
        
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray  *arr= [_dataSource [indexPath.section] sections];
    NSArray * photoArr=[arr [indexPath.row] objectForKey:@"photos"];
    //NSLog(@"++++++++++%@,%ld,%ld",photoArr,indexPath.section,indexPath.row);
    // NSLog(@"%ld,%@ld",indexPath.section,indexPath.row)
    if (photoArr.count==0) {
        
        
        NSString *text = [arr[indexPath.row]objectForKey:@"description"];
        
        CGSize constraint = CGSizeMake(SCREEN_WIDTH - 20, 20000.0f);
        
        CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
        
        CGFloat height =MAX(size.height, 44.0f);
       
        return height + (10 *2);
    }
    
    else
    {
        
        
        
        NSString *text = [arr[indexPath.row]objectForKey:@"description"];
        
        CGSize constraint = CGSizeMake(SCREEN_WIDTH - 20, 20000.0f);
        
        CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
        
        CGFloat height =MAX(size.height, 44.0f);
        
        return height + (10 *3)+200;
        
        
        
    }
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
