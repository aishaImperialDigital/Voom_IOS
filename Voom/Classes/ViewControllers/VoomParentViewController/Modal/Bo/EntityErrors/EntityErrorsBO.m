//
//  EntityErrorsBO.m
//  MOLProjectStructure
//
//  Created by MOL MacBook on 7/28/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import "EntityErrorsBO.h"

@implementation EntityErrorsBO

+ (NSMutableDictionary *)getObjectMap{
    NSMutableDictionary *objectMap = [super getObjectMap];
    [objectMap addEntriesFromDictionary:[NSDictionary  dictionaryWithObjectsAndKeys:
                                         @"errorNumber", @"ErrorNumber",
                                         @"errorMessage", @"ErrorMessage"
                                         ,nil]];
    return objectMap;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [self autoEncodeWithCoder:coder];
}

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        [self autoDecode:coder];
    }
    return self;
}

@end
