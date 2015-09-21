//
//  TravelDownTableViewCell.h
//  Chan
//
//  Created by MS on 15-9-15.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TravelDownModel.h"
@interface TravelDownTableViewCell : UITableViewCell
- (void)updateCellWithNewsModel:(TravelDownModel *)app andIndexPath:(NSIndexPath*)indexPath;
@end
