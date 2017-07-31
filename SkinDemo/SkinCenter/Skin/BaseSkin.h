//
//  BaseSkin.h
//  SkinDemo
//
//  Created by 技术部 on 17/7/28.
//  Copyright © 2017年 Mr Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseSkin : NSObject

/*!
 @brief 获取当前皮肤使用图片，图片存放方式必须为：图片原始名称_皮肤类名称，identifier及图片原始名称，如:图片名为：tempImg_BlanSkin，identifier传入tempImg
 @param identifier 图片原始名称
 @return UIImage 返回获取到的图片
 */
- (UIImage *)getImgNameWithIdentifier:(NSString *)identifier;


/**一下属性根据需要自行定义*/
@property (nonatomic, strong) UIColor *bgColor;

@property (nonatomic, strong) UIColor *textColor;

@end
