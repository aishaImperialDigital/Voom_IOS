//
//  VoomParentBO.h
//  Voom
//

//  Copyright © 2017 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+EVEObjectMapping.h"
#import "Archiver.h"
#import "NSObject+NSCoding.h"

@interface VoomParentBO : NSObject<NSCoding>

@property (nonatomic, strong) NSString *errorcode;
@property (nonatomic, strong) NSString *errormsg;

+ (NSMutableDictionary*)getObjectMap;

@end
