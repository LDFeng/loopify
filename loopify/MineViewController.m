//
//  MineViewController.m
//  loopify
//
//  Created by 欢趣 on 16/3/2.
//  Copyright © 2016年 halleyaps. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"
@interface MineViewController ()<UIAlertViewDelegate>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
     [super viewWillAppear:animated];
    if ([AVUser currentUser] == nil) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您尚未登录，是否登录" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
        [alertView show];
        NSLog(@"未登录");
        
    }
   
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
        {
            NSString *cls =  [LZWHelp valueForKey:@"cls"];
            for (int i = 0; i<self.tabBarController.viewControllers.count; i++) {
                
                if ( [NSStringFromClass(self.tabBarController.viewControllers[i].class) isEqualToString:cls]) {
                    self.tabBarController.selectedIndex = i;
                    break;
                }
            }

        }
            break;
        case 1:
        {
            LoginViewController *loginVC = AllocWithStoryboardID(@"LoginViewController");
            [self presentViewController:loginVC animated:YES completion:nil];
            
        }
            break;
        default:
            break;
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
