//
//  IVZConstants.h
//  IVZUtilityFramework
//
//  Created by Woodall, Kristopher on 7/23/13.
//  Copyright (c) 2013 Invesco. All rights reserved.
//


#import <UIKit/UIKit.h>


/* Returns If Device is iPhone5
 */

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
/** Returns if current iOS is equal to asked value v */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
/** Returns if current iOS is greater to asked value v */
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
/** Returns if current iOS is greater than or equal to asked value v */
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
/** Returns if current iOS is less than to asked value v */
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
/** Returns if current iOS is less than or equal to to asked value v */
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define RandomNumber (min, max) (min + rand() % (max-min))

/* Returns if Device is iPad
 */

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/* Log in console only if running in Simulator
 */

#define LOG(FORMAT, ...) if(TARGET_IPHONE_SIMULATOR){ NSLog(FORMAT, ## __VA_ARGS__); };

#define RandomValue (float)rand()/(float)RAND_MAX

/** Returns an empty String */

static NSString *const EMPTY_STRING  =  @"";


