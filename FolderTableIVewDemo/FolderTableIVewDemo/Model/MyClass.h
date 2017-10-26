//
//  MyClass.h
//  FolderTableIVewDemo
//
//  Created by 江奔 on 2017/10/26.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 班级 */
@interface MyClass : NSObject
/** class_name */
@property (nonatomic, copy) NSString *class_name;
/** students */
@property (nonatomic, strong) NSArray *students;
/** 当前section开合标识 */
@property (nonatomic, assign) BOOL open;
@end
