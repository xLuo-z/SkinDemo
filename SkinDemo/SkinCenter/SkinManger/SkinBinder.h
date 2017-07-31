//
//  SkinBinder.h
//  SkinDemo
//
//  Created by 技术部 on 17/7/31.
//  Copyright © 2017年 Mr Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseSkin;

@interface SkinBinder : NSObject

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, strong) id sender;

@property (nonatomic, copy) void(^skinChangeCallBack)(id sender,BaseSkin *skin);

@end
