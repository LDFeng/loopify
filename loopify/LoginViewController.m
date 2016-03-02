
//
//  LoginViewController.m
//  loopify
//
//  Created by 欢趣 on 16/3/2.
//  Copyright © 2016年 halleyaps. All rights reserved.
//

#import "LoginViewController.h"
#import "BaseTabBar.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)login:(id)sender {
    [[APIDataLoad defaultAPI] loginWithUserName:self.userName.text passWord:self.passWord.text block:^(AVUser *user, NSError *error) {
        if (user != nil) {
            [MyTools showTextHud:@"登录成功"];
            BaseTabBar *tabBar = AllocWithStoryboardID(@"BaseTabBar");
            
            [self presentViewController:tabBar animated:YES completion:nil];
        } else {
            [MyTools showTextHud:[NSString stringWithFormat:@"%@",error]];
        }
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
