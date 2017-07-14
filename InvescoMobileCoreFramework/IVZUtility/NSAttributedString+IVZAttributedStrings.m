//
//  NSAttributedString+IVZAttributedStrings.m
//  IVZFramework
//
//  Created by Luong, Christine on 11/12/13.
//  Copyright (c) 2013 Invesco. All rights reserved.
//

#import "NSAttributedString+IVZAttributedStrings.h"
#import "IVZConstants.h"
#import "IVZVersionBlock.h"
#import "UIFont+IVZFont.h"


@implementation NSAttributedString (IVZAttributedStrings)

+ (NSAttributedString *)attributedStringParagraphFromArray:(NSArray *)attributedStrings {
    __block NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] init];
    
    [attributedStrings enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSAttributedString *string = obj;
        [attString appendAttributedString:string];
        if (idx == attributedStrings.count) *stop = YES;
        [attString appendAttributedString:[NSAttributedString regularText:@"\n"]];
        [attString appendAttributedString:[NSAttributedString regularText:@"\n"]];
    }];
    
    return attString;
}

+ (NSAttributedString *)attributedStringFromArray:(NSArray *)attributedStrings {
    __block NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] init];
    
    [attributedStrings enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSAttributedString *string = obj;
        [attString appendAttributedString:string];
        if (idx == attributedStrings.count) *stop = YES;
    }];
    
    return attString;
}

- (NSAttributedString *)attributedStringWithReducedLineHeight { // will reduce by 0.8 or 80%
    return [self attributedStringWithReducedLineHeight:0.8];
}

- (NSAttributedString *)attributedStringWithReducedLineHeight:(CGFloat)lineHeight { // will reduce by 0.8 or 80%
    NSMutableAttributedString *attString = [self mutableCopy];
    NSRange stringRange = NSMakeRange(0, self.string.length);
    NSDictionary *attributes = [self attributesAtIndex:stringRange.location effectiveRange:&stringRange];
    
    NSInteger stringLength = self.string.length;
    NSMutableParagraphStyle *paragraphStyle = [attributes objectForKey:NSParagraphStyleAttributeName];
    if (!paragraphStyle) {
        paragraphStyle = [[NSMutableParagraphStyle alloc]init] ;
        [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
    }
    [paragraphStyle setLineHeightMultiple:lineHeight];
    
    [attString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, stringLength)];
    return [attString copy];
}

- (NSAttributedString *)attributedStringForBullet {
    NSMutableAttributedString *attString = [self mutableCopy];
    NSRange stringRange = NSMakeRange(0, self.string.length);
    NSDictionary *attributes = [self attributesAtIndex:stringRange.location effectiveRange:&stringRange];
    
    NSInteger stringLength = self.string.length;
    NSMutableParagraphStyle *paragraphStyle = [attributes objectForKey:NSParagraphStyleAttributeName];
    if (!paragraphStyle) {
        paragraphStyle = [[NSMutableParagraphStyle alloc]init] ;
        [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
    }
    [paragraphStyle setParagraphSpacing:4];
    [paragraphStyle setParagraphSpacingBefore:3];
    [paragraphStyle setFirstLineHeadIndent:0.0f];  // First line is the one with bullet point
    [paragraphStyle setHeadIndent:10.5f];
    
    [attString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, stringLength)];
    return [attString copy];
    
}

+ (NSAttributedString *)newline {
    return [[NSAttributedString alloc] initWithString:@"\n"];
}

+ (NSAttributedString *)text:(NSString *)string font:(UIFont *)font alignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode{
    if (!string) string = EMPTY_STRING;
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    NSInteger stringLength = [string length];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init] ;
    [paragraphStyle setLineBreakMode:lineBreakMode];
    if (textAlignment) [paragraphStyle setAlignment:textAlignment];
    else [paragraphStyle setAlignment:NSTextAlignmentLeft];
    
    UIColor *fontColor = textColor;
    if (font) [attString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, stringLength)];
    if (fontColor) [attString addAttribute:NSForegroundColorAttributeName value:fontColor range:NSMakeRange(0, stringLength)];
    
    [attString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, stringLength)];
    
    return attString;
}

+ (NSAttributedString *)regularText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment {
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdana size:size] alignment:textAlignment textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)boldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment {
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdanaBold size:size] alignment:textAlignment textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment {
    return [NSAttributedString text:string font:[UIFont invescoRegular:size] alignment:textAlignment textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoBoldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment {
    return [NSAttributedString text:string font:[UIFont invescoBold:size] alignment:textAlignment textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoLightText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment {
    return [NSAttributedString text:string font:[UIFont invescoLight:size] alignment:textAlignment textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)regularText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor {
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdana size:size] alignment:textAlignment textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)boldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor {
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdanaBold size:size] alignment:textAlignment textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor {
    return [NSAttributedString text:string font:[UIFont invescoRegular:size] alignment:textAlignment textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoBoldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor {
    return [NSAttributedString text:string font:[UIFont invescoBold:size] alignment:textAlignment textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoLightText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor {
    return [NSAttributedString text:string font:[UIFont invescoLight:size] alignment:textAlignment textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)regularText:(NSString *)string {
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdana size:13.0f] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)boldText:(NSString *)string {
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdanaBold size:13.0f] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoText:(NSString *)string {
    return [NSAttributedString text:string font:[UIFont invescoRegular:13.0f] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoBoldText:(NSString *)string {
    return [NSAttributedString text:string font:[UIFont invescoBold:14.0f] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoLightText:(NSString *)string {
    return [NSAttributedString text:string font:[UIFont invescoLight:14.0f] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)regularText:(NSString *)string size:(CGFloat)fontSize{
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdana size:fontSize] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)boldText:(NSString *)string size:(CGFloat)fontSize{
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdanaBold size:fontSize] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoText:(NSString *)string size:(CGFloat)fontSize{
    return [NSAttributedString text:string font:[UIFont invescoRegular:fontSize] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoBoldText:(NSString *)string size:(CGFloat)fontSize{
    return [NSAttributedString text:string font:[UIFont invescoBold:fontSize] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoLightText:(NSString *)string size:(CGFloat)fontSize{
    return [NSAttributedString text:string font:[UIFont invescoLight:fontSize] alignment:NSTextAlignmentLeft textColor:[UIColor blackColor] lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)regularText:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)textColor {
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdana size:fontSize] alignment:NSTextAlignmentLeft textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)boldText:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)textColor{
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdanaBold size:fontSize] alignment:NSTextAlignmentLeft textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoText:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)textColor{
    return [NSAttributedString text:string font:[UIFont invescoRegular:fontSize] alignment:NSTextAlignmentLeft textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoBoldText:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)textColor {
    return [NSAttributedString text:string font:[UIFont invescoBold:fontSize] alignment:NSTextAlignmentLeft textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)invescoLightText:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)textColor {
    return [NSAttributedString text:string font:[UIFont invescoLight:fontSize] alignment:NSTextAlignmentLeft textColor:textColor lineBreakMode:NSLineBreakByWordWrapping];
}

+ (NSAttributedString *)regularText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode {
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdana size:size] alignment:textAlignment textColor:textColor lineBreakMode:lineBreakMode];
}

+ (NSAttributedString *)boldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode {
    return [NSAttributedString text:string font:[UIFont fontWithName:kFontVerdanaBold size:size] alignment:textAlignment textColor:textColor lineBreakMode:lineBreakMode];
}

+ (NSAttributedString *)invescoText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode {
    return [NSAttributedString text:string font:[UIFont invescoRegular:size] alignment:textAlignment textColor:textColor lineBreakMode:lineBreakMode];
}

+ (NSAttributedString *)invescoBoldText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode {
    return [NSAttributedString text:string font:[UIFont invescoBold:size] alignment:textAlignment textColor:textColor lineBreakMode:lineBreakMode];
}

+ (NSAttributedString *)invescoLightText:(NSString *)string size:(CGFloat)size alignment:(NSTextAlignment)textAlignment color:(UIColor *)textColor lineBreakMode:(NSLineBreakMode)lineBreakMode {
    return [NSAttributedString text:string font:[UIFont invescoLight:size] alignment:textAlignment textColor:textColor lineBreakMode:lineBreakMode];
}


- (CGSize)sizeOfAttributedTextInRect:(CGSize)rectSize {
    __block CGSize sizedValue = [self boundingRectWithSize:rectSize options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    
    [IVZVersionBlock execute6x:^{
        // add additional size due to the line height difference
        sizedValue.height += 20.0f;
    } newer:^{
        // do not add any additional values due to the size/line height difference
    }];
    return sizedValue;
}

//+ (NSAttributedString *)attributedStringFromHTML:(NSString *)htmlString atSize:(CGFloat)size {
//    
//}

@end
