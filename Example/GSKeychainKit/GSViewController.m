//
//  GSViewController.m
//  GSKeychainKit
//
//  Created by shenlong on 12/12/2016.
//  Copyright (c) 2016 shenlong. All rights reserved.
//

#import "GSViewController.h"
#import "GSTableViewCell.h"
#import "GSKeychainManager.h"

@interface GSViewController () {
    NSArray *_cellContents;
}

@end

@implementation GSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cellContents = @[
                      @[
                        @{
                          @"class": @"textfield",
                          @"placeholder": @"user name"
                          },
                        @{
                          @"class": @"textfield",
                          @"placeholder": @"user password"
                          }
                        ],
                      @[
                        @{
                          @"class": @"button",
                          @"title": @"submit"
                          }
                        ],
                      @[
                        @{
                          @"class": @"label",
                          },
                        @{
                          @"class": @"label",
                          }
                        ],
                      @[
                        @{
                          @"class": @"button",
                          @"title": @"load"
                          }
                        ]
                      ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_cellContents count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_cellContents objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GSTableViewCell"];
    
    NSDictionary *dic = [[_cellContents objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    if ([dic[@"class"] isEqualToString:@"textfield"]) {
        cell.textField.text = @"";
        cell.textField.placeholder = dic[@"placeholder"];
    }
    if ([dic[@"class"] isEqualToString:@"label"]) {
        cell.label.text = @"";
    }
    if ([dic[@"class"] isEqualToString:@"button"]) {
        [cell.button setTitle:dic[@"title"] forState:UIControlStateNormal];
        if (indexPath.section == 1) {
            cell.onButtonClick = ^{
                GSTableViewCell *c = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
                [[GSKeychainManager sharedManager] saveUserName:c.textField.text];
                c = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
                [[GSKeychainManager sharedManager] saveUserPassword:c.textField.text];
            };
        } else if (indexPath.section == 3) {
            cell.onButtonClick = ^{
                GSTableViewCell *c = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
                c.label.text = [[GSKeychainManager sharedManager] userName];
                c = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:2]];
                c.label.text = [[GSKeychainManager sharedManager] userPassword];
            };
        }
    }
    
    return cell;
}

#define GSTablewViewCellHeight 60.
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return GSTablewViewCellHeight;
}

@end
