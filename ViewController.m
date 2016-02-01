//
//  ViewController.m
//  UIDatePicker的创建与使用
//
//  Created by 陈家庆 on 15-2-9.
//  Copyright (c) 2015年 shikee_Chan. All rights reserved.
//
#import "CustomizedPickerView.h"
#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomizedPickerView *pickerView  = [[CustomizedPickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 256)];
    pickerView.delegate =self;
    [self.view addSubview:pickerView];
}
- (void)pickerViewAction:(UIDatePicker *)picker {
    NSDate* date = picker.date;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    NSLog(@"%d - %d - %d", [components year], [components month], [components day]);
}
//- (void)dateChanged:(id)sender{
//    UIDatePicker *control = (UIDatePicker*)sender;
//    NSDate* date = control.date;
//    NSCalendar* calendar = [NSCalendar currentCalendar];
//    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
//    NSLog(@"%d - %d - %d", [components year], [components month], [components day]);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
