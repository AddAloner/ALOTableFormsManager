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
    [section addItem:[[ALOTableFormsTextField alloc] initWithLabel:@"Test cell 1"
                                                       placeholder:@"text value"]];
    [section addItem:[[ALOTableFormsTextField alloc] initWithLabel:@"Test cell 2"
                                                       placeholder:@"required value"
                                                             value:@""
                                                changeValueHandler:^(NSString *value) {
                                                    NSLog(@"Test cell 2 value: %@", value);
                                                }]];
    [section addItem:@"Simple string cell"];
    [manager addSection:section];
    self.manager = manager;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
