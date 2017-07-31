//
//  NSObject+skin.m
//  SkinDemo
//
//  Created by 技术部 on 17/7/31.
//  Copyright © 2017年 Mr Luo. All rights reserved.
//

#import "NSObject+skin.h"
#import "SkinBinderManger.h"

@implementation NSObject (skin)

/**
 * 绑定当前使用皮肤
 * @param callBack 当前皮肤绑定回调
 */
- (void)bindSkinCallBack:(void (^)(id, BaseSkin *))callBack {
    [[SkinBinderManger sharedInstence] bindSkin:self identifier:[self collectIdentifier] CallBack:callBack];
}

#pragma mark private
- (NSString *)collectIdentifier
{
    NSArray *callStackSymbols = [NSThread callStackReturnAddresses];
    assert(callStackSymbols.count >= 4);
    
    NSString *identifier = [NSString stringWithFormat:@"%p_%@_%@_%@", self, [self class], callStackSymbols[2],callStackSymbols[3]];
    
    return identifier;
}

@end
