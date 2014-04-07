//
//  ALOTableFormsTextField.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 07.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsTextField.h"

@implementation ALOTableFormsTextField

-(id)init
{
    if (self = [super init])
    {
        [self initTextField];
    }
    return self;
}

-(id)initWithLabel:(NSString *)label
{
    if (self = [super initWithLabel:label])
    {
        [self initTextField];
    }
    return self;
}

-(id)initWithLabel:(NSString *)label placeholder:(NSString *)placeholder
{
    if (self = [self initWithLabel:label])
    {
        _textField.placeholder = placeholder;
    }
    return self;
}

-(void)initTextField
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(self.cell.bounds.size.width / 2, 0, self.cell.bounds.size.width / 2 - 15, self.cell.bounds.size.height)];
    textField.textAlignment = NSTextAlignmentRight;
//    textField.delegate = self;
    self.cell.accessoryView = textField;
    _textField = textField;
}

@end
