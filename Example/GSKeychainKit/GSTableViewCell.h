//
//  GSTableViewCell.h
//  GSKeychainKit
//
//  Created by 沈龙 on 2016/12/13.
//  Copyright © 2016年 shenlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSTableViewCell : UITableViewCell

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, copy) void (^onButtonClick)(void);

@end
