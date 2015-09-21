//
//  TacticTwoTravePlayTableViewCell.h
//  Chan
//
//  Created by MS on 15-9-18.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TacticCollModel.h"
@interface TacticTwoTravePlayTableViewCell : UITableViewCell
- (void)updateCellWithNewsModel:(TacticCollModel *)app andIndexPath:(NSIndexPath*)indexPath;
@end
