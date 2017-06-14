/*Created by Muhammad Imran on 4/6/14. */

#import <Foundation/Foundation.h>
#import "EventoServerAPIConstants.h"
#import "CoreWebService.h"

@interface EVEJSONService : CoreWebService {
    /*!
     @var
     url
     @discussion
     url holds the URL for current SOAP request.
     */
    NSURL *url;

}


/**
 *	calls the webservice at specific end point, mentioned in param. grabs the response and
 *  returns to called method.
 *	@param	serviceURLString  web service url to hit.
 *
*/

- (id)initWithServiceURL:(NSString*)serviceURLString cacheMode:(EVEURLConnectionCacheMode)cacheMode;

/**
 *  Call this method to change the cache mode for current service.
 *
 *  @param cacheMode application cache mode
 */
- (void)setResponseCacheMode:(EVEURLConnectionCacheMode)cacheMode;

/**
 *  Call this method to start JSON data request.
 *
 *  @param JSONString JSON data in string format.
 */
- (void)doJSONServiceRequest:(NSMutableURLRequest *)request;
- (void)doJSONPostServiceRequest:(NSString *)json;
- (void)doJSONPostServiceRequestWithFormContentType:(NSString *)json;
- (void)doJSONGetServiceRequest:(NSString *)json;
- (void)doJSONGetServiceRequestWithoutParam:(NSString *)json;
- (void)setUrl:(NSString*)serviceURLString;
- (void)doJSONPostServiceRequestWithoutToken:(NSString *)json;
- (id)initWithAppVersionServiceURL:(NSString*)serviceURLString cacheMode:(EVEURLConnectionCacheMode)cacheMode;

@end
