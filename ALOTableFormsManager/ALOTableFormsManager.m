//
//  ALOTableFormsManager.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 04.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOTableFormsManager.h"

@interface ALOTableFormsManager ()

@end

@implementation ALOTableFormsManager

- (id)initWithTableView:(UITableView*)tableView
{
    if (self = [super init])
    {
        _tableView = tableView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        // for test
        self->_cells = [[NSMutableArray alloc] initWithCapacity:10];
        [self->_cells addObject:@"Test cell 1"];
        [self->_cells addObject:@"Test cell 2"];
    }
    return self;
}

#pragma mark - TableView dataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // in first version will be only one section
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = self.cells[indexPath.row];
    return cell;
}

#pragma mark - TableView delegate
@end
