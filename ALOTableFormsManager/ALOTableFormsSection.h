//
//  ALOTableFormsSection.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 06.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALOTableFormsManager;

@interface ALOTableFormsSection : NSObject

@property (nonatomic, weak) ALOTableFormsManager *formManager;
@property (nonatomic, readonly, strong) NSArray *items;
@property (nonatomic, copy) NSString *title;

- (void)addItem:(id)item;
- (void)addItem:(id)item atIndex:(NSUInteger)index;
- (void)removeItemAtIndex:(NSUInteger)index;
- (void)removeAllItems;

@end
