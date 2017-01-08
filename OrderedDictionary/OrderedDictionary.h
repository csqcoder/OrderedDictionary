//
//  OrderedDictionary.h
//  MyText
//
//  Created by chenshaoqiu on 2017/1/7.
//  Copyright © 2017年 chenshaoqiu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface OrderedDictionary<__covariant KeyType, __covariant ObjectType> : NSDictionary <KeyType, ObjectType>
- (NSEnumerator<KeyType> *)reverseKeyEnumerator;
- (NSEnumerator<ObjectType> *)reverseObjectEnumerator;
@end

@interface MutableDictionary<KeyType, ObjectType> : OrderedDictionary <KeyType, ObjectType>

- (void)setObject:(ObjectType)anObject forKey:(KeyType)aKey;

@end
NS_ASSUME_NONNULL_END
