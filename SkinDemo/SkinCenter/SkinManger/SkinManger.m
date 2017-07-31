//
//  SkinManger.m
//  SkinDemo
//
//  Created by 技术部 on 17/7/28.
//  Copyright © 2017年 Mr Luo. All rights reserved.
//

#import "SkinManger.h"
#import "BaseSkin.h"

NSString *skinChangeNotificationKey = @"skinChangeNotificationKey";

@interface SkinManger ()

/**存储所有皮肤*/
@property (nonatomic, strong) NSMutableArray *skins;

/**当前使用皮肤*/
@property (nonatomic, strong) BaseSkin *currentSkin;

@end

@implementation SkinManger

+ (instancetype)sharedInstence {
    static SkinManger *instence = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instence = [[SkinManger alloc] init];
    });
    return instence;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark setter && getter
- (NSMutableArray *)skins {
    if (!_skins) {
        _skins = [NSMutableArray array];
    }
    return _skins;
}

/**这只当前使用皮肤时发送通知*/
- (void)setCurrentSkin:(BaseSkin *)currentSkin {
    if (currentSkin != _currentSkin) {
        _currentSkin = currentSkin;
        [[NSNotificationCenter defaultCenter] postNotificationName:skinChangeNotificationKey object:_currentSkin];
    }
}

#pragma mark 操作皮肤方法
/**
 * 添加皮肤
 * @param skin 皮肤对象
 */
- (void)addSkin:(BaseSkin *)skin {
    [self.skins addObject:skin];
}

/**
 * 添加皮肤
 * @param skinName 皮肤对象名称
 */
- (void)addSkinWithName:(NSString *)skinName {
    Class class = NSClassFromString(skinName);
    BaseSkin *skin = [[class alloc] init];
    [self addSkin:skin];
}

/**
 * 设置当前使用皮肤
 * @param skinName 待皮肤对象名称
 */
- (void)setCurrentSkinWithName:(NSString *)skinName {
    BaseSkin *skin = [self skinName:skinName];
    if (!skin) {
        [self addSkinWithName:skinName];
        [self setCurrentSkinWithName:skinName];
    }else {
        self.currentSkin = skin;
    }
}

/**
 * 根据皮肤名称获取当前使用的皮肤
 * @param skinName 当前使用皮肤名称
 */
- (BaseSkin *)skinName:(NSString *)skinName {
    BaseSkin *skin = nil;
    for (BaseSkin *tempSkin in self.skins) {
        NSString *tempSkinName = NSStringFromClass([tempSkin class]);
        if ([tempSkinName isEqualToString:skinName]) {
            skin = tempSkin;
            break;
        }
    }
    return skin;
}

#pragma mark private

@end
