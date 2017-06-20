
//
//  Created by MOL MacBook on 7/28/15.
//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import "VoomSessionManger.h"

@implementation VoomSessionManger

#define kVoomProfileFile  @"kProfileFile"
#define kLoginTokenKey @"kLoginTokenKey"
#define KGroupEntitlmentID @"KGroupEntitlmentID"


+ (id)sharedSession{
    static VoomSessionManger *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (void)resetUser{
    [self setUserObject: nil];
    [self setUserObject:[[User alloc] init]];
    [self resetLoginToken];
    [self cacheUserProfileLocaliy:[self userObject]];
}

-(void) resetLoginToken{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults] ;
    [prefs setObject:nil forKey:kLoginTokenKey];
}

-(void) setLoginToken:(NSString *) token{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults]  ;
    [prefs setObject:token forKey:kLoginTokenKey];
    
}

-(NSString *) loginToken{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults]  ;
    self.loginToken = [prefs objectForKey:kLoginTokenKey];
    return self.loginToken;
}

- (void)cacheUserProfileLocaliy:(User *)param{
    [NSKeyedArchiver archiveRootObject:param toFile:[VoomSessionManger getFilePath]];
    NSURL *groupURL = [[NSFileManager defaultManager]
                       containerURLForSecurityApplicationGroupIdentifier:
                       KGroupEntitlmentID];
    groupURL = [groupURL URLByAppendingPathComponent:[NSString stringWithFormat:@"Library/Caches/userObject"]];
    [NSKeyedArchiver archiveRootObject:param toFile:[NSString stringWithFormat:@"%@",[groupURL.relativeString stringByReplacingOccurrencesOfString:@"file:///" withString:@"/"]]];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSDate date] forKey:@"updatedDate"];
    [userDefaults synchronize];
}

+ (NSString *)getFilePath{
    //Get the store file path for the profile.
    NSArray *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                           inDomains:NSUserDomainMask];
    NSString *documentDirPath = (NSString *)[[urls objectAtIndex:0] path];
    NSString *path=[documentDirPath stringByAppendingPathComponent:kVoomProfileFile];
    if(path)
        return path;
    else{
        NSLog(@"no path");
        return nil;
    }
}

- (User *)getCacheUserProfile{
    @try {
       [self setUserObject:[NSKeyedUnarchiver unarchiveObjectWithFile:[VoomSessionManger getFilePath]]];
    }
    @catch (NSException* exception) {
        NSLog(@"provide some logs here");
        // delete corrupted archive
        // initialize libraryDat from scratch
    }
    if ([[VoomSessionManger sharedSession] userObject] == nil) {
        self.isLoginUser = 0;
    }else{
        self.isLoginUser = 1;
    }
    return [[VoomSessionManger sharedSession] userObject];
}

@end
