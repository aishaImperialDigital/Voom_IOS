
//  Created by MOL MacBook on 7/28/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VoomBaseDataManager.h"
#import "User.h"

@interface VoomSessionManger : NSObject <DataManagerDelegate>{
}




@property (nonatomic, strong) User *userObject;
@property (readwrite, assign) int isLoginUser;
+ (id)sharedSession;



@end
