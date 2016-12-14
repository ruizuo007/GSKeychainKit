//
//  GSKeychainStore.h
//  Pods
//
//  Created by 沈龙 on 2016/12/12.
//
//

#import <Foundation/Foundation.h>

@interface GSKeychainStore : NSObject

@property (nonatomic, readonly) NSString *service;
@property (nonatomic, readonly) NSString *accessGroup;

///#### 生成对象的便捷方法 ####///

+ (GSKeychainStore *)keyChainStore;
+ (GSKeychainStore *)keyChainStoreWithService:(NSString *)service;
+ (GSKeychainStore *)keyChainStoreWithService:(NSString *)service accessGroup:(NSString *)accessGroup;

///#### 初始化方法 ####///

- (instancetype)init;
- (instancetype)initWithService:(NSString *)service;
- (instancetype)initWithService:(NSString *)service accessGroup:(NSString *)accessGroup;

///#### 以下方法直接操作Keychain中的数据 ####///

+ (NSString *)stringForKey:(NSString *)key;
+ (NSString *)stringForKey:(NSString *)key service:(NSString *)service;
+ (NSString *)stringForKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key service:(NSString *)service;
+ (BOOL)setString:(NSString *)value forKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup;

+ (NSData *)dataForKey:(NSString *)key;
+ (NSData *)dataForKey:(NSString *)key service:(NSString *)service;
+ (NSData *)dataForKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key service:(NSString *)service;
+ (BOOL)setData:(NSData *)data forKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup;

+ (BOOL)removeItemForKey:(NSString *)key;
+ (BOOL)removeItemForKey:(NSString *)key service:(NSString *)service;
+ (BOOL)removeItemForKey:(NSString *)key service:(NSString *)service accessGroup:(NSString *)accessGroup;
+ (BOOL)removeAllItems;
+ (BOOL)removeAllItemsForService:(NSString *)service;
+ (BOOL)removeAllItemsForService:(NSString *)service accessGroup:(NSString *)accessGroup;

///#### 以下方法操作尚未提交到Keychain的缓存数据 ####///

- (void)setString:(NSString *)string forKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;

- (void)setData:(NSData *)data forKey:(NSString *)key;
- (NSData *)dataForKey:(NSString *)key;

- (void)removeItemForKey:(NSString *)key;
- (void)removeAllItems;

/**
 * 同步缓存的数据到Keychain
 */
- (void)synchronize;

@end
