//
//  BaseViewController.h
//  Chan
//
//  Created by MS on 15-9-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


{
    NSMutableArray * _dataSource;
    NSMutableArray * _scrollerSource;
}

@property(nonatomic,strong)UITableView * tableView;

@end
