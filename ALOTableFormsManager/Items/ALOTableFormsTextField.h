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

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSString *cellValue;
@property (nonatomic, strong, readonly) ALOTextFieldTableViewCell *cell;

-(id)initWithLabel:(NSString *)label;
-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder;

-(ALOTextFieldTableViewCell*)cell;

@end
