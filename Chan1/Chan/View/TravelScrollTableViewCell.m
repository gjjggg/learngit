//
//  TravelScrollTableViewCell.m
//  Chan
//
//  Created by MS on 15-9-15.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TravelScrollTableViewCell.h"

@interface TravelScrollTableViewCell()<UIScrollViewDelegate>

{
    UIPageControl * page;
    UIScrollView * scrollView;
}


@end


@implementation TravelScrollTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIScrollView * scroller=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , 180)];
        
        scroller.bounces=NO;
        scroller.showsHorizontalScrollIndicator=NO;
        scroller.showsVerticalScrollIndicator=NO;
        //scroller.contentSize=CGSizeMake(<#CGFloat width#>, <#CGFloat height#>)
      
        scroller.pagingEnabled=YES;
        scroller.delegate=self;
        scrollView=scroller;
        
    
          scroller.contentOffset=CGPointMake(0, 0);
        scroller.contentSize=CGSizeMake(SCREEN_WIDTH*2, 180);
        

        //scroller.backgroundColor=[UIColor redColor];
        [self.contentView addSubview:scrollView];
        
        
        
        
        UIView * scrollerUpView=[[UIView alloc]initWithFrame:CGRectMake(0, 180,SCREEN_WIDTH, 20)];
        scrollerUpView.backgroundColor=[UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
        [self.contentView addSubview:scrollerUpView];
        
        //<1>创建分页控件的对象
        page = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, -5, 200, 30)];
        //<2>设置分页控件的总页数
        page.numberOfPages = 2;
        //<3>设置分页控件当前的页码号（分页控件一次只能跳转一页）
        page.currentPage = 0;
        //<4>设置分页控件的背景颜色
        page.backgroundColor = [UIColor clearColor];
        //<5>为分页控件添加点击事件
        [page addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
        //<6>将分页控件添加到当前视图上
        [scrollerUpView addSubview:page];
        
        //<7>设置选中的点的颜色
        page.currentPageIndicatorTintColor = [UIColor redColor];

        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    return self;
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //在减速停止的方法中 可以获取最终的内容视图的偏移位置
    CGPoint point = scrollView.contentOffset;
    
    page.currentPage = point.x /SCREEN_WIDTH;
    
}

-(void)pageChanged:(id)sender
{
    //<1>获取分页控件此时的页码号
    int currentPage = page.currentPage;
    //<2>改变内容视图的偏移位置（contentOffset）
    [UIView animateWithDuration:0.5 animations:^{
        
        scrollView.contentOffset = CGPointMake(currentPage * SCREEN_WIDTH, 0);
        
    } completion:nil];
    
}

- (void)updateCellWithNewsModel:(NSMutableArray *)app 
{


    for (int i=0; i<2; i++)
    
    {
         UIImageView * imageview=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, 180)];
        
        imageview.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [imageview setImageWithURL:[NSURL URLWithString:[app[i] image_url]]];
        
        
        [scrollView addSubview:imageview];
        
        
        
    }

    




}












- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
