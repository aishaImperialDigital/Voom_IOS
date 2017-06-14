//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import <Foundation/Foundation.h>
#import "EVEValidMappingKey.h"

@interface NSURL (EVEValidMappingKey)

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key;

@end
