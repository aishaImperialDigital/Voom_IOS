
//  Created by MOL MacBook on 8/12/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface User : NSObject<NSCoding>{}



@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *refreshToken;
@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *userPersonCode;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userPassword;
@property (nonatomic, strong) NSString *personFullName;
@property (nonatomic, strong) NSString *userImage;
@property (nonatomic, assign) int isCurrentlyLogin;

-(instancetype)init;
@end
