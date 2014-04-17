//
//  ALOTableFormsListPicker.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 17.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsItem.h"
#import "ALOAccessoryTableViewCell.h"

@interface ALOTableFormsListPicker : ALOTableFormsItem

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder;
-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder values:(NSDictionary*)values;
-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder values:(NSDictionary*)values value:(NSString *)value;
-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder values:(NSDictionary*)values value:(NSString *)value changeValueHandler:(void(^)(NSString *value))changeValueHandler;

@property (nonatomic, strong, readonly) ALOAccessoryTableViewCell *cell;

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSDictionary *values;
@property (nonatomic, copy) NSString *cellValue;

@property (nonatomic, strong) UIPickerView *picker;

// handler
@property (nonatomic, copy) void(^changeValueHandler)(NSString *value);

@end
