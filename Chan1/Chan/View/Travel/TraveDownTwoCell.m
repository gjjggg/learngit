//
//  TraveDownTwoCell.m
//  Chan
//
//  Created by MS on 15-9-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TraveDownTwoCell.h"

@interface TraveDownTwoCell ()
@property(nonatomic,strong)UILabel * label;
@end
@implementation TraveDownTwoCell




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
    
    
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectZero];
        self.label=label;
        NSString * s=@"asdfxghjkl;'lkjhgvfcdxcgvhbjkml,;./";
        label.text=s;
        label.font=[UIFont systemFontOfSize:12];
        
        CGSize size = CGSizeMake(SCREEN_WIDTH-20,2000);

        label.backgroundColor=[UIColor clearColor];
        
//        self.titleLabel.textColor=[UIColor whiteColor];
        [label setNumberOfLines:0];
        CGSize labelsize = [label.text sizeWithFont:label.font constrainedToSize:size ];
        //7.重设UILabel实例的frame
        [label setFrame:CGRectMake(10, 10, labelsize.width, labelsize.height)];
        [self.contentView addSubview:label];
    
    
    
    
    
    
    
    }
    return self;

}
@end
