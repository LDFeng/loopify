//
//  RegisterViewController.m
//  loopify
//
//  Created by 欢趣 on 16/3/2.
//  Copyright © 2016年 halleyaps. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *email;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)registerBtn:(id)sender {
    [[APIDataLoad defaultAPI] registerWithUserName:self.userName.text passWord:self.password.text email:self.email.text block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // 注册成功
            [MyTools showTextHud:@"注册成功"];
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [MyTools showTextHud:[NSString stringWithFormat:@"%@",error]];
            // 失败的原因可能有多种，常见的是用户名已经存在。
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
