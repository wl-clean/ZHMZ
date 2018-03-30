//
//  NSString+Add.h
//  zhmz
//
//  Created by 魏亮 on 2018/3/26.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Add)

- (NSString *)getMd5_32Bit;

- (float)getAttributeWidthWithFontSize:(int)fontSize;

+ (BOOL) isEmptyString:(NSString *)string;
@end
