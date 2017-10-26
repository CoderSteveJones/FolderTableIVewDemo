//
//  MyCell.m
//  FolderTableIVewDemo
//
//  Created by 江奔 on 2017/10/26.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

#import "MyCell.h"

@interface MyCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end


@implementation MyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setStudent:(MyStudent *)student{
    _student = student;
    self.nameLabel.text = student.student_name;
}

@end
