//
//  LZHAutoDictionary.m
//  DynamicMethodResolution
//
//  Created by liuzhao on 16/5/2.
//  Copyright © 2016年 liuzhao. All rights reserved.
//

#import "LZHAutoDictionary.h"
#import <objc/runtime.h>


@interface LZHAutoDictionary()

@property (nonatomic, strong) NSMutableDictionary *backingStore;

@end

id autoDictionaryGetter(id self, SEL _cmd) {
    LZHAutoDictionary *typedSelf = (LZHAutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    
    NSString *key = NSStringFromSelector(_cmd);
    
    return [backingStore objectForKey:key];
}

void autoDictionarySetter(id self, SEL _cmd, id value) {
    LZHAutoDictionary *typedSelf = (LZHAutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    
    NSString *selectorString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selectorString mutableCopy];
    
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    
    if (value) {
        [backingStore setObject:value forKey:key];
    } else {
        [backingStore removeObjectForKey:key];
    }
}

@implementation LZHAutoDictionary

@dynamic string, number, date, opaqueObject;

- (id)init {
    self = [super init];
    if (self) {
        _backingStore = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)selector
{
    NSString *selectorString = NSStringFromSelector(selector);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self, selector, (IMP)autoDictionarySetter, "v@:@");
    } else {
        class_addMethod(self, selector, (IMP)autoDictionaryGetter, "@@:");
    }
    return YES;
}

@end
