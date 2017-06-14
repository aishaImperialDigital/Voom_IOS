//
//  VoomResponse.m
//  Voom
//
//  Created by user on 14/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VoomParentBO.h"
#import "EntityErrorsBO.h"
#import "VoomResponse.h"

@implementation VoomResponse


+ (NSMutableDictionary*)getObjectMap {
    NSMutableDictionary *objectMap = [super getObjectMap];
    [objectMap addEntriesFromDictionary:[NSDictionary  dictionaryWithObjectsAndKeys:
                                         [EntityErrorsBO mappingWithKey:@"entityError" mapping:[EntityErrorsBO getObjectMap]] , @"EntityErrors"
                                         ,nil]];
    return objectMap;
}


@end
