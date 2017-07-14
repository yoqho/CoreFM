//
//  UIFont+IVZFont.h
//  IVZUtilityFramework
//
//  Created by Woodall, Kristopher on 7/23/13.
//  Copyright (c) 2013 Invesco. All rights reserved.
//


#import <UIKit/UIKit.h>

/** Invesco Regular Font */
#define InvescoRegurlar @"InvescoInterstate-Regular"

/** Invesco Bold Font */
#define InvescoBold @"InvescoInterstate-Bold"

/** Invesco Bold Font */
#define InvescoLight @"InvescoInterstate-Light"


#define kFontVerdana @"Verdana"
#define kFontVerdanaBold @"Verdana-Bold"
#define kFontVerdanaItalic @"Verdana-Italic"

// ---------------------------------------
// Overview
// ---------------------------------------
/**
 IVZFont is a category of UIFont. The following uitlity methods are accessed through UIFont class. In order for the clas methods to work you must install the Resource.bundle into your project. 
 
 Installation
 
 1. In the Info.plist add "Fonts provided by application"
    a. Add "Resources.bundle/Fonts/InvescoInterstate-Bold.otf"
    b. Add "Resources.bundle/Fonts/InvescoInterstate-Regular.otf"
 */

@interface UIFont (IVZFont)

/* Returns Invesco Regular Font with Size
 
 @param size The size of the font 
 @return Invesco regular font with size
 */

+ (UIFont *)invescoRegular:(CGFloat)size;



/* Returns Invesco Bold Font with Size
 
 @param size THe size of the Font
 @return Invesco bold font with size
 */

+ (UIFont *)invescoLight:(CGFloat)size;


/* Returns Invesco Bold Font with Size
 
 @param size THe size of the Font 
 @return Invesco bold font with size
 */

+ (UIFont *)invescoBold:(CGFloat)size;

@end
