//
//  ALOTableFormsItem.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 07.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALOTableFormsSection;

@interface ALOTableFormsItem : NSObject {
    @protected
    id _cell;
    BOOL _isValide;
}

- (id)initWithLabel:(NSString *)label;

@property (nonatomic, strong, readonly) UITableViewCell *cell;

// structure
@property (nonatomic, strong, readonly) NSString *reuseId;
@property (nonatomic, weak) ALOTableFormsSection *section;

// cell propeties
@property (nonatomic, copy) NSString *label;

// validation
@property (nonatomic, assign) BOOL isRequred;
@property (nonatomic, assign) BOOL isValide;
@property (nonatomic, copy) NSString *error;
@property (nonatomic, copy) UIColor *invalideBackgroundColor;
- (BOOL)validate;
- (void)updateCellWithValidationState;

// navigation
@property (nonatomic, readonly) BOOL hasAccessoryNavigation;
- (id)previousEditingField;
- (id)nextEditingField;
- (void)cellWillEditing;
- (void)cellDidEditing;

@end
