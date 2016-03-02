//
//  MineViewController.m
//  loopify
//
//  Created by 欢趣 on 16/3/2.
//  Copyright © 2016年 halleyaps. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"
@interface MineViewController ()<UIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    // Do any additional setup after loading the view.
}

- (void)createView {
    srand((unsigned)time(0));  //不加这句每次产生的随机数不变
    int i = rand() % 20;
    self.userImageBackgroundView.image = [UIImage imageNamed:[NSString stringWithFormat:@"bg%d.jpg",i]];
    self.userImageView.clipsToBounds = YES;
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width/2;
    //self.userTableView.tableHeaderView = self.userImageBackgroundView;
    self.userTableView.delegate = self;
    self.userTableView.dataSource = self;
    //self.userImageBackgroundView.frame = CGRectMake(0, 0, 100, 100);
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset   = self.userTableView.contentOffset.y;
    if (yOffset < 0) {
        CGRect f = self.userImageBackgroundView.frame;
        f.size.height = -yOffset/5 + 300;
        //f.origin.y = -yOffset;
        self.userImageBackgroundView.frame = f;
        
    }
}

#pragma mark UITableViewDataSource,UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *userCell = @"userCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:userCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    return cell;
    
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
