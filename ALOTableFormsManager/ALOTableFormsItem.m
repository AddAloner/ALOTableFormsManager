//
//  ALOTableFormsItem.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 07.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsItem.h"
#import "ALOTableFormsSection.h"
#import "ALOTableFormsManager.h"

@interface ALOTableFormsItem ()

@end

@implementation ALOTableFormsItem

-(id)init
{
    if (self = [super init])
    {
        _isValide = YES;
    }
    return self;
}

-(id)initWithLabel:(NSString *)label
{
    if (self = [self init])
    {
        _label = label;
    }
    return self;
}

#pragma mark - Properties
- (UITableViewCell *)cell
{
    // cell can initialized only include in section of formManager
    if (!_cell && self.section.formManager)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:self.section.formManager.cellStyle
                                                       reuseIdentifier:self.reuseId];
        cell.textLabel.text = self.label;
        _cell = cell;
    }
    
    return _cell;
}

-(NSString *)reuseId
{
    return @"tableFormsCell";
}

-(void)setLabel:(NSString *)label
{
    _label = label;
    if (_cell)
        self.cell.textLabel.text = label;
}

-(UIColor *)invalideBackgroundColor
{
    if (!_invalideBackgroundColor)
        _invalideBackgroundColor = [UIColor colorWithRed:1.f green:0.9f blue:0.9f alpha:1.f];
    
    return _invalideBackgroundColor;
}

-(BOOL)isValide
{
    return _isValide;
}

-(void)setIsValide:(BOOL)isValide
{
    if (_isValide != isValide)
    {
        _isValide = isValide;
        [self updateCellWithValidationState];
    }
}

#pragma mark - Validate
-(BOOL)validate
{
    return YES;
}

-(void)updateCellWithValidationState
{
    if (!_isValide)
    {
        self.cell.backgroundColor = self.invalideBackgroundColor;
    }
    else
    {
        // TODO: change on default cell color
        self.cell.backgroundColor = [UIColor whiteColor];
        self.error = nil;
    }
}

@end
