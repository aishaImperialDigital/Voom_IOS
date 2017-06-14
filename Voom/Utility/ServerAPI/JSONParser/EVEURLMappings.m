//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import "EVEURLMappings.h"

@interface EVEURLMappings : NSObject <EVEValidMappingKey>

@property (nonatomic, copy) NSString *key;

@end

@implementation EVEURLMappings

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key
{
    EVEURLMappings *map = [[EVEURLMappings alloc] init];
    map.key = key;
    return map;
}


- (BOOL)transformValue:(NSObject *)oldValue
               toValue:(NSObject **)newValue
                forKey:(NSString **)key {
    
    if ([oldValue isKindOfClass:[NSString class]]) {
        
        NSURL *url = [NSURL URLWithString:(NSString *)oldValue];
        *newValue = url;
        *key      = self.key;
        
        return (url != nil);
        
    } else if ([oldValue isKindOfClass:[NSNull class]]) {
        
        *newValue = nil;
        *key      = self.key;
        
        return YES;
    }
    
    return NO;
}

@end

@implementation NSURL (EVEURLMappings)

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key
{
    return [EVEURLMappings mappingWithKey:key];
}

@end
