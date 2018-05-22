//
//  RuntimeForwardingClassTwo.m
//  Runtime summarize
//
//  Created by 荣琛 on 2018/5/22.
//  Copyright © 2018年 rc. All rights reserved.
//

#import "RuntimeForwardingClassTwo.h"

@implementation RuntimeForwardingClassTwo
- (void)sendMessage {
    NSLog(@"RuntimeForwardingClassTwo : %@", NSStringFromSelector(_cmd));
}
@end
