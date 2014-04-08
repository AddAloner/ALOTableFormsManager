//
//  ALOTextFieldTableViewCell.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 08.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTextFieldTableViewCell.h"

@implementation ALOTextFieldTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2, 0, self.bounds.size.width / 2 - 15, self.bounds.size.height)];
        textField.textAlignment = NSTextAlignmentRight;
        self.accessoryView = textField;
        _textField = textField;
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

    // Configure the view for the selected state
}

@end
