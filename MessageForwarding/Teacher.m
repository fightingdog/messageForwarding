//
//  Teacher.m
//  ForwardingInvocation
//
//  Created by liuzhao on 16/5/2.
//  Copyright © 2016年 liuzhao. All rights reserved.
//

#import "Teacher.h"
#import "Doctor.h"

@implementation Teacher

//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    Doctor *doctor = [[Doctor alloc] init];
//    if ([doctor respondsToSelector:aSelector]) {
//        return doctor;
//    }
//    return  [super forwardingTargetForSelector:aSelector];
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *sig = nil;
    NSString *selStr = NSStringFromSelector(aSelector);
    if ([selStr isEqualToString:@"operate"]) {
        //此处返回的sig是方法forwardInvocation的参数anInvocation中的methodSignature
        Doctor *doctor = [[Doctor alloc]init];
        if([doctor respondsToSelector:aSelector]) {
            sig = [doctor methodSignatureForSelector:@selector(operate)];
        }
    }else{
        sig = [super methodSignatureForSelector:aSelector];
    }
    return sig;
}
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSString *selStr = NSStringFromSelector(anInvocation.selector);
    if ([selStr isEqualToString:@"operate"]) {
        Doctor *doctor = [[Doctor alloc]init];
        [anInvocation setTarget:doctor];
        [anInvocation setSelector:@selector(operate)];
        [anInvocation retainArguments];
        [anInvocation invoke];
    }else{
        [super forwardInvocation:anInvocation];
    }
}

@end

