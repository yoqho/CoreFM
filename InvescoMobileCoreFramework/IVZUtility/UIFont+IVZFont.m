//
//  UIFont+IVZFont.m
//  IVZUtilityFramework
//
//  Created by Woodall, Kristopher on 7/23/13.
//  Copyright (c) 2013 Invesco. All rights reserved.
//


#import "UIFont+IVZFont.h"

@implementation UIFont (IVZFont)

+ (UIFont *)invescoRegular:(CGFloat)size {
    return [UIFont fontWithName:InvescoRegurlar size:size];
}

+ (UIFont *)invescoBold:(CGFloat)size {
     return [UIFont fontWithName:InvescoBold size:size];
}

+ (UIFont *)invescoLight:(CGFloat)size {
    return [UIFont fontWithName:InvescoLight size:size];
}

@end
