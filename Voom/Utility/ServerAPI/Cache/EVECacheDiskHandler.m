//
//  EVECacheDiskHandler.m
//  TextXMLMapping
//
//  Created by Muhammad Imran on 4/28/14.
//
//

#import "EVECacheDiskHandler.h"
#import "EVEKeyGenrator.h"

@implementation EVECacheDiskHandler

+ (NSString*)cacheFilePathForKey:(NSString *)key {
    NSArray *directoriesPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [directoriesPaths objectAtIndex:0];
    NSMutableString *cacheDirectoryPath = [[NSMutableString alloc] initWithString:[cacheDirectory stringByAppendingPathComponent:@"WebServicesCache/"]];
    NSError *error;
    //Create WebServicesCache directory if it did not exist.
	if (![[NSFileManager defaultManager] fileExistsAtPath:cacheDirectoryPath]) {
		if (![[NSFileManager defaultManager] createDirectoryAtPath:cacheDirectoryPath
									   withIntermediateDirectories:NO
														attributes:nil
															 error:&error]){
			nsLog(@"Error while creating directory: %@", error);
		} else {
            NSURL *url = [NSURL fileURLWithPath:cacheDirectoryPath isDirectory:YES];
            [self addSkipBackupAttributeToItemAtURL:url];
        }
	}
    NSString *cacheFilePath = [NSString stringWithFormat:@"%@/%@.eve", cacheDirectoryPath,key];
    return cacheFilePath;
}

+ (NSString*)cacheImagePathForKey:(NSString *)key{
    NSArray *directoriesPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [directoriesPaths objectAtIndex:0];
    NSMutableString *cacheDirectoryPath = [[NSMutableString alloc] initWithString:[cacheDirectory stringByAppendingPathComponent:@"ImagesCaches/"]];
    NSError *error;
    //Create WebServicesCache directory if it did not exist.
    if (![[NSFileManager defaultManager] fileExistsAtPath:cacheDirectoryPath]) {
        if (![[NSFileManager defaultManager] createDirectoryAtPath:cacheDirectoryPath
                                       withIntermediateDirectories:NO
                                                        attributes:nil
                                                             error:&error]){
            nsLog(@"Error while creating directory: %@", error);
        } else {
            NSURL *url = [NSURL fileURLWithPath:cacheDirectoryPath isDirectory:YES];
            [self addSkipBackupAttributeToItemAtURL:url];
        }
    }
    NSString *cacheFilePath = [NSString stringWithFormat:@"%@/%@.png", cacheDirectoryPath,key];
    return cacheFilePath;

}

+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);

    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        nsLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
}
+ (BOOL)saveResponseToDiskCache:(NSData *)cachedResponseData forKey:(NSString *)key{
    NSString *cacheFilePath = [self cacheFilePathForKey:key];
    return [cachedResponseData writeToFile:cacheFilePath atomically:YES];
}

+ (NSData*)cachedDataFromDiskForKey:(NSString *)key {
    NSString *cacheFilePath = [self cacheFilePathForKey:key];
    if ([[NSFileManager defaultManager] fileExistsAtPath:cacheFilePath]) {
        return [NSData dataWithContentsOfFile:cacheFilePath];
    } else {
        return nil;
    }
}

+ (BOOL)purgeDiskCacheForKey:(NSString*)key {
    NSString *cacheFilePath = [self cacheFilePathForKey:key];
    if ([[NSFileManager defaultManager] fileExistsAtPath:cacheFilePath]) {
        return [[NSFileManager defaultManager] removeItemAtPath:cacheFilePath error:nil];
    } else {
        return NO;
    }

}

+ (BOOL)purgeImagwCacheForKey:(NSString *)key{
    NSString *cacheFilePath = [self cacheImagePathForKey:key];
    if ([[NSFileManager defaultManager] fileExistsAtPath:cacheFilePath]) {
        return [[NSFileManager defaultManager] removeItemAtPath:cacheFilePath error:nil];
    } else {
        return NO;
    }

}

+ (UIImage *)getImageForUrl:(NSString *)url{
    NSString *stringPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *temName=[NSString stringWithFormat:@"%@/ImagesCaches/%@.png",stringPath,[EVEKeyGenrator md5Key:url]];
    if([[NSFileManager defaultManager] fileExistsAtPath:temName]){
        return  [UIImage imageWithContentsOfFile:temName];
    } else {
        return nil;
    }

    
}

+ (void)storeImage:(UIImage *)image forKey :(NSString *)url{
    NSArray *directoriesPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [directoriesPaths objectAtIndex:0];
    NSMutableString *cacheDirectoryPath = [[NSMutableString alloc] initWithString:[cacheDirectory stringByAppendingPathComponent:@"ImagesCaches/"]];
    NSError *error;
    //Create WebServicesCache directory if it did not exist.
	if (![[NSFileManager defaultManager] fileExistsAtPath:cacheDirectoryPath]) {
		if (![[NSFileManager defaultManager] createDirectoryAtPath:cacheDirectoryPath
									   withIntermediateDirectories:NO
														attributes:nil
															 error:&error]){
			nsLog(@"Error while creating directory: %@", error);
		} else {
            NSURL *url = [NSURL fileURLWithPath:cacheDirectoryPath isDirectory:YES];
            [self addSkipBackupAttributeToItemAtURL:url];
        }
    }
   // [UIImageJPEGRepresentation(image,1.0)writeToFile:[NSString stringWithFormat:@"%@/ImagesCaches/%@.jpeg",cacheDirectory,[EVEKeyGenrator md5Key:url]] atomically:YES];
    
   [UIImagePNGRepresentation(image)writeToFile:[NSString stringWithFormat:@"%@/ImagesCaches/%@.png",cacheDirectory,[EVEKeyGenrator md5Key:url]] atomically:YES];
    
}


@end
