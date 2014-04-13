//
//  ALOTableFormsAccessoryView.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 12.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsAccessoryView.h"

@implementation ALOTableFormsAccessoryView

// back/forward buttons space
static NSInteger buttonsSpaceWidth = 10.f;

- (id)init
{
    if (self = [self initWithFrame:CGRectMake(0.f, 0.f, 320.f, 44.f)])
    {
        self.barStyle = UIBarStyleDefault;
        [self sizeToFit];
        
        UIBarButtonItem *previousButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"previousButton"]
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(didPressedPreviousButton:)];
        
        UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nextButton"]
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(didPressedNextButton:)];
        
        UIBarButtonItem *buttonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                     target:nil
                                                                                     action:nil];
        [buttonSpace setWidth:buttonsSpaceWidth];
        
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:nil
                                                                                   action:nil];
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                    target:self
                                                                                    action:@selector(didPressedDoneButton:)];
        NSArray *buttons = [NSArray
                            arrayWithObjects:previousButton, buttonSpace, nextButton, flexSpace, doneButton, nil];
        
        [self setItems:buttons animated:YES];
        
        _nextButton = nextButton;
        _previousButton = previousButton;
    }
    return self;
}

- (id)initWithDelegate:(id<ALOTableFormsAccessoryViewDelegate>)delegate
{
    if (self = [self init])
    {
        _actionDelegate = delegate;
    }
    return self;
}

- (void)didPressedDoneButton:(UIBarButtonItem*)doneButton
{
    [self.actionDelegate didPressedDoneButton:doneButton];
}

- (void)didPressedPreviousButton:(UIBarButtonItem*)previousButton
{
    [self.actionDelegate accessoryView:self didPressedPreviousButton:previousButton];
}

- (void)didPressedNextButton:(UIBarButtonItem*)nextButton
{
    [self.actionDelegate accessoryView:self didPressedNextButton:nextButton];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
