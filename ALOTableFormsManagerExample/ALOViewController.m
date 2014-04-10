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
	// Do any additional setup after loading the view, typically from a nib.
    
    ALOTableFormsManager *manager = [[ALOTableFormsManager alloc] initWithTableView:self.tableView];
    ALOTableFormsSection *section = [ALOTableFormsSection new];
    
    manager.validateOnEdit = YES;
    
    // simple text cell
    [section addItem:@"Simple string cell"];
    
    // simple text field
    [section addItem:[[ALOTableFormsTextField alloc] initWithLabel:@"Test cell 1"
                                                       placeholder:@"text value"]];
    
    // item with validate and other futures
    ALOTableFormsTextField *item2 = [[ALOTableFormsTextField alloc] initWithLabel:@"TestCell 2"
                                                                      placeholder:@"required value"
                                                                            value:@""
                                                               changeValueHandler:^(NSString *value) {
                                                                   NSLog(@"Test cell 2 value: %@", value);
                                                               }];
    item2.isRequred = YES;
    [section addItem:item2];

    // simple switch item with cellback
    [section addItem:[[ALOTableFormsSwitch alloc] initWithLabel:@"Switch cell"
                                                          value:YES
                                             changeValueHandler:^(BOOL value) {
                                                 NSLog(@"Switch cell value: %i", value);
                                             }]];

    // simple date field item with cellback
    [section addItem:[[ALOTableFormsDateField alloc] initWithLabel:@"Date cell"
                                                       placeholder: @"input date"
                                                             value:[NSDate date]
                                                changeValueHandler:^(NSDate *value) {
                                                    NSLog(@"Switch cell value: %@", value.description);
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
