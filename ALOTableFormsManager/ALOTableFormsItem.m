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
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                             reuseIdentifier:self.reuseId];
    }
    return self;
}

-(id)initWithLabel:(NSString *)label
{
    if (self = [self init])
    {
        _cell.textLabel.text = label;
    }
    return self;
}

#pragma mark - Properties
-(NSString *)reuseId
{
    return @"tableFormsCell";
}

- (void)setLabel:(NSString *)label
{
    self.cell.textLabel.text = label;
}

- (NSString *)label
{
    return self.cell.textLabel.text;
}

@end
