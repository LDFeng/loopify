//
//  LZWHelp.h
//  HeXiaoApp
//
//  Created by 刘振伟 on 15/9/1.
//  Copyright (c) 2015年 刘振伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZWHelp : NSObject
+ (void)setValue:(id)value forKey:(NSString *)key; //将键值对存储到NSUserDefault中
+ (id)valueForKey:(NSString *)key; //从NSUserDefault中得到key对应的value
+ (BOOL)isNotNull:(id)objc;
@end
