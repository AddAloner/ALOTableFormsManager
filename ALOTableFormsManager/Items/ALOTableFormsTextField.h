//
//  ALOTableFormsTextField.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 07.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsItem.h"

@interface ALOTableFormsTextField : ALOTableFormsItem

@property (nonatomic, strong, readonly) UITextField *textField;
@property (nonatomic, copy) NSString *cellValue;

-(id)initWithLabel:(NSString *)label;
-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder;

@end
