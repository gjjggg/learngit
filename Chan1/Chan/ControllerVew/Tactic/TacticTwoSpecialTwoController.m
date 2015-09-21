//
//  TacticTwoSpecialTwoController.m
//  Chan
//
//  Created by MS on 15-9-19.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoSpecialTwoController.h"
#import "RDVTabBarController.h"
#import "TraveDownPCell.h"
#import "TraveDownPTCell.h"
#import "TraveDownTwoCell.h"
#import "TacticCollModel.h"

@interface TacticTwoSpecialTwoController ()
@property (nonatomic,strong)NSMutableArray * arr;
@end

@implementation TacticTwoSpecialTwoController

static int a=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.arr=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view from its nib.
}


- (void)viewWillAppear:(BOOL)animated {
   
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    
    [_dataSource removeAllObjects];
    [self.tableView reloadData];
    
    [DownLoadData getTacticDetailsDetailsPageData:^(id obj, NSError *err) {
        if (obj) {
            [_dataSource addObjectsFromArray:obj];
            NSLog(@"%@",_dataSource);
            [self.tableView reloadData];
          
         

        }
        else
        {
            NSLog(@"下载失败");
        
        }
        
        
    } withPage:_page];
    


    
    
    
    
    
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    for (int i=0; i<_dataSource.count; i++)
    {
        TacticCollModel * model=_dataSource[i];
        if ([model.title length])
        { a++;
            NSLog(@"+++++++++++%@ %d",model.title,a );
           
            [self.arr addObject:model.title];
             NSLog(@"%@ ",self.arr);
        }
    }
    //  NSLog(@"%d",i);
    return a+1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    return self.arr[section];
  
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * string = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:string];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    
    
    
    return cell;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    static NSString *cellID = nil;
//
//    
//    
//    
//    
//    
//    cellID = @"scroll";
//    if (indexPath.row==0) {
//        
//        
//        TraveDownTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//        
//        if (cell == nil) {
//            cell = [[TraveDownTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        }
//        
//        return cell;
//    }
//    
//    
//    
//    if(indexPath.row==1)
//    {
//        cellID = @"news";
//        TraveDownPCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//        
//        if (cell == nil) {
//            cell = [[TraveDownPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        }
//        
//        return cell;
//        
//    }
//    else
//    {
//        
//        cellID = @"news";
//        TraveDownPTCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//        
//        if (cell == nil) {
//            cell = [[TraveDownPTCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        }
//        
//        
//        
//        
//        
//        
//        return cell;
//        
//        
//        
//        
//        
//        
//    }
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row==0) {
//        
//        
//        NSString *text = @"dfghjkl;';lkjbhgvcfvhbjnkm.";
//        
//        CGSize constraint = CGSizeMake(SCREEN_WIDTH - 20, 20000.0f);
//        
//        CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
//        
//        CGFloat height =MAX(size.height, 44.0f);
//        
//        return height + (10 *2);
//    }
//    if (indexPath.row==1)
//    {
//        return 200;
//        
//        
//    }
//    else
//    {
//        
//        
//        
//        NSString *text = @"dfghjkl;';lkjbhgvcfvhbjnkm.";
//        
//        CGSize constraint = CGSizeMake(SCREEN_WIDTH - 20, 20000.0f);
//        
//        CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
//        
//        CGFloat height =MAX(size.height, 44.0f);
//        
//        return height + (10 *2)+200;
//        
//        
//        
//    }
//}



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
