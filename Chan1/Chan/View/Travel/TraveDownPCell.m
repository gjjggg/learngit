//
//  TraveDownPCell.m
//  Chan
//
//  Created by MS on 15-9-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TraveDownPCell.h"

@interface TraveDownPCell ()

@property(nonatomic,strong)UIImageView * bigImageView;
@end


@implementation TraveDownPCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 190)];
        self.bigImageView=imageView;
        imageView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:imageView];
        
        
        
        
        
        
        
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
