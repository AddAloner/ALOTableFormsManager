//
//  ALOAccessoryTableViewCell.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 17.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOAccessoryTableViewCell.h"

@implementation ALOAccessoryTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
//    if (selected) {
//        [self.delegate cellSelected];
//    }
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
