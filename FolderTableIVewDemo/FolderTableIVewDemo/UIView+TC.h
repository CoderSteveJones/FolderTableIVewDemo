//
//  UIView+TC.h
//  TCSmartCommunity-property
//
//  Created by TC on 16/3/15.
//  Copyright © 2016年 tiancheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);


@interface UIView (TC)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
- (void)addTapActionWithBlock:(GestureActionBlock)block;
@end
