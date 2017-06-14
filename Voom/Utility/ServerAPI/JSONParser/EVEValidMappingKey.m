//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import "EVEValidMappingKey.h"

@implementation NSString (EVEValidMappingKey)

- (BOOL)transformValue:(NSObject *)oldValue
               toValue:(NSObject **)newValue
                forKey:(NSString **)key {

    *key        = self;
    *newValue   = oldValue;
    
    return YES;
}

@end