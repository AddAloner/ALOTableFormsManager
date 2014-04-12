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

-(id)initWithLabel:(NSString *)label value:(BOOL)value;
-(id)initWithLabel:(NSString *)label value:(BOOL)value changeValueHandler:(void(^)(BOOL value))changeValueHandler;

@property (nonatomic, strong, readonly) ALOSwitchTableViewCell *cell;
@property (nonatomic, assign) BOOL cellValue;

// handler
@property (nonatomic, copy) void(^changeValueHandler)(BOOL value);


@end
