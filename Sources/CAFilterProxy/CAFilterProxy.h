//
//  CAFilterProxy.h
//  CAFilterBuiltins
//
//  Created by Quentin Fasquel on 03/09/2025.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAFilterProxy : NSProxy

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithTarget:(id)target NS_DESIGNATED_INITIALIZER;

// The proxied Objective‑C object (e.g., a CAFilter instance)
@property (nonatomic, strong, readonly) id target;

#pragma mark - Key-Value Coding (forwarded to target)

- (nullable id)valueForKey:(NSString *)key;
- (void)setValue:(nullable id)value forKey:(NSString *)key;

- (nullable id)valueForKeyPath:(NSString *)keyPath;
- (void)setValue:(nullable id)value forKeyPath:(NSString *)keyPath;

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *, id> *)keyedValues;

// Undefined / nil handling hooks
- (void)setNilValueForKey:(NSString *)key;
- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key;
- (nullable id)valueForUndefinedKey:(NSString *)key;

// Collection KVC helpers
- (NSMutableArray *)mutableArrayValueForKey:(NSString *)key;
- (NSMutableSet *)mutableSetValueForKey:(NSString *)key;
- (NSMutableOrderedSet *)mutableOrderedSetValueForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
