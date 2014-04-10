//
//  ALOTableFormsSwitch.h
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 09.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsItem.h"
#import "ALOSwitchTableViewCell.h"

@interface ALOTableFormsSwitch : ALOTableFormsItem

@property (nonatomic, assign) BOOL cellValue;
@property (nonatomic, strong, readonly) ALOSwitchTableViewCell *cell;

// handler
@property (nonatomic, copy) void(^changeValueHandler)(BOOL value);


-(id)initWithLabel:(NSString *)label value:(BOOL)value;
-(id)initWithLabel:(NSString *)label value:(BOOL)value changeValueHandler:(void(^)(BOOL value))changeValueHandler;

@end
