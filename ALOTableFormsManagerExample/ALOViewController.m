//
//  ALOViewController.m
//  ALOTableFormsManagerExample
//
//  Created by Alexey Yachmenov on 04.04.14.
//  Copyright (c) 2014 Alexey Yachmenov. All rights reserved.
//

#import "ALOViewController.h"
#import "ALOTableFormsManager.h"

@interface ALOViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) ALOTableFormsManager *manager;

@end

@implementation ALOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // init date formatter
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.timeStyle = NSDateFormatterShortStyle;
    formatter.dateStyle = NSDateFormatterShortStyle;
    
    ALOTableFormsManager *manager = [[ALOTableFormsManager alloc] initWithTableView:self.tableView];
    ALOTableFormsSection *section = [ALOTableFormsSection new];
    
    manager.validateOnEdit = YES;
    manager.dateFormatter = formatter;
    
    // simple text cell
    [section addItem:@"Simple string cell"];
    
    // simple switch item with cellback
    [section addItem:[[ALOTableFormsSwitch alloc] initWithLabel:@"Switch cell"
                                                          value:YES
                                             changeValueHandler:^(BOOL value) {
                                                 NSLog(@"Switch cell value: %i", value);
                                             }]];
    
    // simple text field
    [section addItem:[[ALOTableFormsTextField alloc] initWithLabel:@"String cell 1"
                                                       placeholder:@"text value"]];

    // item with validate and other futures
    ALOTableFormsTextField *item2 = [[ALOTableFormsTextField alloc] initWithLabel:@"String cell 2"
                                                                      placeholder:@"required value"
                                                                            value:@""
                                                               changeValueHandler:^(NSString *value) {
                                                                   NSLog(@"String cell 2 value: %@", value);
                                                               }];
    item2.isRequred = YES;
    [section addItem:item2];

    // simple date field item with cellback
    [section addItem:[[ALOTableFormsNumberField alloc] initWithLabel:@"Number cell"
                                                         placeholder:@"input number"
                                                               value:nil
                                                  changeValueHandler:^(NSNumber *value) {
                                                      NSLog(@"Number cell value: %i", [value intValue]);
                                                  }]];
    
    // simple date field item with cellback
    [section addItem:[[ALOTableFormsDateField alloc] initWithLabel:@"Date cell"
                                                       placeholder: @"input date"
                                                             value:nil
                                                changeValueHandler:^(NSDate *value) {
                                                    NSLog(@"Date cell value: %@", value.description);
                                                }]];
    
    // list picker item with cellback
    [section addItem:[[ALOTableFormsListPicker alloc] initWithLabel:@"List cell"
                                                        placeholder:@"select item"
                                                             values:@{@"1": @"First item",
                                                                      @"2": @"Second item",
                                                                      @"3": @"Third item",
                                                                      @"4": @"Last item",
                                                                      }
                                                              value:nil
                                                 changeValueHandler:^(NSString *value) {
                                                     NSLog(@"List cell value: %@", value);
                                                 }]];
    
    [manager addSection:section];
    self.manager = manager;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
