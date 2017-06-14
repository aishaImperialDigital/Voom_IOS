
//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import <Foundation/Foundation.h>
#import "EVEValidMappingKey.h"

@interface NSData (EVEValidMappingKey)

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key usingEncoding:(NSStringEncoding)stringEncoding allowLossy:(BOOL)lossy;

// convenience method
+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key usingEncoding:(NSStringEncoding)stringEncoding;

@end