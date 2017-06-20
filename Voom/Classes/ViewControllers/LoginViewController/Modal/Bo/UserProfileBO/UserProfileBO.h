//
//  UserProfileBO.h
//  Voom
//
//  Created by gqgnju on 19/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VoomParentBO.h"

@interface UserProfileBO : VoomParentBO
{
    
}
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *profile;
@property (nonatomic, strong) NSString *firstname;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSString *verify_union;
@property (nonatomic, strong) NSString *rate_seller;
@property (nonatomic, strong) NSString *notification;

@end
