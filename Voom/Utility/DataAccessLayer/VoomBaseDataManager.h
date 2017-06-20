

//  Copyright (c) 2015 MOL MacBook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreWebService.h"

/*!
 @protocol
 DataManagerDelegate
 @abstract
 DataManagerDelegate handles the communication between data manager and view controllers.
 @discussion
This protocol provides the way for communication between data manager and view controlers.
 */

@protocol DataManagerDelegate <NSObject>
@required
/**
 *  use for callbacks to data consumer.
 */
- (void)didGetEntity:(id)entity;
- (BOOL)didGetError:(id)error;
- (BOOL)didGetErrorWithManager:(id)error withManager:(id)manager;

@end
/*!
 @class
 MOLBaseDataManager
 @abstract
 MOLBaseDataManager Base data manager class.
 @discussion
 This class provides the basic structure for managing data source for controllers.
 */


@interface VoomBaseDataManager : NSObject <CoreWebServiceServiceDelegate>

@property (nonatomic, weak) id <DataManagerDelegate> dataManagerDelegate;

/**
 *  use for saving and getting data.
 */
- (void)getEntity:(id)entity;
- (void)saveEntity:(id)entity;

@end
