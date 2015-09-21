//
//  TacticTwoTacticTCell.m
//  Chan
//
//  Created by MS on 15-9-21.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TacticTwoTacticTCell.h"

@interface TacticTwoTacticTCell()
@property(nonatomic,strong)UILabel * label;
@end
@implementation TacticTwoTacticTCell




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectZero];
        self.label= label;
       
        [self.contentView addSubview:label];
        
        
        
        
        
        
        
    }
    return self;
    
}
- (void)updateCellWithNewsModel:(NSArray *)app andIndexPath:(NSIndexPath*)indexPath
{

   
    NSString * s=[app[indexPath.row]objectForKey:@"description"];
    self.label.text=s;
    self.label.font=[UIFont systemFontOfSize:15];
    
    CGSize size = CGSizeMake(SCREEN_WIDTH-20,2000);
    
     self.label.backgroundColor=[UIColor clearColor];
    
    //        self.titleLabel.textColor=[UIColor whiteColor];
    [ self.label setNumberOfLines:0];
    CGSize labelsize = [ self.label.text sizeWithFont: self.label.font constrainedToSize:size ];
    //7.重设UILabel实例的frame
    [ self.label setFrame:CGRectMake(10, 10, labelsize.width, labelsize.height)];



}
@end
