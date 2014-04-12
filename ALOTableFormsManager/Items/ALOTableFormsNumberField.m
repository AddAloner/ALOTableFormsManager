//
//  ALOTableFormsNumberField.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 11.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsNumberField.h"
#import "ALOTableFormsManager.h"

@implementation ALOTableFormsNumberField

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSNumber *)value
{
    if (self = [self initWithLabel:label placeholder:placeholder])
    {
        if (value != nil)
        {
            _numberCellValue = value;
            self.cell.textField.text = [value stringValue];
        }
    }
    return self;
}

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSNumber *)value changeValueHandler:(void (^)(NSNumber *))changeValueHandler
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
    if (!_cell)
    {
        ALOTextFieldTableViewCell* cell = super.cell;
        if (self.numberCellValue)
            cell.textField.text = [self.numberCellValue stringValue];
        cell.textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _cell;
}


-(void)setNumberCellValue:(NSNumber *)numberCellValue
{
    _numberCellValue = numberCellValue;
    if (_cell)
        self.cell.textField.text = [numberCellValue stringValue];
}

#pragma mark - Text field
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _numberCellValue = [NSNumber numberWithInt:[self.cell.textField.text intValue]];
    if (self.section.formManager.validateOnEdit || !self.isValide)
    {
        [self validate];
    }
    
    if (self.isValide && self.changeValueHandler)
        self.changeValueHandler(self.numberCellValue);
}

#pragma mark - Validate
- (BOOL)validate
{
    if (self.isRequred && self.numberCellValue != nil)
    {
        self.error = [NSString stringWithFormat:NSLocalizedString(@"Field \"%@\" is required", @""), self.label];
        self.isValide = false;
    }
    else if (self.minValue != nil && self.numberCellValue < self.minValue)
    {
        self.error = [NSString stringWithFormat:NSLocalizedString(@"Min value for %@ is %i", @""), self.label, self.minValue];
        self.isValide = false;
    }
    else if (self.maxValue != nil && self.numberCellValue > self.maxValue)
    {
        self.error = [NSString stringWithFormat:NSLocalizedString(@"Max value for %@ is %i", @""), self.label, self.maxValue];
        self.isValide = false;
    }
    else
    {
        self.isValide = true;
    }
    return self.isValide;
}

@end
