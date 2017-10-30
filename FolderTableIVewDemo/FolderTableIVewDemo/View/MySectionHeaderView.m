//
//  MySectionHeaderView.m
//  FolderTableIVewDemo
//
//  Created by 江奔 on 2017/10/26.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

#import "MySectionHeaderView.h"
#import "UIView+TC.h"
@interface MySectionHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *angleImage;
@end

@implementation MySectionHeaderView

- (void)setClass_model:(MyClass *)class_model{
    _class_model = class_model;
    self.nameLabel.text = class_model.class_name;
    /** 根据open参数设置箭头 我这是简单处理方式  应该采用动画旋转比较好*/
    self.angleImage.image = [UIImage imageNamed:class_model.open ? @"向下" : @"向右"];
    __weak MySectionHeaderView *weakSelf = self;
    /** 视图HeaderView点击 */
    [self addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        class_model.open = !class_model.open;
        weakSelf.angleImage.image = [UIImage imageNamed:class_model.open ? @"向下" : @"向右"];
        
        if (weakSelf.headViewClick) {
            weakSelf.headViewClick(class_model);
        }
    }];
}

@end
