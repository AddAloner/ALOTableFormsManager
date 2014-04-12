//
//  ALOTableFormsSwitch.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 09.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsSwitch.h"
#import "ALOTableFormsManager.h"

@implementation ALOTableFormsSwitch

-(id)initWithLabel:(NSString *)label value:(BOOL)value
{
    if (self = [self initWithLabel:label])
    {
        _cellValue = value;
    }
    return self;
}

-(id)initWithLabel:(NSString *)label value:(BOOL)value changeValueHandler:(void (^)(BOOL))changeValueHandler
{
    if (self = [self initWithLabel:label value:value])
    {
        self.changeValueHandler = changeValueHandler;
    }
    return self;
}

-(void)onSwitchChanged
{
    _cellValue = self.cell.switcher.isOn;
    
    if (self.section.formManager.validateOnEdit)
    {
        [self validate];
    }
    
    if (self.isValide && self.changeValueHandler)
        self.changeValueHandler(self.cellValue);
}

- (ALOSwitchTableViewCell *)formCell
{
    return self.cell;
}

#pragma mark - Property
- (UITableViewCell *)cell
{
    if (!_cell && self.section.formManager)
    {
        ALOSwitchTableViewCell *cell = [[ALOSwitchTableViewCell alloc]
                                        initWithStyle:self.section.formManager.cellStyle
                                        reuseIdentifier:self.reuseId];
        cell.textLabel.text = self.label;
        [cell.switcher setOn:self.cellValue];
        [cell.switcher addTarget:self
                          action:@selector(onSwitchChanged)
                forControlEvents:UIControlEventValueChanged];
        
        // disable textField cell selection
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell = cell;
    }
    return _cell;
}

-(NSString *)reuseId
{
    return @"textFieldTableFormsCell";
}

-(void)setCellValue:(BOOL)cellValue
{
    _cellValue = cellValue;
    if (_cell)
        [self.cell.switcher setOn:cellValue];
}

@end
