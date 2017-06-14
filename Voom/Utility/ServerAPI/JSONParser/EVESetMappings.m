//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import "EVESetMappings.h"

@interface EVESetMappings : NSObject <EVEValidMappingKey>

@property (nonatomic, copy) NSString *key;

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key;

@end


@implementation EVESetMappings
@synthesize key = _key;

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key {
    EVESetMappings *map = [[EVESetMappings alloc] init];
    map.key = key;
    return map;
}


- (BOOL)transformValue:(NSObject *)oldValue
               toValue:(NSObject **)newValue
                forKey:(NSString **)key {

    if ([oldValue isKindOfClass:[NSArray class]]) {
        
        *newValue = [NSSet setWithArray:(NSArray *)oldValue];
        *key      = self.key;

        return YES;

    } else if ([oldValue isKindOfClass:[NSNull class]]) {
        
        *newValue = nil;
        *key      = self.key;
        
        return YES;
    }
    
    return NO;
}

@end


#pragma mark -

@implementation NSSet (EVEValidMappingKey)

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key {
    return [EVESetMappings mappingWithKey:key];
}

@end
