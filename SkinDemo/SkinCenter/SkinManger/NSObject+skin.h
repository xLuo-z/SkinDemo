//
//  NSObject+skin.h
//  SkinDemo
//
//  Created by 技术部 on 17/7/31.
//  Copyright © 2017年 Mr Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseSkin;

@interface NSObject (skin)

/**
 @brief 绑定皮肤改变回调
 @param callBack 皮肤回调，skin-当前使用皮肤
 */
- (void) bindSkinCallBack:(void(^)(id sender,BaseSkin *skin))callBack;

@end
