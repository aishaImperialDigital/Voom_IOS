//
//
//  Created by MOL on 8/6/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import "EVEJSONService.h"
#import "LoginRequestBO.h"

@interface LoginWebService : EVEJSONService

- (void)getLogin:(LoginRequestBO *) loginBO;
@end
