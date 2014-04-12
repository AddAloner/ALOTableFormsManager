//
//  ALOAccessoryView.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 12.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALOAccessoryViewDelegate
@end

@protocol ALOAccessoryViewDataSource

@required
- (NSInteger)numberOfTextFields;
- (UITextField*)fieldForRowAtIndex:(NSInteger)index;

@end

@interface ALOAccessoryView : UIToolbar

@property (nonatomic, weak) id<ALOAccessoryViewDelegate> delegate;
@property (nonatomic, weak) id<ALOAccessoryViewDataSource> dataSource;

@end
