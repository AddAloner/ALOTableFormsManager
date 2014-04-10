//
//  ALOTableFormsDateField.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 10.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsTextField.h"
#import "ALODateFieldTableViewCell.h"

@interface ALOTableFormsDateField : ALOTableFormsTextField

@property (nonatomic, copy) NSDate *cellValue;
@property (nonatomic, strong, readonly) ALODateFieldTableViewCell *cell;

// handler
@property (nonatomic, copy) void(^changeValueHandler)(NSDate *value);

// validation
@property (nonatomic, assign) NSUInteger minLength __attribute__((unavailable));
@property (nonatomic, assign) NSUInteger maxLength __attribute__((unavailable));

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSDate *)value;
-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSDate *)value changeValueHandler:(void(^)(NSDate *value))changeValueHandler;

@end
