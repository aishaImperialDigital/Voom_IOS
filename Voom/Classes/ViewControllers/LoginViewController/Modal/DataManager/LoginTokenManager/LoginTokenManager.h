//
//  EmployeeProfileManager.h
//  MOLProjectStructure
//
//  Created by MOL on 8/6/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOLBaseDataManager.h"
#import "LoginTokenWebService.h"
@interface LoginTokenManager : MOLBaseDataManager
{

   LoginTokenWebService *webService;
}
@property (nonatomic,strong) NSString *grantType;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *scope;
@property (nonatomic,strong) NSString *answer;
@property (nonatomic,strong) NSString *questionID;
@end
