//
//  CustomizedPickerView.m
//  UIDatePicker的创建与使用
//
//  Created by 胡 亚辉 on 16/2/1.
//  Copyright © 2016年 shikee_Chan. All rights reserved.
//

#import "CustomizedPickerView.h"

@implementation CustomizedPickerView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 40)];
        self.datePicker.datePickerMode = UIDatePickerModeDate;
        self.datePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.datePicker];
//        [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];//重点：UIControlEventValueChanged
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文显示
        self.datePicker.locale = locale;
        NSDate* minDate = [[NSDate alloc]initWithTimeIntervalSince1970:0];
        NSDate* maxDate = [[NSDate alloc]initWithTimeIntervalSinceNow:-60*60*24*365*12];//12年前
        //设置属性
        self.datePicker.minimumDate = minDate;
        self.datePicker.maximumDate = maxDate;
        
        
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setFrame:CGRectMake(0,frame.size.height - 40, frame.size.width/2, 40)];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancelBtn.backgroundColor = [UIColor greenColor];
        [self addSubview:_cancelBtn];
        
        self.sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sureBtn setFrame:CGRectMake(frame.size.width / 2, frame.size.height - 40, frame.size.width/2, 40)];
        [_sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sureBtn];
    }
    return self;
}
- (void)cancelAction {
    self.hidden = YES;
}
- (void)sureAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerViewAction:)]) {
        [self.delegate pickerViewAction:self.datePicker];
    }
    self.hidden = YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
