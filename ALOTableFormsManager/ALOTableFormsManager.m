//
//  ALOTableFormsManager.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 04.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsManager.h"

@interface ALOTableFormsManager ()

@property (nonatomic, strong) NSMutableArray *mutableSections;

@end

@implementation ALOTableFormsManager

-(id)init
{
    @throw [NSException exceptionWithName:NSGenericException reason:@"Don't use init, use initWithTableView:" userInfo:nil];
    return nil;
}

- (id)initWithTableView:(UITableView*)tableView
{
    if (self = [super init])
    {
        _tableView = tableView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _mutableSections = [NSMutableArray new];

        // default parameters
        self.cellStyle = UITableViewCellStyleDefault;
    }
    return self;
}

-(void)dealloc
{
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
}

#pragma mark - Properties
- (NSArray *)sections
{
    return self.mutableSections;
}

#pragma mark - Sections

- (void)addSection:(ALOTableFormsSection *)section
{
    section.formManager = self;
    [self.mutableSections addObject:section];
}

- (void)addSection:(ALOTableFormsSection *)section atIndex:(NSUInteger)index
{
    section.formManager = self;
    [self.mutableSections insertObject:section atIndex:index];
}

-(void)removeSectionAtIndex:(NSUInteger)index
{
    [self.mutableSections removeObjectAtIndex:index];
}

-(void)removeAllSections
{
    [self.mutableSections removeAllObjects];
}

#pragma mark - TableView dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // in first version will be only one section
    return self.sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((ALOTableFormsSection*)self.sections[section]).items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = ((ALOTableFormsSection*)self.sections[indexPath.section]).items[indexPath.row];
    
    if ([item isKindOfClass:[UITableViewCell class]])
    {
        return item;
    }
    else if ([item isKindOfClass:[NSString class]])
    {
        ALOTableFormsItem *cellItem = [[ALOTableFormsItem alloc] initWithLabel:item];
        cellItem.section = (ALOTableFormsSection*)self.sections[indexPath.section];
        return [cellItem cell];
    }
    else if ([item isKindOfClass:[ALOTableFormsItem class]])
    {
        return [item cell];
    }
    
    return nil;
}

#pragma mark - TableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

@end
