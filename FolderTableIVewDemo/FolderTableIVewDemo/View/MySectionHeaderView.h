//
//  MySectionHeaderView.h
//  FolderTableIVewDemo
//
//  Created by 江奔 on 2017/10/26.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyClass.h"
@interface MySectionHeaderView : UITableViewHeaderFooterView
/** class */
@property (nonatomic, strong) MyClass *class_model;
/** 点击 */
@property (nonatomic, copy) void(^headViewClick)(MyClass *class_model);

@end
