//
//  LZHAutoDictionary.h
//  DynamicMethodResolution
//
//  Created by liuzhao on 16/5/2.
//  Copyright © 2016年 liuzhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZHAutoDictionary : NSObject

@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) id opaqueObject;

@end
