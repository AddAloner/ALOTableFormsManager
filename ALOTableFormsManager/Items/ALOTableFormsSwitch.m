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

- (id)init
{
    if (self = [super init])
    {
        [self.cell.switcher addTarget:self action:@selector(onSwitchChanged) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

-(id)initWithLabel:(NSString *)label value:(BOOL)value
{
    if (self = [self initWithLabel:label])
    {
        [self.cell.switcher setOn:value];
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
    if (self.section.formManager.validateOnEdit)
    {
        [self validate];
    }
    
    if (self.isValide && self.changeValueHandler)
        self.changeValueHandler(self.cellValue);
}

#pragma mark - Property
- (UITableViewCell *)cell
{
    if (!_cell)
    {
        ALOSwitchTableViewCell *cell = [[ALOSwitchTableViewCell alloc]
                                        initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:self.reuseId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell = cell;
    }
    return _cell;
}

-(NSString *)reuseId
{
    return @"textFieldTableFormsCell";
}

-(BOOL)cellValue
{
    return self.cell.switcher.isOn;
}

-(void)setCellValue:(BOOL)cellValue
{
    [self.cell.switcher setOn:cellValue];
}

@end
