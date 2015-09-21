//
//  TacticTwoCell.h
//  Chan
//
//  Created by MS on 15-9-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TacticCollModel.h"
@interface TacticTwoCell : UITableViewCell
@property(nonatomic,strong)UIButton * downButton1;
@property(nonatomic,strong)UIButton * downButton2;
@property(nonatomic,strong)UIButton * downButton3;
@property(nonatomic,strong)UIButton * downButton4;
- (void)updateCellWithNewsModel:(TacticCollModel *)app andIndexPath:(NSIndexPath*)indexPath;
@end
