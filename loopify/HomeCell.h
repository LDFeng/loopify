//
//  HomeCell.h
//  loopify
//
//  Created by 欢趣 on 16/3/2.
//  Copyright © 2016年 halleyaps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;

@end
