//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import <UIKit/UIKit.h>
#import "EVEDataMappings.h"
#import "EVEDateMappings.h"
#import "EVEMappings.h"
#import "EVESetMappings.h"
#import "EVEURLMappings.h"

@protocol EVEValidJSONResponse <NSObject>
@end

@interface NSArray () <EVEValidJSONResponse>
@end

@interface NSDictionary () <EVEValidJSONResponse>
@end

@interface NSURL () <EVEValidJSONResponse>
@end


@interface NSObject (EVEObjectMapping)

- (void)setValueFromDictionary:(NSDictionary *)dict mapping:(NSDictionary *)mapping;

+ (id)objectFromJSONObject:(id <EVEValidJSONResponse>)object mapping:(NSDictionary *)mapping;

@end


@interface NSObject (EVEObjectMappingSubclasses)

// Override in subclasses if needed
- (void)didMapObjectFromJSON:(id<EVEValidJSONResponse>)object;

- (void)didFailedWhenMappingValue:(NSObject *)value toKey:(NSString *)key originalKey:(NSString *)originalKey;

@end


#pragma mark -

@interface NSObject (EVEValidMappingValue)

- (void)configureSelfToObject:(NSObject *)object forKey:(NSString *)key;
- (BOOL)isValidMappingValue;

@end

@interface NSNull (EVEValidMappingValue)

- (void)configureSelfToObject:(NSObject *)object forKey:(NSString *)key;

@end
