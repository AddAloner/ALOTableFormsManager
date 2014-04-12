//
//  ALOTableFormsTextField.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 07.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsTextField.h"
#import "ALOTableFormsManager.h"

@interface ALOTableFormsTextField () <UITextFieldDelegate>

@end

@implementation ALOTableFormsTextField

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder
{
    if (self = [self initWithLabel:label])
    {
        _placeholder = placeholder;
    }
    return self;
}

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSString *)value
{
    if (self = [self initWithLabel:label placeholder:placeholder])
    {
        _cellValue = value;
    }
    return self;
}

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSString *)value changeValueHandler:(void (^)(NSString *))changeValueHandler
{
    if (self = [self initWithLabel:label placeholder:placeholder value:value])
    {
        self.changeValueHandler = changeValueHandler;
    }
    return self;
}

#pragma mark - Properties
-(ALOTextFieldTableViewCell *)cell
{
    if (!_cell && self.section.formManager)
    {
        ALOTextFieldTableViewCell *cell = [[ALOTextFieldTableViewCell alloc]
                                           initWithStyle:self.section.formManager.cellStyle
                                           reuseIdentifier:self.reuseId];
        cell.textLabel.text = self.label;
        cell.textField.placeholder = self.placeholder;
        cell.textField.text = self.cellValue ? self.cellValue : @"";

        // disable textField cell selection
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textField.delegate = self;
        _cell = cell;
    }
    return _cell;
}

-(NSString *)reuseId
{
    return @"textFieldTableFormsCell";
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    if (_cell)
        self.cell.textField.placeholder = placeholder;
}

-(void)setCellValue:(NSString *)cellValue
{
    _cellValue = cellValue;
    if (_cell)
        self.cell.textField.text = cellValue;
}

#pragma mark - Text field
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _cellValue = self.cell.textField.text;

    if (self.section.formManager.validateOnEdit || !self.isValide)
    {
        [self validate];
    }
        
    if (self.isValide && self.changeValueHandler)
        self.changeValueHandler(self.cellValue);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - Validate
- (BOOL)validate
{
    if (self.isRequred && [self.cellValue isEqual:@""])
    {
        self.error = [NSString stringWithFormat:NSLocalizedString(@"Field \"%@\" is required", @""), self.label];
        self.isValide = false;
    }
    else if (self.minLength > 0 && self.cellValue.length < self.minLength)
    {
        self.error = [NSString stringWithFormat:NSLocalizedString(@"Min length for %@ is %i", @""), self.label, self.minLength];
        self.isValide = false;
    }
    else if (self.maxLength > 0 && self.cellValue.length > self.maxLength)
    {
        self.error = [NSString stringWithFormat:NSLocalizedString(@"Max length for %@ is %i", @""), self.label, self.maxLength];
        self.isValide = false;
    }
    else
    {
        self.isValide = true;
    }
    return self.isValide;
}

@end
