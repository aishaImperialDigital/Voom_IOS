//
//  EmployeeProfileManager.m
//  MOLProjectStructure
//
//  Created by MOL on 8/6/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import "LoginTokenManager.h"

@implementation LoginTokenManager

- (void)getEntity:(id)entity{
    webService = [[LoginTokenWebService alloc] init];
    [webService setCacheMode:EVEURLConnectionCacheModeDisk];
    webService.connection.cacheMode = EVEURLConnectionCacheModeDisk;
    webService.delegate = self ;
    [webService getLoginToken:self.grantType username:self.username password:self.password scope:self.scope answer:self.answer questionID:self.questionID];
    
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

@end
