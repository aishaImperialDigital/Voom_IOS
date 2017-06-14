//
//  VoomParentBO.h
//  Voom
//
//  Created by user on 14/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+EVEObjectMapping.h"
#import "Archiver.h"
#import "NSObject+NSCoding.h"

@interface VoomParentBO : NSObject<NSCoding>

@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, strong) NSString *Name;
+ (NSMutableDictionary*)getObjectMap;

@end
