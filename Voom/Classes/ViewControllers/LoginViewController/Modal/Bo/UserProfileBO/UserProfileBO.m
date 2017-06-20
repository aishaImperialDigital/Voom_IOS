//
//  UserProfileBO.m
//  Voom
//
//  Created by gqgnju on 19/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "UserProfileBO.h"

@implementation UserProfileBO

+ (NSMutableDictionary*)getObjectMap{
    NSMutableDictionary *objectMap = [super getObjectMap];
    [objectMap addEntriesFromDictionary:[NSDictionary  dictionaryWithObjectsAndKeys:
                                         @"userid", @"userid",
                                         @"profile", @"profile",
                                         @"firstname", @"firstname",
                                         @"lastname", @"lastname",
                                         @"verify_union", @"verify_union",
                                         @"rate_seller", @"rate_seller",
                                         @"notification", @"notification",
                                         nil]];
    return objectMap;
}


-(id)copyWithZone:(NSZone *)zone{
    UserProfileBO *cop=[[[self class]allocWithZone:zone]init];
    [cop setUserid:self.userid];
    [cop setProfile:self.profile];
    [cop setFirstname:self.firstname];
    [cop setLastname:self.lastname];
    [cop setVerify_union:self.verify_union];
    [cop setRate_seller:self.rate_seller];
    [cop setNotification:self.notification];
    return cop;
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
