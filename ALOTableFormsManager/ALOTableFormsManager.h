//
//  ALOTableFormsManager.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 04.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "ALOTableFormsSection.h"
#import "ALOTableFormsNavigationBar.h"
#import "ALOTableFormsTextField.h"
#import "ALOTableFormsDateField.h"
#import "ALOTableFormsSwitch.h"

@interface ALOTableFormsManager : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readonly) NSArray *sections;
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, assign) bool validateOnDone;
@property (nonatomic, assign) bool validateOnEdit;

// for test
@property (nonatomic, strong, readonly) NSMutableArray *cells;

- (id)initWithTableView:(UITableView*)tableView;

- (void)addSection:(ALOTableFormsSection*)section;
- (void)addSection:(ALOTableFormsSection*)section atIndex:(NSUInteger)index;
- (void)removeSectionAtIndex:(NSUInteger)index;
- (void)removeAllSections;

@end
