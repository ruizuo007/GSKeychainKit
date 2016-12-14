//
//  GSKeychainManager.m
//  GSKeychainKit
//
//  Created by 沈龙 on 2016/12/12.
//  Copyright © 2016年 shenlong. All rights reserved.
//

#import "GSKeychainManager.h"
#import <GSKeychainKit/GSKeychainStore.h>

static GSKeychainManager *instance = nil;

@implementation GSKeychainManager

+ (GSKeychainManager *)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[GSKeychainManager alloc] init];
    });
    
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _keychainStore = [GSKeychainStore keyChainStore];
    }
    
    return self;
}

- (void)saveUserName:(NSString *)userName {
    if ([userName length] <= 0) {
        return;
    }
    
    [GSKeychainStore setString:userName forKey:[self keyForStoreItem:@"userName"]];
}

- (NSString *)userName {
    return [GSKeychainStore stringForKey:[self keyForStoreItem:@"userName"]];
}

#pragma mark -

- (void)saveUserPassword:(NSString *)userPassword {
    if ([userPassword length] <= 0) {
        return;
    }
    
    [GSKeychainStore setString:userPassword forKey:[self keyForStoreItem:@"userPassword"]];
}

- (NSString *)userPassword {
    return [GSKeychainStore stringForKey:[self keyForStoreItem:@"userPassword"]];
}

#pragma mark - 

- (NSString *)keyForStoreItem:(NSString *)storeItem {
    if ([storeItem length] <= 0) {
        return nil;
    }
    
    NSString *bundleIdt = [[NSBundle mainBundle] bundleIdentifier];
    NSString *key = [NSString stringWithFormat:@"%@-%@", bundleIdt, storeItem];
    
    return key;
}

@end
