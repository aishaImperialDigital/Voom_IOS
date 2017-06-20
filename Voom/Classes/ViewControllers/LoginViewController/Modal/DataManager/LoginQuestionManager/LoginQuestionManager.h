//
//  EmployeeProfileManager.h
//  MOLProjectStructure
//
//  Created by MOL on 8/6/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOLBaseDataManager.h"
#import "LoginQuestionWebService.h"
#import "LoginTokenWebService.h"
#import "EmployerBasicProfileWebService.h"
#import "EmployeeProfileWebService.h"

typedef enum loginServiceType
{
    question,
    token,
    refreshToken,
    profile,
    employeeProfile
}loginWebService;

@interface LoginQuestionManager : MOLBaseDataManager
{
   LoginQuestionWebService *webService;
   LoginTokenWebService *tokenWebService;
   EmployerBasicProfileWebService *employerBasicWebService;
   EmployeeProfileWebService *employeeService;
}

@property (nonatomic,assign) enum loginServiceType webServiceType;
@property(nonatomic,strong)  NSString *username;
@property(nonatomic,strong)  NSString *password;
@property (nonatomic,strong) NSString *grantType;
@property (nonatomic,strong) NSString *scope;
@property (nonatomic,strong) NSString *answer;
@property (nonatomic,strong) NSString *questionID;
@property (nonatomic,strong) NSString *refresh_token;
- (void)cancel;
@end
