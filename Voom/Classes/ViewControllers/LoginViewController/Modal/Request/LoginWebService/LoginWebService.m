//
//
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import "LoginWebService.h"
#import "LoginBodyResponse.h"
#import "Firebase.h"




#define kServiceURL @"user/login"


@implementation LoginWebService

- (id)init {
    NSString *urlWithCode = [NSString stringWithFormat:kServiceURL];
    if (self = [super initWithServiceURL:urlWithCode cacheMode:EVEURLConnectionCacheModeDisk]) {
    }
    return self;
}

- (void)getLogin{
    
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    NSMutableDictionary *contentDictionary = [[NSMutableDictionary alloc]init];
    [contentDictionary setValue:@"02102829245" forKey:@"email"];
    [contentDictionary setValue:@"4558" forKey:@"password"];
    [contentDictionary setValue:@"IOS" forKey:@"phone_type"];
    [contentDictionary setValue:refreshedToken forKey:@"token"];
    NSData *data = [NSJSONSerialization dataWithJSONObject:contentDictionary options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:data
                                              encoding:NSUTF8StringEncoding];
    
    
    [self setResponseClass:[LoginBodyResponse class]];
    [self doJSONPostServiceRequestWithFormContentType:jsonStr];
}

@end
