//
//  DebounceFunctionManager.m
//  Debounce
//
//  Created by qiu on 2019/5/5.
//  Copyright © 2019年 qiu. All rights reserved.
//

#import "DebounceFunctionManager.h"

@interface DebounceFunctionManager ()

/**
 方法
 */
@property (nonatomic,strong) NSMutableDictionary *funDic;

/**
 参数
 */
@property (nonatomic,strong) NSMutableDictionary *userinfoDic;


@end

@implementation DebounceFunctionManager

- (void)debounceTarget:(id)target function:(SEL)function userInfo:(id)userInfo interval:(NSUInteger)interval {
    
    NSString *functionStr = NSStringFromSelector(function);
    id last_userInfo = [self.userinfoDic objectForKey:functionStr];
    
    if ([self.funDic objectForKey:functionStr]) {
        //重新延迟执行
        [NSObject cancelPreviousPerformRequestsWithTarget:target selector:function object:last_userInfo];
        if (userInfo) {
            [self.userinfoDic setObject:userInfo forKey:functionStr];
        }
    } else {
        //设置延迟执行，并储存这个方法名
        if (target && functionStr) {
            [self.funDic setObject:target forKey:functionStr];
            if (userInfo) {
                [self.userinfoDic setObject:userInfo forKey:functionStr];
            }
        }
    }
    [target performSelector:function withObject:userInfo afterDelay:interval];
}

#pragma mark SetterAndGetter
- (NSMutableDictionary *)funDic {
    if (!_funDic) {
        _funDic = [NSMutableDictionary dictionary];
    }
    return _funDic;
}

- (NSMutableDictionary *)userinfoDic {
    if (!_userinfoDic) {
        _userinfoDic = [NSMutableDictionary dictionary];
    }
    return _userinfoDic;
}

@end
