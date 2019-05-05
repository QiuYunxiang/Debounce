//
//  DebounceFunctionManager.h
//  Debounce
//
//  Created by qiu on 2019/5/5.
//  Copyright © 2019年 qiu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DebounceFunctionManager : NSObject

/**
 函数防抖

 @param target target
 @param function 方法SEL
 @param userInfo 参数
 @param interval 防抖间隔
 */
- (void)debounceTarget:(id)target function:(SEL)function userInfo:(id)userInfo interval:(NSUInteger)interval;

@end

NS_ASSUME_NONNULL_END
