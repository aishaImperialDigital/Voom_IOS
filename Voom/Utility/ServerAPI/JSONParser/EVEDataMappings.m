
//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import "EVEDataMappings.h"


@interface EVEDataMappings : NSObject <EVEValidMappingKey>

@property (nonatomic, copy) NSString *key;
@property (nonatomic) NSStringEncoding stringEncoding;
@property (nonatomic) BOOL allowLossy;

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key usingEncoding:(NSStringEncoding)stringEncoding allowLossy:(BOOL)lossy;

@end


@implementation EVEDataMappings
@synthesize key = _key, stringEncoding, allowLossy;

/*
 Mapping that allows you to specify NSData the parameters.
 */
+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key usingEncoding:(NSStringEncoding)stringEncoding allowLossy:(BOOL)lossy {
    EVEDataMappings *dataMapping = [[EVEDataMappings alloc] init];
    dataMapping.stringEncoding = stringEncoding;
    dataMapping.key = key;
    dataMapping.allowLossy = lossy;
    return dataMapping;
}



- (BOOL)transformValue:(NSObject *)oldValue
               toValue:(NSObject **)newValue
                forKey:(NSString **)key {

    if ([oldValue isKindOfClass:[NSString class]]) {
        *newValue   = [(NSString *)oldValue dataUsingEncoding:self.stringEncoding
                             allowLossyConversion:self.allowLossy];
        *key        = self.key;

        return YES;

    } else if ([oldValue isKindOfClass:[NSNull class]]) {
        
        *newValue = nil;
        *key      = self.key;
        
        return YES;
    }
    
    return NO;
}

@end



@implementation NSData (EVEValidMappingKey)

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key usingEncoding:(NSStringEncoding)stringEncoding allowLossy:(BOOL)lossy {
    return [EVEDataMappings mappingWithKey:key usingEncoding:stringEncoding allowLossy:lossy];
}

/*
 Convenience method to match [NSString dataUsingEncoding:allowLossyConversion:] behavior, which is not lossy.
 Reference: https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/doc/uid/20000154-dataUsingEncoding_
 */
+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key usingEncoding:(NSStringEncoding)stringEncoding {
    return [EVEDataMappings mappingWithKey:key usingEncoding:stringEncoding allowLossy:NO];
}


@end

