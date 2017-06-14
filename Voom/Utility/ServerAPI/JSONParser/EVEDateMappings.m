
//  Copyright (c) 2014 Evento Solutions LLC. All rights reserved.

#import "EVEDateMappings.h"


@interface EVEDateMappings : NSObject <EVEValidMappingKey>

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *dateFormatString;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key dateFormatString:(NSString *)dateFormatString;

@end


// For dates using a date formatter

@interface EVEDateFormatterMappings : NSObject <EVEValidMappingKey>

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSDateFormatter *dateFormatter;

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key dateFormatter:(NSDateFormatter *)dateFormatter;

@end


// For epoch dates in (some fraction) of seconds

@interface EVEDateEpochMappings : NSObject <EVEValidMappingKey>
@property (nonatomic, copy) NSString *key;
@property (nonatomic) NSTimeInterval divisorForSeconds;
// You must specify the fraction of seconds you want: 1==seconds, 1000==milliseconds, etc.
+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key divisorForSeconds:(NSTimeInterval)divisorForSeconds;

@end



@implementation EVEDateMappings
@synthesize dateFormatString, key = _key;

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key dateFormatString:(NSString *)dateFormatString {
    EVEDateMappings *dateMappings = [[EVEDateMappings alloc] init];
    dateMappings.dateFormatString = dateFormatString;
    dateMappings.key              = key;
    return dateMappings;
}


- (BOOL)transformValue:(NSObject *)oldValue
               toValue:(NSObject **)newValue
                forKey:(NSString **)key {
    
    if ([oldValue isKindOfClass:[NSString class]]) {
        
        if (!self.dateFormatter) {
            
            self.dateFormatter = [[NSDateFormatter alloc] init];
            [self.dateFormatter setDateFormat:self.dateFormatString];
            
        }
        
        NSDate *date = [self.dateFormatter dateFromString:(NSString *)oldValue];
        
        *newValue = date;
        *key = self.key;
        
        return YES;
        
    } else if ([oldValue isKindOfClass:[NSNull class]]) {
        
        *newValue = nil;
        *key      = self.key;
        
        return YES;
    }
    
    return NO;
}

@end



@implementation EVEDateFormatterMappings
@synthesize dateFormatter = _dateFormatter, key = _key;

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key dateFormatter:(NSDateFormatter *)dateFormatter {
    EVEDateFormatterMappings *dateMappings = [[EVEDateFormatterMappings alloc] init];
    dateMappings.dateFormatter = dateFormatter;
    dateMappings.key           = key;
    return dateMappings;
}


- (BOOL)transformValue:(NSObject *)oldValue
               toValue:(NSObject **)newValue
                forKey:(NSString **)key {
    
    if ([oldValue isKindOfClass:[NSString class]]) {
        
        NSDate *date = [self.dateFormatter dateFromString:(NSString *)oldValue];
        
        *newValue = date;
        *key = self.key;
        
        return YES;
        
    } else if ([oldValue isKindOfClass:[NSNull class]]) {
        
        *newValue = nil;
        *key      = self.key;
        
        return YES;
    }
    
    return NO;
}

@end



@implementation EVEDateEpochMappings
@synthesize key = _key, divisorForSeconds;

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key divisorForSeconds:(NSTimeInterval)divisorForSeconds {
    EVEDateEpochMappings *epochMapping = [[EVEDateEpochMappings alloc] init];
    epochMapping.key = key;
    epochMapping.divisorForSeconds = divisorForSeconds;
    return epochMapping;
}


- (BOOL)transformValue:(NSObject *)oldValue
               toValue:(NSObject **)newValue
                forKey:(NSString **)key {
    
    if ([oldValue isKindOfClass:[NSNumber class]]) {

        NSTimeInterval secondsFactor = [(NSNumber *)oldValue doubleValue];
        // convert into desired unit of seconds, but be sure to round if necessary, eg. 1000==milliseconds
        // (otherwise 19999 milliseconds will be off by a second because it will be rounded down instead of up)
        // Reference: http://stackoverflow.com/a/4926468/168594
        NSTimeInterval secSinceEpoch = (secondsFactor + self.divisorForSeconds - 1) / self.divisorForSeconds;
        // create the date and assign it to the object we're mapping
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:secSinceEpoch];

        *newValue = date;
        *key = self.key;

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

@implementation NSDate (EVEValidMappingKey)

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key mapping:(NSMutableDictionary *)mapping {
    [NSException raise:@"EVEObjectMappingException" format:@"Please use +[NSDate mappingWithKey:dateFormatString:] instead."];
    return nil;
}

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key dateFormatString:(NSString *)dateFormatString {
    return [EVEDateMappings mappingWithKey:key dateFormatString:dateFormatString];
}

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key dateFormatter:(NSDateFormatter *)dateFormatter {
    return [EVEDateFormatterMappings mappingWithKey:key dateFormatter:dateFormatter];
}

+ (id <EVEValidMappingKey>)mappingWithKey:(NSString *)key divisorForSeconds:(float)divisorForSeconds {
    return [EVEDateEpochMappings mappingWithKey:key divisorForSeconds:divisorForSeconds];
}

@end

