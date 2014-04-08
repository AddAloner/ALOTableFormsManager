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

extern NSString *const _reuseId;

@end

@implementation ALOTableFormsItem

-(id)init
{
    if (self = [super init])
    {
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
    if (!_cell)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
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

#pragma mark - Validate
-(BOOL)validate
{
    return YES;
}

@end
