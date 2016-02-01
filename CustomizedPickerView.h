//
//  CustomizedPickerView.h
//  UIDatePicker的创建与使用
//
//  Created by 胡 亚辉 on 16/2/1.
//  Copyright © 2016年 shikee_Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PickerViewDelegate <NSObject>
- (void)pickerViewAction:(UIDatePicker *)picker;


@end
@interface CustomizedPickerView : UIView
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, assign) id<PickerViewDelegate>delegate;

@end
