//
//  IVZVersionBlock.m
//  IVZFramework
//
//  Created by Luong, Christine on 8/28/13.
//  Copyright (c) 2013 Invesco. All rights reserved.
//

#import "IVZVersionBlock.h"
#import "IVZConstants.h"

@implementation IVZVersionBlock

+ (void)execute5x:(void (^)(void))ios5x ios6x:(void(^)(void))ios6x ios7Block:(void (^)(void))ios7x ios8Block:(void (^)(void))ios8x {
    if (SYSTEM_VERSION_LESS_THAN(@"6.0")) {
        ios5x();
    } else if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0") && SYSTEM_VERSION_LESS_THAN(@"7.0")){
        ios6x();
    } else if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0") && SYSTEM_VERSION_LESS_THAN(@"8.0")) {
        ios7x();
    } else {
        ios8x();
    }
}

+ (void)execute6x:(void (^)(void))ios6x newer:(void(^)(void))ios7plus {
    [IVZVersionBlock execute5x:^{} ios6x:^{ ios6x(); } ios7Block:^{ ios7plus();} ios8Block:^{}];
}

+ (void)execute6x:(void (^)(void))ios6x i7x:(void(^)(void))ios7 and8plus:(void(^)(void))ios8 {
    [IVZVersionBlock execute5x:^{} ios6x:^{ ios6x(); } ios7Block:^{ ios7();} ios8Block:^{ios8();}];
}

@end
