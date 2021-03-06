//
//  ALOTableFormsDateField.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 10.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsTextField.h"

@interface ALOTableFormsDateField : ALOTableFormsTextField

- (instancetype)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSDate *)value;
- (instancetype)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSDate *)value changeValueHandler:(void(^)(NSDate *value))changeValueHandler;

@property (nonatomic, copy) NSDate *dateCellValue;
@property (nonatomic, copy) NSString *cellValue __attribute__((unavailable));

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

// handler
@property (nonatomic, copy) void(^changeValueHandler)(NSDate *value);

// validation
@property (nonatomic, assign) NSUInteger minLength __attribute__((unavailable));
@property (nonatomic, assign) NSUInteger maxLength __attribute__((unavailable));
@property (nonatomic, copy) NSDate *minDate;
@property (nonatomic, copy) NSDate *maxDate;

@end
