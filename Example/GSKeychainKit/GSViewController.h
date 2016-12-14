//
//  GSViewController.h
//  GSKeychainKit
//
//  Created by shenlong on 12/12/2016.
//  Copyright (c) 2016 shenlong. All rights reserved.
//

@import UIKit;

@interface GSViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
