//
//  GSTableViewCell.m
//  GSKeychainKit
//
//  Created by 沈龙 on 2016/12/13.
//  Copyright © 2016年 shenlong. All rights reserved.
//

#import "GSTableViewCell.h"

@implementation GSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - 

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] initWithFrame:[self fieldRegion]];
    }
    
    if ([_textField superview] == nil) {
        [self.contentView addSubview:_textField];
    }
    
    _textField.layer.borderWidth = 1;
    _textField.layer.borderColor = [UIColor cyanColor].CGColor;
    _textField.layer.masksToBounds = YES;
    _textField.layer.cornerRadius = 5;
    
    return _textField;
}

- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if ([_button superview] == nil) {
        [self.contentView addSubview:_button];
    }
    
    _button.backgroundColor = [UIColor cyanColor];
    _button.frame = [self fieldRegion];
    _button.layer.masksToBounds = YES;
    _button.layer.cornerRadius = 5;
    
    return _button;
}

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:[self fieldRegion]];
    }
    
    if ([_label superview] == nil) {
        [self.contentView addSubview:_label];
    }
    
    _label.frame = [self fieldRegion];
    _label.layer.borderWidth = 1;
    _label.layer.borderColor = [UIColor cyanColor].CGColor;
    _label.layer.masksToBounds = YES;
    _label.layer.cornerRadius = 5;
    
    return _label;
}

- (CGRect)fieldRegion {
    return CGRectMake(40, (self.bounds.size.height - 44) * 0.5, 320 - 40 * 2, 44);
}

#pragma mark -

- (void)onClick:(id)sender {
    if (_onButtonClick) {
        _onButtonClick();
    }
}

@end
