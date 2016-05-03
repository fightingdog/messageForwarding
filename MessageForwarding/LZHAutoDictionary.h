//
//  LZHAutoDictionary.h
//  DynamicMethodResolution
//
//  Created by liuzhao on 16/5/2.
//  Copyright © 2016年 liuzhao. All rights reserved.
//

// 使用动态解析方法实现 @dynamic 属性
#import <Foundation/Foundation.h>

@interface LZHAutoDictionary : NSObject

@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) id opaqueObject;

@end
