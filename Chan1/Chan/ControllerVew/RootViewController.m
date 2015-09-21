//
//  RootViewController.m
//  Chan
//
//  Created by MS on 15-9-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "RootViewController.h"
#import "TravelViewController.h"
#import "TacticViewControlller.h"
#import "RDVTabBarItem.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewControllers];
    
    
}

- (void)setViewControllers {
    
    
    
    TravelViewController *traveVC = [[TravelViewController alloc] initWithNibName:@"TravelViewController" bundle:nil];
    UINavigationController *traveNav = [[UINavigationController alloc] initWithRootViewController:traveVC];
    

    TacticViewControlller *tacticVC = [[TacticViewControlller alloc] initWithNibName:@"TacticViewController" bundle:nil];
    UINavigationController *tacticNav = [[UINavigationController alloc] initWithRootViewController:tacticVC];
  
    
    
    [self setViewControllers:@[traveNav,tacticNav]];
    
    [self customizeTabBarForController:self];
    
}



- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
//    NSArray *tabBarItemImages = @[@"tabbar_limitfree", @"tabbar_reduceprice", @"tabbar_appfree",@"tabbar_subject",@"tabbar_rank"];
    
    NSArray *titles = @[@"游记",@"攻略"];
    
    NSInteger index = 0;
    
    NSDictionary *textAttributes_normal = nil;
    NSDictionary *textAttributes_selected = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        textAttributes_normal = @{
                                  NSFontAttributeName: [UIFont systemFontOfSize:12],
                                  NSForegroundColorAttributeName: [UIColor colorWithRed:65/255.0 green:65/255.0 blue:65/255.0 alpha:1.0],
                                  };
        textAttributes_selected = @{
                                    NSFontAttributeName: [UIFont systemFontOfSize:12],
                                    NSForegroundColorAttributeName: [UIColor colorWithRed:14/255.0 green:154/255.0 blue:255/255.0 alpha:1.0],
                                    };
    }
    
    
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        
        
        item.unselectedTitleAttributes = textAttributes_normal;
        item.selectedTitleAttributes = textAttributes_selected;
        
        
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
//        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_press",
//                                                      [tabBarItemImages objectAtIndex:index]]];
//        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
//                                                        [tabBarItemImages objectAtIndex:index]]];
       // [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        item.title = titles[index];
        
        index++;
        
        
        
    }
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
