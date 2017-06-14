//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import <Foundation/Foundation.h>

@protocol EVEValidMappingKey <NSObject>

- (BOOL)transformValue:(NSObject *)oldValue
               toValue:(NSObject **)newValue
                forKey:(NSString **)key;

@end

@interface NSString (EVEValidMappingKey) <EVEValidMappingKey>

@end