//
//  APIDataLoad.m
//  loopify
//
//  Created by 欢趣 on 16/3/2.
//  Copyright © 2016年 halleyaps. All rights reserved.
//

#import "APIDataLoad.h"
@implementation APIDataLoad

static APIDataLoad *APIData = nil;

+ (APIDataLoad *)defaultAPI {
    @synchronized(self) {
        if(APIData == nil) {
            APIData = [[self alloc] init]; //   assignment   not   done   here
            
        }
    }
    return APIData;
}

- (void)loginWithUserName:(NSString *)userName passWord:(NSString *)passWord block:(AVUserResultBlock)block{
    [AVUser logInWithUsernameInBackground:userName password:passWord block:block];
}

- (void)registerWithUserName:(NSString *)userName passWord:(NSString *)passWord email:(NSString *)email block:(AVBooleanResultBlock)block {
    AVUser *user = [AVUser user];// 新建 AVUser 对象实例
    user.username = userName;// 设置用户名
    user.password =  passWord;// 设置密码
    user.email = email;// 设置邮箱
    [user signUpInBackgroundWithBlock:block];
}


- (void)readHotWithPage:(NSInteger)page block:(AVArrayResultBlock)block{
    AVQuery *query = [AVQuery queryWithClassName:@"HotStory"];
    query.limit = 10;
    query.skip = 10*(page-1);
    [query findObjectsInBackgroundWithBlock:block];
}

- (void)readTodayStoryWithPage:(NSInteger)page {
    
    
}

- (void)readStoryWithHotID:(NSString *)hotID page:(NSInteger)page {
    
    
}
- (void)createStoryWithText:(NSString *)text HotID:(id)Object{
    AVObject *object = [[AVObject alloc] initWithClassName:@"Story"];
    [object setObject:text forKey:@"content"];
    [object setObject:[AVUser currentUser] forKey:@"userID"];
    [object setObject:object forKey:@"HotStoryID"];
    [object saveInBackground];
}















@end
