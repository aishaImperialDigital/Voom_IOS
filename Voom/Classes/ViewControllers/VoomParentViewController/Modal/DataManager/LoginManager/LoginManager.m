//  Created by MOL on 8/6/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import "LoginManager.h"
#import "LoginRequestBO.h"
#import "LoginRequestBO.h"

@implementation LoginManager

- (void)getEntity:(id)entity{
    LoginRequestBO *loginRequestBO = (LoginRequestBO *) entity;
    webService = [[LoginWebService alloc] init];
    [webService setCacheMode:EVEURLConnectionCacheModeDisk];
    webService.connection.cacheMode = EVEURLConnectionCacheModeDisk;
    webService.delegate = self ;
    [webService getLogin:loginRequestBO];
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
