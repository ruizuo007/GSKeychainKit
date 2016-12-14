//
//  GSKeychainManager.h
//  GSKeychainKit
//
//  Created by 沈龙 on 2016/12/12.
//  Copyright © 2016年 shenlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GSKeychainStore;

@interface GSKeychainManager : NSObject {
    @private
    GSKeychainStore *_keychainStore;
}

+ (GSKeychainManager *)sharedManager;

/**
 * 写入与读取用户名
 */
- (void)saveUserName:(NSString *)userName;
- (NSString *)userName;

/**
 * 写入与读取用户名
 */
- (void)saveUserPassword:(NSString *)userPassword;
- (NSString *)userPassword;

@end
