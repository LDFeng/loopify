//
//  MineViewController.h
//  loopify
//
//  Created by 欢趣 on 16/3/2.
//  Copyright © 2016年 halleyaps. All rights reserved.
//

#import "BaseViewController.h"

@interface MineViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIImageView *userImageBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userSummaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *storyNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *attentionNumLabel;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@end
