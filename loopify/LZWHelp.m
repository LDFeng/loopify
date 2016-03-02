//
//  LZWHelp.m
//  HeXiaoApp
//
//  Created by 刘振伟 on 15/9/1.
//  Copyright (c) 2015年 刘振伟. All rights reserved.
//

#import "LZWHelp.h"

@implementation LZWHelp
+ (void)setValue:(id)value forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)valueForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

+(BOOL)isNotNull:(id)objc{
    if (![objc isEqual:[NSNull null]] && objc != nil && ![objc isEqualToString:@""] &&![objc isEqualToString:@"nill"]&&![objc isEqualToString:@"null"]){
        return YES;
    }else{
        return NO;
    }
}

+ (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-DD";
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
@end
	