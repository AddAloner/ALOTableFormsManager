//
//  ALOSwitchTableViewCell.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 09.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOSwitchTableViewCell.h"

@implementation ALOSwitchTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UISwitch *switcher = [UISwitch new];
        self.accessoryView = switcher;
        _switcher = switcher;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // you can't select this item!
    if (selected)
        [self setSelected:NO animated:NO];
}

@end
