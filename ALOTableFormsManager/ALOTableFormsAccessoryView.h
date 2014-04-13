//
//  ALOTableFormsAccessoryView.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 12.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALOTableFormsAccessoryView;

@protocol ALOTableFormsAccessoryViewDelegate

@optional
- (void)didPressedDoneButton:(UIBarButtonItem*)doneButton;
- (void)accessoryView:(ALOTableFormsAccessoryView*)view didPressedPreviousButton:(UIBarButtonItem*)previousButton;
- (void)accessoryView:(ALOTableFormsAccessoryView*)view didPressedNextButton:(UIBarButtonItem*)nextButton;

@end

@interface ALOTableFormsAccessoryView : UIToolbar

- (id)initWithDelegate:(id<ALOTableFormsAccessoryViewDelegate>)delegate;

@property (nonatomic, strong, readonly) UIBarButtonItem *nextButton;
@property (nonatomic, strong, readonly) UIBarButtonItem *previousButton;
@property (nonatomic, weak) id actionDelegate;

@end
