//
//  TraveDownPTCell.m
//  Chan
//
//  Created by MS on 15-9-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TraveDownPTCell.h"
@interface TraveDownPTCell ()
@property(nonatomic,strong)UILabel * label;
@property(nonatomic,strong)UIImageView * bigImageView;
@end


@implementation TraveDownPTCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 180)];
        self.bigImageView=imageView;
        imageView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:imageView];
    
        
        
        
        
        
        
        
        
        
        
        
        
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
        [label setFrame:CGRectMake(10, 200, labelsize.width, labelsize.height)];
        [self.contentView addSubview:label];
        
        
        
        
        
        
        
    }
    return self;
    
}

















- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
