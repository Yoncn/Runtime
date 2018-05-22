//
//  RuntimeForwardingClassOne.m
//  Runtime summarize
//
//  Created by 荣琛 on 2018/5/22.
//  Copyright © 2018年 rc. All rights reserved.
//

#import "RuntimeForwardingClassOne.h"
#import <objc/runtime.h>
#import "RuntimeForwardingClassTwo.h"

@implementation RuntimeForwardingClassOne


//- (void)sendMessage {
//    NSLog(@"RuntimeForwardingClassOne : %@", NSStringFromSelector(_cmd));
//}



//Method Resolution
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(sendMessage)) {
        class_addMethod([self class], sel, imp_implementationWithBlock(^(){
            NSLog(@"%@", NSStringFromSelector(_cmd));
        }), "v@");
    }
    return YES;
}

//Fast Forwarding
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    if (aSelector == @selector(sendMessage)) {
        return [RuntimeForwardingClassTwo new];
    }
    return nil;
}

//Normal Forwarding
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    if (aSelector == @selector(sendMessage) && !methodSignature) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@*"];
    }
    return methodSignature;
}


- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    RuntimeForwardingClassTwo *classTwo = [RuntimeForwardingClassTwo new];
    if ([classTwo respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:classTwo];
    }
}




@end
