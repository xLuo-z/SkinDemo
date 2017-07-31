//
//  SkinBinderManger.m
//  SkinDemo
//
//  Created by 技术部 on 17/7/31.
//  Copyright © 2017年 Mr Luo. All rights reserved.
//

#import "SkinBinderManger.h"
#import "BaseSkin.h"
#import "SkinManger.h"
#import "SkinBinder.h"

@interface SkinBinderManger ()

@property (nonatomic, copy) void(^skinChangeCallBack)(id sender,BaseSkin *skin);

@property (nonatomic, strong) id sender;

@property (nonatomic, strong) NSMutableArray *skinBinderContainer;

@end

@implementation SkinBinderManger

+ (instancetype)sharedInstence {
    static SkinBinderManger *instence = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instence = [[SkinBinderManger alloc] init];
    });
    return instence;
}

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(skinChange:) name:skinChangeNotificationKey object:nil];
    }
    return self;
}

- (NSMutableArray *)skinBinderContainer {
    if (!_skinBinderContainer) {
        _skinBinderContainer = [NSMutableArray array];
    }
    return _skinBinderContainer;
}

/**
 * 绑定当前使用皮肤
 * @param sender 当前使用对象
 * @param callBack 当前皮肤绑定回调
 */
- (void)bindSkin:(id)sender identifier:(NSString *)identifier CallBack:(void (^)(id, BaseSkin *))callBack {
    if (![self existBinderWithIdentifier:identifier]) {
        SkinBinder *binder = [[SkinBinder alloc] init];
        binder.identifier = identifier;
        binder.sender = sender;
        binder.skinChangeCallBack = callBack;
        [self.skinBinderContainer addObject:binder];
    }
}

- (BOOL) existBinderWithIdentifier:(NSString *)identifier {
    for (SkinBinder *binder in self.skinBinderContainer) {
        if ([binder.identifier isEqualToString:identifier]) {
            return YES;
        }
    }
    return NO;
}

/**
 * 接收到皮肤改变通知
 */
- (void) skinChange:(NSNotification *)notification {
    BaseSkin *skin = notification.object;
    for (SkinBinder *binder in self.skinBinderContainer) {
        if (binder.skinChangeCallBack) {
            binder.skinChangeCallBack(binder.sender,skin);
        }
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
