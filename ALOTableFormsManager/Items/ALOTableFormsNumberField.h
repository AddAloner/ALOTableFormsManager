//
//  ALOTableFormsNumberField.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 11.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsTextField.h"

@interface ALOTableFormsNumberField : ALOTableFormsTextField

@property (nonatomic, copy) NSNumber *numberCellValue;
@property (nonatomic, copy) NSString *cellValue __attribute__((unavailable));

// handler
@property (nonatomic, copy) void(^changeValueHandler)(NSNumber *value);

// validation
@property (nonatomic, assign) NSUInteger minLength __attribute__((unavailable));
@property (nonatomic, assign) NSUInteger maxLength __attribute__((unavailable));
@property (nonatomic, copy) NSNumber *minValue;
@property (nonatomic, copy) NSNumber *maxValue;

@end
