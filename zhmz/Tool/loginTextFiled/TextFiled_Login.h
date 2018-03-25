//
//  TextFiled_Login.h
//  zhmz
//
//  Created by 魏亮 on 2018/3/8.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextFiled_Login : UIView

@property(nonatomic,copy)NSString * text;
@property(nonatomic,assign)float cornerRadius;


- (instancetype)initWithFrame:(CGRect)frame img:(NSString *)img text:(NSString *)text;

@end
