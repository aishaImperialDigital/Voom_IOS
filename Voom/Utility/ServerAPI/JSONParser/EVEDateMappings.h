
//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import <Foundation/Foundation.h>
#import "EVEValidMappingKey.h"

@interface NSDate (EVEValidMappingKey)


+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key dateFormatString:(NSString *)dateFormatString;


+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key dateFormatter:(NSDateFormatter *)dateFormatter;


+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key divisorForSeconds:(float)divisorForSeconds;

@end
