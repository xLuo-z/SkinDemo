//
//  ViewController.m
//  SkinDemo
//
//  Created by 技术部 on 17/7/28.
//  Copyright © 2017年 Mr Luo. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+skin.h"
#import "SkinManger.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIImageView *textImg;
@property (weak, nonatomic) IBOutlet UIView *textView;

@end

@implementation ViewController
- (IBAction)blackSkinButtonCkicked:(id)sender {
    [[SkinManger sharedInstence] setCurrentSkinWithName:@"BlankSkin"];
}
- (IBAction)blueSkinButtonClicked:(id)sender {
    [[SkinManger sharedInstence] setCurrentSkinWithName:@"BlueSkin"];
}
- (IBAction)redSkinButtonClicked:(id)sender {
    [[SkinManger sharedInstence] setCurrentSkinWithName:@"RedSkin"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[SkinManger sharedInstence] setCurrentSkinWithName:@"BlankSkin"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //用各种皮肤初始化皮肤管理器
    NSArray *skinNames = @[@"RedSkin",@"BlueSkin",@"BlankSkin"];
    for (NSString *skinName in skinNames) {
        [[SkinManger sharedInstence] addSkinWithName:skinName];
    }
    
    
    
    //使用
    [self.textLabel bindSkinCallBack:^(id sender, BaseSkin *skin) {
        UILabel *label = sender;
        label.textColor = skin.textColor;
    }];
    
    [self.textImg bindSkinCallBack:^(id sender, BaseSkin *skin) {
        UIImageView *imgView = sender;
        imgView.image = [skin getImgNameWithIdentifier:@"tempImg"];
    }];
    
    [self.textView bindSkinCallBack:^(id sender, BaseSkin *skin) {
        UIView *view = sender;
        view.backgroundColor = skin.bgColor;
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
