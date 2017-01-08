//
//  OrderedDictionary.m
//  MyText
//
//  Created by chenshaoqiu on 2017/1/7.
//  Copyright © 2017年 chenshaoqiu. All rights reserved.
//

#import "OrderedDictionary.h"

@interface OrderedDictionary () {
    @protected
    NSArray *_values;
    NSOrderedSet *_keys;
}
@end

@implementation OrderedDictionary

- (instancetype)init {
    if (self == [super init] && [self isKindOfClass:[OrderedDictionary class]]) {
        _values = [[NSArray alloc] init];
        _keys = [[NSOrderedSet alloc] init];
    }
    return self;
}

-(NSUInteger)count {
    return _keys.count;
}

- (id)objectForKey:(id)aKey {
    NSUInteger index = [_keys indexOfObject:aKey];
    if (index != NSNotFound) {
        return _values[index];
    }
    return nil;
}

- (NSUInteger)indexOfKey:(id)key {
    return [_values indexOfObject:key];
}

-(NSEnumerator *)objectEnumerator {
    return [_values objectEnumerator];
}

-(NSEnumerator *)keyEnumerator{
    return [_keys objectEnumerator];
}

-(NSEnumerator *)reverseKeyEnumerator {
    return [_keys reverseObjectEnumerator];
}

-(NSEnumerator *)reverseObjectEnumerator {
    return [_values reverseObjectEnumerator];
}

@end

@implementation MutableDictionary
#define _mutableValues ((NSMutableArray *)_values)
#define _mutableKeys ((NSMutableOrderedSet *)_keys)

+ (instancetype)dictionaryWithCapacity:(NSUInteger)numItems {
    return [(MutableDictionary *)[self alloc] initWithCapacity:numItems];
}

-(instancetype)init {
    return [self initWithCapacity:0];
}

- (instancetype)initWithCapacity:(NSUInteger)numItems {
    if (self == [super init]) {
        _values = [[NSMutableArray alloc] initWithCapacity:numItems];
        _keys = [[NSMutableOrderedSet alloc] initWithCapacity:numItems];
        NSParameterAssert(_values.count == _keys.count);
    }
    return self;
}

-(instancetype)initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt {
    if (self == [super init]) {
        _values = [[NSMutableArray alloc] initWithObjects:objects count:cnt];
        _keys = [[NSMutableOrderedSet alloc] initWithObjects:keys count:cnt];
        NSParameterAssert(_values.count == _keys.count);
    }
    return self;
}

-(instancetype)initWithObjects:(NSArray *)objects forKeys:(NSArray<id<NSCopying>> *)keys {
    if (self == [super init]) {
        _values = [objects copy];
        _keys = [NSMutableOrderedSet orderedSetWithArray:keys];
        NSParameterAssert(_values.count == _keys.count);
    }
    return self;
}

-(void)setObject:(id)anObject forKey:(id)aKey{
    NSUInteger index = [_keys indexOfObject:aKey];
    if (index != NSNotFound) {
        _mutableValues[index] = anObject;
    }else {
        [_mutableKeys addObject:aKey];
        [_mutableValues addObject:anObject];
    }
}

@end
