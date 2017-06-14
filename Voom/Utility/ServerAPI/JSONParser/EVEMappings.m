
//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import "EVEMappings.h"
#import "NSObject+EVEObjectMapping.h"

@interface EVEMappings : NSObject <EVEValidMappingKey>

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSMutableDictionary *mapping;
@property (nonatomic, unsafe_unretained) Class targetClass;

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)aKey
                             targetClass:(Class)aClass
                                 mapping:(NSMutableDictionary *)aMapping;

@end

@implementation EVEMappings
@synthesize key = _key, mapping, targetClass;

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)aKey targetClass:(Class)aClass mapping:(NSMutableDictionary *)aMapping {
    EVEMappings *obj = [[EVEMappings alloc] init];
    obj.key         = aKey;
    obj.mapping     = [aMapping mutableCopy];
    obj.targetClass = aClass;
    return obj;
}

- (void)dealloc {
    self.targetClass = nil;
}

- (BOOL)transformValue:(NSObject *)oldValue
               toValue:(NSObject **)newValue
                forKey:(NSString **)key {
    
    if ([oldValue isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in (NSArray *)oldValue) {
            id obj = [self.targetClass objectFromJSONObject:dict mapping:self.mapping];
            [array addObject:obj];
        }

        *newValue = array;
        *key      = self.key;

        return YES;

    } else if ([oldValue isKindOfClass:[NSDictionary class]]) {
        id obj = [self.targetClass objectFromJSONObject:(NSDictionary *)oldValue mapping:self.mapping];
        
        *newValue = obj;
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

@implementation NSObject (EVEValidMappingKey)

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key mapping:(NSMutableDictionary *)mapping {
    return [EVEMappings mappingWithKey:key targetClass:[self class] mapping:mapping];
}

@end
