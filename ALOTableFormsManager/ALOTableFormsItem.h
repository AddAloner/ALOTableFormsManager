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
}

- (id)initWithLabel:(NSString *)label;

// structure
@property (nonatomic, strong, readonly) NSString *reuseId;
@property (nonatomic, strong, readonly) UITableViewCell *cell;
@property (nonatomic, weak) ALOTableFormsSection *section;

// cell propeties
@property (nonatomic, copy) NSString *label;

// validation
@property (nonatomic, assign) BOOL isRequred;
@property (nonatomic, copy) NSString *error;
- (BOOL)validate;

@end
