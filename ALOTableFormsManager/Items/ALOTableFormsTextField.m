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

- (instancetype)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder
{
    if (self = [self initWithLabel:label]) {
        _placeholder = placeholder;
    }
    return self;
}

- (instancetype)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSString *)value
{
    if (self = [self initWithLabel:label placeholder:placeholder]) {
        _cellValue = value;
    }
    return self;
}

- (instancetype)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSString *)value changeValueHandler:(void (^)(NSString *))changeValueHandler
{
    if (self = [self initWithLabel:label placeholder:placeholder value:value]) {
        self.changeValueHandler = changeValueHandler;
    }
    return self;
}

#pragma mark - Properties

-(ALOTextFieldTableViewCell *)cell
{
    if (!_cell && self.section.formManager) {
        ALOTextFieldTableViewCell *cell = [[ALOTextFieldTableViewCell alloc]
                                           initWithStyle:self.section.formManager.cellStyle
                                           reuseIdentifier:self.reuseId];
        cell.textLabel.text = self.label;
        cell.textField.placeholder = self.placeholder;
        cell.textField.text = self.cellValue ? self.cellValue : @"";

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textField.inputAccessoryView = self.section.formManager.accessoryView;
        cell.textField.delegate = self;
        _cell = cell;
    }
    return _cell;
}

- (NSString *)reuseId
{
    return NSStringFromClass([ALOTextFieldTableViewCell class]);
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    if (_cell) {
        self.cell.textField.placeholder = placeholder;
    }
}

- (void)setCellValue:(NSString *)cellValue
{
    _cellValue = cellValue;
    if (_cell) {
        self.cell.textField.text = cellValue;
    }
}

#pragma mark - Accessory View

- (BOOL)hasAccessoryNavigation
{
    return YES;
}

- (void)cellWillEditing
{
    [self.cell.textField becomeFirstResponder];
}

#pragma mark - Text field

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _cellValue = self.cell.textField.text;

    if (self.section.formManager.validateOnEdit || !self.isValide) {
        [self validate];
    }
        
    if (self.isValide && self.changeValueHandler) {
        self.changeValueHandler(self.cellValue);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self cellDidEditing];
    return YES;
}

#pragma mark - Accessory View

- (void)didPressedDoneButton:(UIBarButtonItem *)doneButton
{
    [self.cell.textField resignFirstResponder];
}

#pragma mark - Validate

- (BOOL)validate
{
    if (self.isRequred && [self.cellValue isEqual:@""]) {
        
        self.error = [NSString stringWithFormat:NSLocalizedString(@"Field \"%@\" is required", @""), self.label];
        self.isValide = NO;
        
    } else if (self.minLength > 0 && self.cellValue.length < self.minLength) {
        
        self.error = [NSString stringWithFormat:NSLocalizedString(@"Min length for %@ is %i", @""), self.label, self.minLength];
        self.isValide = NO;
        
    } else if (self.maxLength > 0 && self.cellValue.length > self.maxLength) {
        
        self.error = [NSString stringWithFormat:NSLocalizedString(@"Max length for %@ is %i", @""), self.label, self.maxLength];
        self.isValide = NO;
        
    } else {
        
        self.isValide = YES;
        
    }
    return self.isValide;
}

@end
