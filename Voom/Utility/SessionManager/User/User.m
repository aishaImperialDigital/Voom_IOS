
//  Created by MOL MacBook on 8/12/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import "User.h"

@implementation User


-(instancetype)init{
    self = [super init];
   // self.userType = Guest;
    self.accessToken = @"";
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder {

    [aCoder encodeObject:self.accessToken  forKey:@"accessToken"];
    [aCoder encodeObject:self.companyName  forKey:@"companyName"];
    [aCoder encodeObject:self.userPersonCode  forKey:@"userPersonCode"];
    [aCoder encodeObject:self.userName  forKey:@"userName"];
    [aCoder encodeObject:self.userPassword  forKey:@"userPassword"];
    [aCoder encodeObject:self.personFullName  forKey:@"personFullName"];
    [aCoder encodeObject:self.userImage  forKey:@"userImage"];
    [aCoder encodeInt:self.isCurrentlyLogin  forKey:@"isCurrentlyLogin"];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.accessToken = [aDecoder decodeObjectForKey:@"accessToken"];
        self.companyName = [aDecoder decodeObjectForKey:@"companyName"];
        self.userPersonCode = [aDecoder decodeObjectForKey:@"userPersonCode"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userPassword = [aDecoder decodeObjectForKey:@"userPassword"];
        self.personFullName = [aDecoder decodeObjectForKey:@"personFullName"];
        self.userImage = [aDecoder decodeObjectForKey:@"userImage"];
        self.isCurrentlyLogin = [aDecoder decodeIntForKey:@"isCurrentlyLogin"];
    }
    return self;
}

@end
