//
//  MJTabBarViewController.m
//  AllLifeShow
//
//  Created by 邓茂江 on 16/10/8.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJTabBarViewController.h"
#import "MJTabBar.h"
#import "MJBaseNavigationController.h"
#import "MJMainViewController.h"
#import "MJMeViewController.h"
@interface MJTabBarViewController ()<MJReturnDelegate>
@property(nonatomic,strong)MJTabBar *MJtabBar;

@end

@implementation MJTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViewController];
//改代码
    NSLog(@"ppppp");
    


    [self.tabBar addSubview:self.MJtabBar];

}
-(MJTabBar *)MJtabBar{
    if (!_MJtabBar) {
        self.MJtabBar=[[MJTabBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        self.MJtabBar.delegate=self;
    }
    return _MJtabBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)configViewController{
/*    NSMutableArray *array=[NSMutableArray arrayWithArray:@[@"MJMainViewController",@"MJMeViewController"]];
    
    for (NSInteger index=0; index<array.count; index++) {
        
        NSString *vcName=array[index];
        
        UIViewController *vc = [[NSClassFromString(vcName) alloc] initWithFrame:self.view.bounds];
 */
    MJMainViewController *vc=[[MJMainViewController alloc]init];
    MJMeViewController *vc1=[[MJMeViewController alloc]init];
    NSMutableArray *array=[NSMutableArray arrayWithCapacity:3];
    [array addObject:vc];
    [array addObject:vc1];
    
        MJBaseNavigationController *nav=[[MJBaseNavigationController alloc]initWithRootViewController:vc];
        //[array replaceObjectAtIndex:index withObject:nav];
        self.viewControllers=array;
        
    //}
}




-(void)tabbar:(MJTabBar *)tabbar clickButton:(MJItemType)idx{
    
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
