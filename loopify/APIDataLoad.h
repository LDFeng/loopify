//
//  APIDataLoad.h
//  loopify
//
//  Created by 欢趣 on 16/3/2.
//  Copyright © 2016年 halleyaps. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^myDataBlock) (NSDictionary *dict);
@interface APIDataLoad : NSObject
@property (nonatomic, copy) myDataBlock data;
/**
 *  单例
 *
 *  @return 类的单例对象
 */
+ (APIDataLoad *)defaultAPI;
/**
 *  登录接口
 *
 *  @param userName 用户名
 *  @param passWord 密码
 *  @param data     返回数据的block
 */
- (void)loginWithUserName:(NSString *)userName passWord:(NSString *)passWord block:(AVUserResultBlock)block;
/**
 *  注册接口
 *
 *  @param userName 用户名
 *  @param passWord 密码
 *  @param email    邮箱
 *  @param data     返回数据的block
 */
- (void)registerWithUserName:(NSString *)userName passWord:(NSString *)passWord  email:(NSString *)email block:(AVBooleanResultBlock)block;
/**
 *  获取热门页面接口
 *
 *  @param page 获取的条数
 */
- (void)readHotWithPage:(NSInteger)page block:(AVArrayResultBlock)block;
/**
 *  获取热门话题下故事的接口
 *
 *  @param hotID 故事的id
 *  @param page  获取的条数
 */
- (void)readStoryWithHotID:(NSString *)hotID page:(NSInteger)page;
/**
 *  获取今天界面的故事
 *
 *  @param page 获取的条数
 */
- (void)readTodayStoryWithPage:(NSInteger)page;

/**
 *  创建故事
 *
 *  @param text   故事内容
 *  @param Object 热门
 */

- (void)createStoryWithText:(NSString *)text HotID:(id)Object;

@end













