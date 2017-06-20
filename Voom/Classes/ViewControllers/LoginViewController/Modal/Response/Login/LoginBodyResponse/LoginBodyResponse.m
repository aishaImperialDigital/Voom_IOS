
//  Created by MOL MacBook on 7/29/15.
//  Copyright (c) 2015 MOL. All rights reserved.
//

#import "LoginBodyResponse.h"
#import "UserProfileBO.h"
@implementation LoginBodyResponse

+ (NSMutableDictionary*)getObjectMap{
    NSMutableDictionary *objectMap = [super getObjectMap];
    [objectMap addEntriesFromDictionary:[NSDictionary  dictionaryWithObjectsAndKeys:
                                         [UserProfileBO mappingWithKey:@"data" mapping:[UserProfileBO getObjectMap]], @"data"
                                         ,nil]];
    return objectMap;
}

@end
