//
//  NSAttributedString+IVZAttributedStrings.h
//  IVZFramework
//
//  Created by Luong, Christine on 11/12/13.
//  Copyright (c) 2013 Invesco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (IVZAttributedStrings)
- (NSAttributedString *)attributedStringWithReducedLineHeight;
- (NSAttributedString *)attributedStringWithReducedLineHeight:(CGFloat)lineHeight;
- (NSAttributedString *)attributedStringForBullet;

+ (NSAttributedString *)attributedStringParagraphFromArray:(NSArray *)attributedStrings;
+ (NSAttributedString *)attributedStringFromArray:(NSArray *)attributedStrings;
+ (NSAttributedString *)newline;
+ (NSAttributedString *)text:(NSString *)string font:(UIFont *)font alignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode;
// html
//+ (NSAttributedString *)attributedStringFromHTML:(NSString *)htmlString atSize:(CGFloat)size;

// text
+ (NSAttributedString *)regularText:(NSString *)string;
+ (NSAttributedString *)boldText:(NSString *)string;
+ (NSAttributedString *)invescoText:(NSString *)string;
+ (NSAttributedString *)invescoBoldText:(NSString *)string;
+ (NSAttributedString *)invescoLightText:(NSString *)string;

// text size
+ (NSAttributedString *)regularText:(NSString *)string size:(CGFloat)fontSize;
+ (NSAttributedString *)boldText:(NSString *)string size:(CGFloat)fontSize;
+ (NSAttributedString *)invescoText:(NSString *)string size:(CGFloat)fontSize;
+ (NSAttributedString *)invescoBoldText:(NSString *)string size:(CGFloat)fontSize;
+ (NSAttributedString *)invescoLightText:(NSString *)string size:(CGFloat)fontSize;

// text color
+ (NSAttributedString *)regularText:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)textColor;
+ (NSAttributedString *)boldText:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)textColor;
+ (NSAttributedString *)invescoText:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)textColor;
+ (NSAttributedString *)invescoBoldText:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)textColor;
+ (NSAttributedString *)invescoLightText:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)textColor;

// regular text with custom font size and text alignment
+ (NSAttributedString *)regularText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment;
+ (NSAttributedString *)boldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment;
+ (NSAttributedString *)invescoText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment;
+ (NSAttributedString *)invescoBoldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment;
+ (NSAttributedString *)invescoLightText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment;

// custom  text colors
+ (NSAttributedString *)regularText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor;
+ (NSAttributedString *)boldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor;
+ (NSAttributedString *)invescoText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor;
+ (NSAttributedString *)invescoBoldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor;
+ (NSAttributedString *)invescoLightText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor;

// invesco font, size, color, alignment, linebreak if non word wrap
+ (NSAttributedString *)regularText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode;
+ (NSAttributedString *)boldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode;
+ (NSAttributedString *)invescoText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode;
+ (NSAttributedString *)invescoBoldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode;
+ (NSAttributedString *)invescoLightText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode;


// text size
- (CGSize)sizeOfAttributedTextInRect:(CGSize)rectSize;

@end
