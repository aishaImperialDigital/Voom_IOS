//
//  VoomParentBO.m
//  Voom
//
//  Created by user on 14/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomParentBO.h"

@implementation VoomParentBO

+ (NSMutableDictionary*)getObjectMap{
    NSMutableDictionary *objectMap = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                      @"Id", @"EntityId",
                                      @"Name",@"Name"
                                      ,nil];
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
