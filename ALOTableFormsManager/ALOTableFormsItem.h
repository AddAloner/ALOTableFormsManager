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
}

// structure
@property (nonatomic, strong, readonly) NSString *reuseId;
@property (nonatomic, weak) ALOTableFormsSection *section;

// cell propeties
@property (nonatomic, copy) NSString *label;

// validation
@property (nonatomic, assign) BOOL isRequred;
@property (nonatomic, strong, readonly) NSString *error;

- (id)initWithLabel:(NSString *)label;
//- (id)initWithLabel:(NSString *)label changeValueHandler:(void(^)(ALOTableFormsItem *item))changeValueHandler;

// generate cell for this item
- (UITableViewCell*)cell;
- (BOOL)validate;

@end
