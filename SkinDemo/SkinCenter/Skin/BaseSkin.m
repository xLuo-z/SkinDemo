//
//  BaseSkin.m
//  SkinDemo
//
//  Created by 技术部 on 17/7/28.
//  Copyright © 2017年 Mr Luo. All rights reserved.
//

#import "BaseSkin.h"

@implementation BaseSkin

/**
 * 获取当前皮肤使用图片，图片存放方式必须为：图片原始名称_皮肤类名称，identifier及图片原始名称，如：图片名为：tempImg_BlanSkin，identifier传入tempImg
 */
- (UIImage *)getImgNameWithIdentifier:(NSString *)identifier {
    NSString *tempImgName = [NSString stringWithFormat:@"%@_%@",identifier,NSStringFromClass([self class])];
    UIImage *image = [UIImage imageNamed:tempImgName];
    return image;
}


@end
