//
//  MOLRequestBO.h

//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VoomRequestBO : NSObject

@property (nonatomic) int pageNumber;
@property (nonatomic) int pageSize;
@property (nonatomic, strong) NSString *dbAction;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, assign) int rowStatusId;
@property (nonatomic, strong) NSString *searchString;
@property (nonatomic, strong) NSString *deviceId;

@end
