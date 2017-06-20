//
//  EmployeeProfileManager.m
//  MOLProjectStructure
//
//  Created by MOL on 8/6/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import "LoginQuestionManager.h"

@implementation LoginQuestionManager

- (void)getEntity:(id)entity{
   
    if (webService) {
        [webService cancel];
        webService.delegate = nil;
        webService = nil;
    }
    if(self.webServiceType == question)
    {
        webService = [[LoginQuestionWebService alloc] init];
        [webService setCacheMode:EVEURLConnectionCacheModeNone];
        webService.connection.cacheMode = EVEURLConnectionCacheModeNone;
        webService.delegate = self ;
        [webService getLoginQuestionFor:self.username password:self.password];
    }
    else if(self.webServiceType == token)
    {
        tokenWebService = [[LoginTokenWebService alloc] init];
        [tokenWebService setCacheMode:EVEURLConnectionCacheModeNone];
        tokenWebService.connection.cacheMode = EVEURLConnectionCacheModeNone;
        tokenWebService.delegate = self ;
        [tokenWebService getLoginToken:self.grantType username:self.username password:self.password scope:self.scope answer:self.answer questionID:self.questionID];
    }
    else if(self.webServiceType == refreshToken)
    {
        tokenWebService = [[LoginTokenWebService alloc] init];
        [tokenWebService setCacheMode:EVEURLConnectionCacheModeNone];
        tokenWebService.connection.cacheMode = EVEURLConnectionCacheModeNone;
        tokenWebService.delegate = self ;
        [tokenWebService getRefreshToken:self.grantType refreshToken:self.refresh_token];
    }
    else if(self.webServiceType == profile)
    {
        employerBasicWebService = [[EmployerBasicProfileWebService alloc] init];
        [employerBasicWebService setCacheMode:EVEURLConnectionCacheModeNone];
        employerBasicWebService.connection.cacheMode = EVEURLConnectionCacheModeNone;
        employerBasicWebService.delegate = self ;
        [employerBasicWebService getEmployerProfile];;
    }
    else if (self.webServiceType == employeeProfile) {
        employeeService = nil;
        employeeService = [[EmployeeProfileWebService alloc] init];
        [employeeService setCacheMode:EVEURLConnectionCacheModeNone];
        employeeService.connection.cacheMode = EVEURLConnectionCacheModeNone;
        employeeService.delegate = self ;
        [employeeService getEmployeeProfile];
    }
    
}


#pragma mark - core Web Servies Delegates

- (void)service:(CoreWebService *)service didDidReceiveCached:(id)object {
    nsLog(@"cached object %@",[object class]);
    if ([self.dataManagerDelegate respondsToSelector:@selector(didGetEntity:)]) {
        [self.dataManagerDelegate didGetEntity:object];
    }
}

- (void)service:(CoreWebService *)service didGet:(id)object{
    nsLog(@"%@",[object class]);
    if ([self.dataManagerDelegate respondsToSelector:@selector(didGetEntity:)]) {
        [self.dataManagerDelegate didGetEntity:object];
    }
    
}
-(BOOL)service:(CoreWebService *)service didReceiveError:(id)xmlObject{
    BOOL boolValue = NO;
    if ([self.dataManagerDelegate respondsToSelector:@selector(didGetError:)]) {
        boolValue =  [self.dataManagerDelegate didGetError:xmlObject];
    }
    return boolValue;
}

- (void)cancel{
    if (webService) {
        [webService cancel];
        webService.delegate = nil;
        webService = nil;
    }
}

@end
