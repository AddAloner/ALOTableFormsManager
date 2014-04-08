//
//  ALOTableFormsSection.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 06.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsSection.h"
#import "ALOTableFormsItem.h"

@interface ALOTableFormsSection ()

@property (nonatomic, readonly, strong) NSMutableArray *mutableItems;
@property (nonatomic, weak) ALOTableFormsSection *section;

@end

@implementation ALOTableFormsSection

-(id)init
{
    if (self = [super init])
    {
        _mutableItems = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Properties
- (NSArray *)items
{
    return self.mutableItems;
}

#pragma mark - Sections
- (void)addItem:(id)item
{
    if ([item isKindOfClass:[ALOTableFormsItem class]])
        ((ALOTableFormsItem*)item).section = self;
    [self.mutableItems addObject:item];
}

-(void)addItem:(id)item atIndex:(NSUInteger)index
{
    if ([item isKindOfClass:[ALOTableFormsItem class]])
        ((ALOTableFormsItem*)item).section = self;
    [self.mutableItems insertObject:item atIndex:index];
}

-(void)removeItemAtIndex:(NSUInteger)index
{
    [self.mutableItems removeObjectAtIndex:index];
}

-(void)removeAllItems
{
    [self.mutableItems removeAllObjects];
}

@end
