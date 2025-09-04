//
//  CAFilterProxy.m
//  CAFilterBuiltins
//
//  Created by Quentin Fasquel on 03/09/2025.
//

#import "CAFilterProxy.h"

@interface CAFilterProxy ()
@property (nonatomic, strong, readwrite) id target;
@end

@implementation CAFilterProxy
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}
#pragma clang diagnostic pop

#pragma mark - Core NSProxy forwarding

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *sig = [self.target methodSignatureForSelector:sel];
    if (!sig) {
        sig = [NSObject instanceMethodSignatureForSelector:@selector(init)];
    }
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    if ([self.target respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.target];
    } else {
        [super forwardInvocation:invocation];
    }
}

#pragma mark - KVC forwarding

- (id)valueForKey:(NSString *)key {
    return [self.target valueForKey:key];
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [self.target setValue:value forKey:key];
}

- (id)valueForKeyPath:(NSString *)keyPath {
    return [self.target valueForKeyPath:keyPath];
}

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath {
    [self.target setValue:value forKeyPath:keyPath];
}

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *, id> *)keyedValues {
    [self.target setValuesForKeysWithDictionary:keyedValues];
}

- (void)setNilValueForKey:(NSString *)key {
    [self.target setNilValueForKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    [self.target setValue:value forUndefinedKey:key];
}

- (id)valueForUndefinedKey:(NSString *)key {
    return [self.target valueForUndefinedKey:key];
}

- (NSMutableArray *)mutableArrayValueForKey:(NSString *)key {
    return [self.target mutableArrayValueForKey:key];
}

- (NSMutableSet *)mutableSetValueForKey:(NSString *)key {
    return [self.target mutableSetValueForKey:key];
}

- (NSMutableOrderedSet *)mutableOrderedSetValueForKey:(NSString *)key {
    return [self.target mutableOrderedSetValueForKey:key];
}

#pragma mark - Introspection / identity mirroring

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [self.target respondsToSelector:aSelector];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [self.target conformsToProtocol:aProtocol];
}

- (Class)class {
    return [self.target class];
}

- (Class)superclass {
    return [self.target superclass];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [self.target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [self.target isMemberOfClass:aClass];
}

- (NSUInteger)hash {
    return [self.target hash];
}

- (BOOL)isEqual:(id)object {
    if (object == self) { return YES; }
    if ([object isKindOfClass:[CAFilterProxy class]]) {
        id otherTarget = [(CAFilterProxy *)object target];
        return [self.target isEqual:otherTarget];
    }
    return [self.target isEqual:object];
}

- (NSString *)description {
    return [self.target description];
}

- (NSString *)debugDescription {
    return [self.target debugDescription];
}

@end
