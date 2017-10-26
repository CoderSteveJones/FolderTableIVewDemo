//
//  ViewController.m
//  FolderTableIVewDemo
//
//  Created by 江奔 on 2017/10/26.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

#import "ViewController.h"
#import "MySectionHeaderView.h"
#import "MyCell.h"
#import "MyClass.h"
#import "MyStudent.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *datas;
@property (strong, nonatomic) NSMutableArray *classes;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCellID"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MySectionHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"MySectionHeaderViewID"];
    self.tableView.tableFooterView = [UIView new];
    self.classes = [NSMutableArray array];
    self.datas = @[    @{@"className" : @"Aitna",
                         @"students"  : @[@{@"name" : @"Y.X.M."},
                                          @{@"name" : @"Leif"},
                                          @{@"name" : @"Lennon"},
                                          @{@"name" : @"Lambert"},
                                          @{@"name" : @"Jerome"},
                                          @{@"name" : @"Isidore"}]},
                       @{@"className" : @"Melete",
                         @"students"  : @[@{@"name" : @"Merle"},
                                          @{@"name" : @"Paddy"},
                                          @{@"name" : @"Perry"},
                                          @{@"name" : @"Philip"}]},
                       @{@"className" : @"Aoede",
                         @"students"  : @[@{@"name" : @"Verne"},
                                          @{@"name" : @"Vincent"},
                                          @{@"name" : @"Walter"},
                                          @{@"name" : @"Zachary"}]},
                       @{@"className" : @"Dione",
                         @"students"  : @[@{@"name" : @"Timothy"},
                                          @{@"name" : @"Roderick"},
                                          @{@"name" : @"Quentin"},
                                          @{@"name" : @"Paddy"}]},
                       @{@"className" : @"Adanos",
                         @"students"  : @[@{@"name" : @"Mortimer"},
                                           @{@"name" : @"Michael"},
                                           @{@"name" : @"Kevin"},
                                          @{@"name" : @"Jeremy"}]}];
    
    /** 处理数据，得到所有班级 */
    for (NSDictionary *class in self.datas) {
        
        MyClass *new_class = [MyClass new];
        new_class.class_name = class[@"className"];
        NSArray *students = class[@"students"];
        NSMutableArray *new_students = [NSMutableArray array];
        for (NSDictionary *student in students) {
            MyStudent *new_student = [MyStudent new];
            new_student.student_name = student[@"name"];
            [new_students addObject:new_student];
        }
        new_class.students = new_students;
        
        [self.classes addObject:new_class];
    }
    
}

#pragma mark - UITableViewDelegate DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.classes.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MyClass *class = self.classes[section];
    return class.open ? class.students.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID" forIndexPath:indexPath];
    MyClass *class = self.classes[indexPath.section];
    cell.student = class.students[indexPath.row];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MySectionHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"MySectionHeaderViewID"];
    MyClass *class = self.classes[section];
    header.class_model = class;
    header.headViewClick = ^(MyClass *class_model) {
        /** 根据open参数进行tableView的开合*/
        class.open = !class.open;
        if (class.open) {
            
            NSMutableArray *indexPaths = [NSMutableArray array];
            for (int i = 0; i < class.students.count; i++) {
                [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:section]];
            }
            [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
            
        }else{
            NSMutableArray *indexPaths = [NSMutableArray array];
            for (int i = 0; i < class.students.count; i++) {
                [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:section]];
            }
            [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        }
    };
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
