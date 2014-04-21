//
//  ALOTableFormsListPicker.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 17.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsListPicker.h"
#import "ALOTableFormsManager.h"

@interface ALOTableFormsListPicker () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation ALOTableFormsListPicker

- (id)init
{
    if (self = [super init])
    {
        UIPickerView *picker = [UIPickerView new];
        picker.delegate = self;
        picker.dataSource = self;
        _picker = picker;
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

- (id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder values:(NSDictionary *)values
{
    if (self = [self initWithLabel:label placeholder:placeholder])
    {
        _values = values;
    }
    return self;
}

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder values:(NSDictionary *)values value:(NSString *)value
{
    if (self = [self initWithLabel:label placeholder:placeholder values:values])
    {
        _cellValue = value;
    }
    return self;
}

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder values:(NSDictionary *)values value:(NSString *)value changeValueHandler:(void (^)(NSString *))changeValueHandler
{
    if (self = [self initWithLabel:label placeholder:placeholder values:values value:value])
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
        ALOAccessoryTableViewCell *cell = [[ALOAccessoryTableViewCell alloc]
                                           initWithStyle:UITableViewCellStyleValue1
                                           reuseIdentifier:self.reuseId];
        cell.textLabel.text = self.label;
        if (self.cellValue)
        {
            // TODO set color for placeholder
            cell.detailTextLabel.text = self.cellValue;
        }
        else if (self.placeholder)
        {
            // TODO set color for text
            cell.detailTextLabel.text = self.placeholder;
        }
        
        // disable textField cell selection
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textField.inputView = self.picker;
        cell.textField.inputAccessoryView = self.section.formManager.accessoryView;
        cell.textField.delegate = self;
        _cell = cell;
    }
    return _cell;
}

-(NSString *)reuseId
{
    return @"accessoryTableFormsCell";
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    if (_cell && !self.cellValue)
        self.cell.detailTextLabel.text = placeholder;
}

-(void)setCellValue:(NSString *)cellValue
{
    _cellValue = cellValue;
    if (_cell)
    {
        self.cell.detailTextLabel.text = [self.values objectForKey:cellValue];
    }
}

#pragma mark - Accessory View
-(BOOL)hasAccessoryNavigation
{
    return YES;
}

-(void)cellWillEditing
{
    if (self.cellValue)
    {
        NSUInteger selectedIndex = [[self.values allKeys] indexOfObject:self.cellValue];
        if (selectedIndex != NSNotFound)
            [self.picker selectRow:selectedIndex inComponent:0 animated:NO];
    }
    
    [self.cell.textField becomeFirstResponder];
}

#pragma mark - Text field
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // get selected value from picker
    self.cellValue = [self.values allKeys][[self.picker selectedRowInComponent:0]];
    
    if (self.section.formManager.validateOnEdit || !self.isValide)
    {
        [self validate];
    }
    if (self.isValide && self.changeValueHandler)
        self.changeValueHandler(self.cellValue);
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

#pragma mark - PickerView DataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.values count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.values allValues][row];
}

#pragma mark PickerView Delegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.cellValue = [self.values allKeys][row];
}

@end
