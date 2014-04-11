//
//  ALOTableFormsDateField.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 10.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsDateField.h"
#import "ALOTableFormsManager.h"

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
        if (value)
        {
            _datePicker.date = value;
            if (self.dateFormatter)
                self.cell.textField.text = [self.dateFormatter stringFromDate:value];
            if (self.section.formManager.dateFormatter)
                self.cell.textField.text = [self.section.formManager.dateFormatter stringFromDate:value];
            else
                self.cell.textField.text = value.description;
        }
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
        ALOTextFieldTableViewCell* cell = [super cell];
        cell.textField.inputView = self.datePicker;
    }
    return _cell;
}

-(NSString *)reuseId
{
    return @"dateFieldTableFormsCell";
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

-(NSDate *)dateCellValue
{
    return self.datePicker.date;
}

-(void)setDateCellValue:(NSDate *)dateCellValue
{
    self.datePicker.date = dateCellValue;
}

#pragma mark - DatePicker
-(void)onDatePicked:(UIButton*)button
{
    // update cell textField value
    if (self.dateFormatter)
        self.cell.textField.text = [self.dateFormatter stringFromDate:self.dateCellValue];
    if (self.section.formManager.dateFormatter)
        self.cell.textField.text = [self.section.formManager.dateFormatter stringFromDate:self.dateCellValue];
    else
        self.cell.textField.text = self.dateCellValue.description;
    
    if (self.section.formManager.validateOnEdit)
    {
        [self validate];
    }
    
    if (self.isValide && self.changeValueHandler)
        self.changeValueHandler(self.dateCellValue);
}

@end
