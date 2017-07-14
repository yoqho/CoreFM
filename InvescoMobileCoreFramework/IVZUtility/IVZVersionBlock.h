//
//  IVZVersionBlock.h
//  IVZFramework
//
//  Created by Luong, Christine on 8/28/13.
//  Copyright (c) 2013 Invesco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IVZVersionBlock : NSObject

/** Executes block states based on ios versoins
 @param ios6x block statement to be ran for ios versions 6.x
 @param ios7plus block statement to be ran for ios versions greater than 7.x
 */

+ (void)execute6x:(void (^)(void))ios6x newer:(void(^)(void))ios7plus;


/** Executes block states based on ios versoins
 @param ios6x block statement to be ran for ios versions 6.x
 @param ios7 block statement to be ran for ios versions greater than 7.x
 @param ios8plus block statement to be ran for ios versions greater than 7.x

 */

+ (void)execute6x:(void (^)(void))ios6x i7x:(void(^)(void))ios7 and8plus:(void(^)(void))ios8plus;


@end
