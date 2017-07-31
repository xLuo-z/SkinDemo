//
//  SkinBinderManger.h
//  SkinDemo
//
//  Created by 技术部 on 17/7/31.
//  Copyright © 2017年 Mr Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseSkin;

@interface SkinBinderManger : NSObject

+ (instancetype) sharedInstence;

/**
 @brief 绑定皮肤改变回调
 @param sender 当前使用对象
 @param callBack 皮肤回调，skin-当前使用皮肤
 */
- (void) bindSkin:(id)sender identifier:(NSString *)identifier CallBack:(void(^)(id sender,BaseSkin *skin))callBack;

@end
