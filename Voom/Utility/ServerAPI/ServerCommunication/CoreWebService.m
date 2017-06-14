/*Created by Muhammad Imran on 4/6/14. */

#import "CoreWebService.h"
#import "Reachability.h"


#import "EventoServerAPIConstants.h"
#import <UIKit/UIDevice.h>
#import "EVEError.h"
#import "NSObject+EVEObjectMapping.h"
#import "VoomResponse.h"

@implementation CoreWebService

@synthesize rootURL;
@synthesize delegate;
@synthesize connection;
@synthesize method;
@synthesize responseClass;

#pragma mark Initialization

- (id)initWithRootUrl:(NSString *)rootUrl serviceUrl:(NSString *)serviceUrl {
    if ((self = [super init])) {
        // calculate the fully qualified REST URL
        NSString *fullyQualifiedUrl = [NSString stringWithFormat:@"%@%@", rootUrl, serviceUrl];
        // create and initialize the connection
        [self setConnection:[[CoreURLConnection alloc] initWithDelegate:self
                                                                         url:fullyQualifiedUrl]];
        // set the content type to buffer
        [self.connection setBufferedContentTypes:[NSArray arrayWithObject:@"text/xml"]];
    }
    return (self);
}

- (void)setUrl:(NSString *)rootUrl serviceUrl:(NSString *)serviceUrl {

    // calculate the fully qualified REST URL
    NSString *fullyQualifiedUrl = [NSString stringWithFormat:@"%@%@", rootUrl, serviceUrl];
    // create and initialize the connection
    [self setConnection:[[CoreURLConnection alloc] initWithDelegate:self
                                                                     url:fullyQualifiedUrl]];
    // set the content type to buffer
    [self.connection setBufferedContentTypes:[NSArray arrayWithObject:@"text/xml"]];
}

- (NSString*)removeExtraJSONTags:(NSString*)JSONString {
   // NSString *JSONString = [NSString stringWithString:JSONString];
    NSRange rangForBodyStartingTag = [JSONString rangeOfString:@"{\"NCMS\":" options:NSCaseInsensitiveSearch];
    if (rangForBodyStartingTag.length >0) {
        JSONString = [JSONString substringFromIndex:(rangForBodyStartingTag.location + rangForBodyStartingTag.length)];
        NSRange rangForBodyEndingTag = [JSONString rangeOfString:@"}" options:NSBackwardsSearch];
        JSONString = [JSONString substringToIndex:(rangForBodyEndingTag.location)];
       
    }
    
 return JSONString;

}

#pragma mark CoreWebServiceService

- (BOOL)active {
    return [self.connection active];
}

- (void)cancel {
    [self.connection cancel];
}

- (void)didReceiveError:(EVEError *)error{
}


#pragma mark CoreWebServiceServiceDelegate


- (id)deserializeJSONData:(NSData*)data {
    // deserialize the data as XML, if any data is present
    id object = nil;
    if (data != nil && [data length] > 0) {

        id JSONObject = [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:NULL];

        NSMutableDictionary *dic = [self.responseClass performSelector:@selector(getObjectMap)];
        object =  [self.responseClass objectFromJSONObject:JSONObject mapping:dic];
    }
    
    return object;
}

- (void)connection:(CoreURLConnection *)c didReceiveData:(NSData *)data {
    NSString *responseString= [self removeExtraJSONTags:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
    id xmlObject = [self deserializeJSONData:[responseString dataUsingEncoding:NSUTF8StringEncoding]];
    //send the delegate message
    
    if([delegate respondsToSelector:@selector(service:didGet:)]){
     
        VoomResponse *response = (VoomResponse *)xmlObject;
        if([response isKindOfClass:[VoomResponse class]])
        {
        if ([response.entityError count] > 0) {
            EntityErrorsBO *error = [response.entityError objectAtIndex:0];
            if ([error.errorNumber intValue] == 6) {
               // [[NSNotificationCenter defaultCenter] postNotificationName:@"UNATH"
                //                                                    object:nil];
            }else{
                [delegate service:self didGet:xmlObject];
            }
        }else{
            [delegate service:self didGet:xmlObject];
  
        }
        }
    }
}



- (void)connection:(CoreURLConnection *)con didReceiveResponseHeader:(NSDictionary *)responseH {
    // For handling the Page not found or redirection error we have to get the status code from responce header.
    int statusCode = [[responseH objectForKey:@"statusCode"] intValue];
    [self setResponseHeader:responseH];
    EVEError *error = [[EVEError alloc] init];
    error.statusCode = statusCode;
    
    if (statusCode == 401) {
        [con cancel];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UNATH"
                                                            object:nil];
        
    }else{
        if ( statusCode == 500) {
            BOOL errorHandled = NO;
            if ([delegate respondsToSelector:@selector(service:didReceiveError:)]) {
                errorHandled = [delegate service:self didReceiveError:error];
            }
            if (!errorHandled) {
                [[NSNotificationCenter defaultCenter] postNotificationName:kCommonUnableToAccessServices
                                                                    object:nil];
            }
            [con cancel];
            //pass the response header data to controller.
        } else if ([self.delegate respondsToSelector:@selector(service:didReceiveResponseHeader:)]) {
            [self.delegate service:self didReceiveResponseHeader:responseH];
        }

        
    }
    
}


//- (void)connection:(CoreURLConnection *)connection hasDownloaded:(NSInteger)downloadedBytes {
//    if ([delegate respondsToSelector:@selector(service:hasDownloaded:)]) {
//        [delegate service:self hasDownloaded:downloadedBytes];
//    }
//}
//
//- (void)connection:(CoreURLConnection *)connection didFinishStreaming:(NSString *)filePath {
//    if ([delegate respondsToSelector:@selector(service:didFinishStreaming:)]) {
//        [delegate service:self didFinishStreaming:filePath];
//    }
//}

- (void)connection:(CoreURLConnection *)con didDidReceiveCachedData:(NSData *)data {
    if (data == nil || [data length] <= 0) {
        [EVECacheDiskHandler purgeDiskCacheForKey:con.cacheKey];
        return;
    }

    NSString *responseString= [self removeExtraJSONTags:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
    id xmlObject = [self deserializeJSONData:[responseString dataUsingEncoding:NSUTF8StringEncoding]];
    if (xmlObject == nil) {
        [EVECacheDiskHandler purgeDiskCacheForKey:con.cacheKey];
        return;
    }

    // otherwise, we got a normal response
    if ([delegate respondsToSelector:@selector(service:didDidReceiveCached:)]) {
        //send the delegate message
        [delegate service:self didDidReceiveCached:xmlObject];
    }


}
- (void)connection:(CoreURLConnection *)connection didFinishCachedStreaming:(NSString *)filePath {
    if ([delegate respondsToSelector:@selector(service:didFinishCachedStreaming:)]) {
        [delegate service:self didFinishStreaming:filePath];
    }
}
- (void)connection:(CoreURLConnection *)connection didUpdateDownloadProgress:(EVEDataDownloadProgress*)progress {
    if ([delegate respondsToSelector:@selector(service:didUpdateDownloadProgress:)]) {
        [delegate service:self didUpdateDownloadProgress:progress];
    }

}

/*- (void)connection:(CoreURLConnection *)connection didFailWithError:(NSError *)error {
	// post a notification that we can't reach the service

    EVEError *myError = [[EVEError alloc] init];
    myError.statusCode = (int)[error code];
    BOOL errorHandled = NO;
    if (myError.statusCode == -1009) {
        if (!errorHandled) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kErrorNotConnectedToInternet
                                                            object:nil];
        }
        if ([delegate respondsToSelector:@selector(service:didReceiveError:)]) {
            errorHandled = [delegate service:self didReceiveError:myError];
        }
    } else {
        if ([delegate respondsToSelector:@selector(service:didReceiveError:)]) {
            errorHandled = [delegate service:self didReceiveError:myError];
        }
        if (!errorHandled) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kCommonUnableToAccessServices
                                                                object:nil];
        }

    }
}
*/

- (void)connection:(CoreURLConnection *)connection didFailWithError:(NSError *)error {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    EVEError *myError = [[EVEError alloc] init];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    myError.statusCode = (int)[error code];
    
    
    if (internetStatus == NotReachable) {
        myError.statusCode = kCFURLErrorNotConnectedToInternet;
    }
    BOOL errorHandled = NO;
    NSString *notificationString = kCommonUnableToAccessServices;
    if (myError.statusCode == kCFURLErrorNotConnectedToInternet) {
        notificationString = kErrorNotConnectedToInternet;
    }else if (myError.statusCode == kCFURLErrorCannotConnectToHost){
        notificationString = kCommonUnexpectedServerError;
        
    }else if (myError.statusCode == kCFURLErrorTimedOut){
        notificationString = kCommonSessionTimeout;
        
    }else if (myError.statusCode == kCFURLErrorUserAuthenticationRequired){
        notificationString = kAuthorizationFailureNotification;
        
    }else if (myError.statusCode == kCFURLErrorCancelled || myError.statusCode == kCFURLErrorUnsupportedURL){
        notificationString = kCommonUnexpectedServerError;
        
    }
    
    
    if ([delegate respondsToSelector:@selector(service:didReceiveError:)]) {
        errorHandled = [delegate service:self didReceiveError:myError];
    }
    if (!errorHandled) {
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationString
                                                            object:nil];
    }
}

@end
