//
//  ALOTableFormsTextField.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 07.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsTextField.h"

@interface ALOTableFormsTextField () <UITextFieldDelegate>

@end

@implementation ALOTableFormsTextField

-(id)init
{
    if (self = [super init])
    {
    }
    return self;
}

-(id)initWithLabel:(NSString *)label
{
    if (self = [super initWithLabel:label])
    {
    }
    return self;
}

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder
{
    if (self = [self initWithLabel:label])
    {
        _placeholder = placeholder;
    }
    return self;
}

#pragma mark - Cell
-(ALOTextFieldTableViewCell *)cell
{
    ALOTextFieldTableViewCell *cell = [[ALOTextFieldTableViewCell alloc]
                                       initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:self.reuseId];
    cell.textLabel.text = self.label;
    cell.textField.delegate = self;
    cell.textField.placeholder = self.placeholder;
    return cell;
}

#pragma mark - Text field
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.cellValue = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
