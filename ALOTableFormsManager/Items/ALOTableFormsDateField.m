//
//  ALOTableFormsDateField.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 10.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsDateField.h"
#import "ALOTableFormsManager.h"

@interface ALOTableFormsDateField ()

@property (nonatomic, strong, readonly) ALOTextFieldTableViewCell *cell;

@end


@implementation ALOTableFormsDateField

- (id)init
{
    if (self = [super init])
    {
        UIDatePicker *picker = [UIDatePicker new];
        [picker addTarget:self
                   action:@selector(onDatePicked:)
         forControlEvents:UIControlEventValueChanged];
        _datePicker = picker;
    }
    return self;
}

- (id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSDate *)value
{
    if (self = [super initWithLabel:label placeholder:placeholder])
    {
        _dateCellValue = value;
        if (value != nil)
            _datePicker.date = value;
    }
    return self;
}

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder value:(NSDate *)value changeValueHandler:(void (^)(NSDate *))changeValueHandler
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
        if (self.dateCellValue)
            [self updateTextFieldWithDate:self.dateCellValue];
        cell.textField.inputView = self.datePicker;
    }
    return _cell;
}

-(void)updateTextFieldWithDate:(NSDate*)date
{
    if (self.dateCellValue)
    {
        _datePicker.date = date;
        if (self.dateFormatter)
            self.cell.textField.text = [self.dateFormatter stringFromDate:date];
        if (self.section.formManager.dateFormatter)
            self.cell.textField.text = [self.section.formManager.dateFormatter stringFromDate:date];
        else
            self.cell.textField.text = date.description;
    }
    else
        self.cell.textField.text = @"";
}

-(NSString *)reuseId
{
    return @"dateFieldTableFormsCell";
}

-(void)setDateCellValue:(NSDate *)dateCellValue
{
    _dateCellValue = dateCellValue;
    if (dateCellValue != nil)
        self.datePicker.date = dateCellValue;
}

- (NSDate *)minDate
{
    return self.datePicker.minimumDate;
}

-(void)setMinDate:(NSDate *)minDate
{
    self.datePicker.minimumDate = minDate;
}

- (NSDate *)maxDate
{
    return self.datePicker.maximumDate;
}

-(void)setMaxDate:(NSDate *)maxDate
{
    self.datePicker.maximumDate = maxDate;
}

#pragma mark - Text field
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _dateCellValue = self.datePicker.date;
    [self updateTextFieldWithDate:self.dateCellValue];
    
    if (self.section.formManager.validateOnEdit)
    {
        [self validate];
    }
    
    if (self.isValide && self.changeValueHandler)
        self.changeValueHandler(self.dateCellValue);
}

#pragma mark - DatePicker
-(void)onDatePicked:(UIButton*)button
{
    _dateCellValue = self.datePicker.date;
    [self updateTextFieldWithDate:self.dateCellValue];
}

@end
