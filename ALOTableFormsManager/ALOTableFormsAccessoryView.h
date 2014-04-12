//
//  ALOTableFormsAccessoryView.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 12.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALOTableFormsAccessoryViewDelegate

@required
- (void)didPressedDone;
@end

@protocol ALOTableFormsAccessoryViewDataSource

@required
- (NSInteger)numberOfTextFields;
- (UITextField*)fieldForRowAtIndex:(NSInteger)index;

@end

@interface ALOTableFormsAccessoryView : UIToolbar

@property (nonatomic, weak) id<ALOTableFormsAccessoryViewDelegate> delegate;
@property (nonatomic, weak) id<ALOTableFormsAccessoryViewDataSource> dataSource;

@end
