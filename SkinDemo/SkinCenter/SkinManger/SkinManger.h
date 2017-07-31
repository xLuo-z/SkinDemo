//
//  SkinManger.h
//  SkinDemo
//
//  Created by 技术部 on 17/7/28.
//  Copyright © 2017年 Mr Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseSkin.h"

/**皮肤改变通知名称*/
extern NSString *skinChangeNotificationKey;

@interface SkinManger : NSObject

/*!
 @brief 单例初始化方法
 */
+ (instancetype) sharedInstence;

/*!
 @brief 添加皮肤
 @param skin 皮肤对象
 */
- (void) addSkin:(BaseSkin *)skin;

/*!
 @brief 添加皮肤
 @param skinName 皮肤对象名称
 */
- (void) addSkinWithName:(NSString *)skinName;

/*!
 @brief 设置当前皮肤
 @param skinName 皮肤对象名称
 */
- (void) setCurrentSkinWithName:(NSString *)skinName;

/*!
 @brief 获取当前使用皮肤对象
 @param skinName 要获取皮肤对象名称
 */
- (BaseSkin *) skinName:(NSString *)skinName;

@end
