/*Created by Muhammad Imran on 4/6/14. */

#import "EVEJSONService.h"
#import "EVEKeyGenrator.h"




@interface EVEJSONService ()

- (NSString*)sopaRequestWithJSONBoday:(NSString *)json;

@end

@implementation EVEJSONService

- (id)initWithServiceURL:(NSString*)serviceURLString cacheMode:(EVEURLConnectionCacheMode)cacheMode{
    if (self = [super initWithRootUrl:kBaseServerURL serviceUrl:serviceURLString]) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kBaseServerURL,serviceURLString]];
        self.cacheMode = cacheMode;
        [self.connection setCacheMode:self.cacheMode];
    }

    return self;
}

- (id)initWithAppVersionServiceURL:(NSString*)serviceURLString cacheMode:(EVEURLConnectionCacheMode)cacheMode{
    if (self = [super initWithRootUrl:@"http://10.30.3.50/" serviceUrl:serviceURLString]) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://10.30.3.50/",serviceURLString]];
        self.cacheMode = cacheMode;
        [self.connection setCacheMode:self.cacheMode];
    }
    
    return self;
}


- (void)setUrl:(NSString*)serviceURLString{
    NSString *urlUTF8 = serviceURLString;//[serviceURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
     url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kBaseServerURL,urlUTF8]];

    nsLog(@"url %@",url);
}
- (void)setResponseCacheMode:(EVEURLConnectionCacheMode)cahceMode {
    [self.connection setCacheMode:cahceMode];
}


#pragma mark CoreRESTService

- (void)didReceiveError:(EVEError *)error {

    // check for a session timeout...
    if (error.statusCode == 403) {
        // post a notification that the user's session timed out
        [[NSNotificationCenter defaultCenter] postNotificationName:kCommonSessionTimeout
                                                            object:nil];
    } else if (error.statusCode == 400 || error.statusCode == 401 ) {
        // post a notification that requested entuty not found
        [[NSNotificationCenter defaultCenter] postNotificationName:kAuthorizationFailureNotification
                                                            object:nil];
    }
    // all other errors are concerened unhandled and unexpected
    else {
        // post a notification that the server returned an error
        [[NSNotificationCenter defaultCenter] postNotificationName:kCommonUnexpectedServerError
                                                            object:nil];
    }
}

- (NSString*)sopaRequestWithJSONBoday:(NSString *)json {
    
    /*
     
     POST /SCCIWebservice/SCCIWeb.asmx/GetNews HTTP/1.1
     Host: www.sharjah.gov.ae
     Content-Type: application/x-www-form-urlencoded
     Content-Length: length
    
  */
    return json;
}


/*- (void)doJSONServiceRequest:(NSMutableURLRequest *)request {
    NSMutableString *cacheKey = [NSMutableString stringWithFormat:@"%@",url];
    
    // We need to make the cache keys unique for requests for getting data in chunks (Pagings etc..)
    // for this we are appending the XML contenet from current request in cache key. It will make our cache key unique for request with same URL, same Method and same Language. (XML content will be difrent for each request)
     
    //[cacheKey appendFormat:@"-%@",xml];
    [request setTimeoutInterval:kRequestTimeOut];
    [self.connection invokeSOAPRequest:request cacheKey:[EVEKeyGenrator md5Key:cacheKey] queryString:nil];
}*/

- (void)doJSONServiceRequest:(NSMutableURLRequest *)request {
    NSMutableString *cacheKey = [NSMutableString stringWithFormat:@"%@",url];
    [self.connection invokeSOAPRequest:request cacheKey:[EVEKeyGenrator md5Key:cacheKey] queryString:nil];
}

- (void)doJSONPostServiceRequest:(NSString *)json{
    /*
     #define kCharsetUTF8Value     @"application/x-www-form-urlencoded"
     #define kContentTypeHeader    @"Content-Type"
     #define kContentLengthHeader  @"Content-Length"
     #define kRequestParamInfo     @"X-RequestParamInfo"
     #define kAcceptLanguage       @"Accept-Language"
     */
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *mesage = json;
    NSString *msgLength = [NSString stringWithFormat:@"%ld", (long)[mesage length]];
    [request addValue:kContentTypeVaue forHTTPHeaderField:kContentTypeHeader];
    [request addValue: msgLength forHTTPHeaderField:kContentLengthHeader];
    [request setHTTPMethod:kPOSTRequest];
    [request setHTTPBody: [mesage dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:kRequestTimeOut];
    [self doJSONServiceRequest:request];

}



- (NSString *)URLEncodeStringFromString:(NSString *)string
{
    static CFStringRef charset = CFSTR("!@#$%&*()+'\";:=,/?[] ");
    CFStringRef str = (__bridge CFStringRef)string;
    CFStringEncoding encoding = kCFStringEncodingUTF8;
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, str, NULL, charset, encoding));
}

- (void)doJSONPostServiceRequestWithFormContentType:(NSString *)json{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *mesage = json;
    
   // mesage = [self URLEncodeStringFromString:mesage];
    
    NSString *msgLength = [NSString stringWithFormat:@"%ld", (long)[mesage length]];
    [request addValue:kCharsetUTF8Value forHTTPHeaderField:kContentTypeHeader];
    [request addValue: msgLength forHTTPHeaderField:kContentLengthHeader];
    [request addValue:@"Basic bW9iaWxlOk1vYmlsZUAxMjM0NTY=" forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod:kPOSTRequest];
    [request setHTTPBody: [mesage dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:kRequestTimeOut];
    [self doJSONServiceRequest:request];
    
}
- (void)doJSONGetServiceRequest:(NSString *)json{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *mesage = json;
    NSString *msgLength = [NSString stringWithFormat:@"%ld", (long)[mesage length]];
    [request addValue:kCharsetUTF8Value forHTTPHeaderField:kContentTypeHeader];
    [request addValue: msgLength forHTTPHeaderField:kContentLengthHeader];
    [request setHTTPMethod:kGETRequest];
    [request setHTTPBody: [mesage dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:kRequestTimeOut];
    [self doJSONServiceRequest:request];

}
- (void)doJSONGetServiceRequestWithoutParam:(NSString *)json{
     NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
     [self doJSONServiceRequest:request];
}

@end
