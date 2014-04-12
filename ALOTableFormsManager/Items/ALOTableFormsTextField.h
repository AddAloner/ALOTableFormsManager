//
//  ALOTableFormsTextField.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 07.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsItem.h"
#import "ALOTextFieldTableViewCell.h"

@interface ALOTableFormsTextField : ALOTableFormsItem

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder;
-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSString *)value;
-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSString *)value changeValueHandler:(void(^)(NSString *value))changeValueHandler;

@property (nonatomic, strong, readonly) ALOTextFieldTableViewCell *cell;

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSString *cellValue;

// handler
@property (nonatomic, copy) void(^changeValueHandler)(NSString *value);

// validation
@property (nonatomic, assign) NSUInteger minLength;
@property (nonatomic, assign) NSUInteger maxLength;

@end
