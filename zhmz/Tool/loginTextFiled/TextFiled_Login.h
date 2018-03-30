//
//  TextFiled_Login.h
//  zhmz
//
//  Created by 魏亮 on 2018/3/8.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextFiled_Login : UIView

@property(nonatomic,assign)float cornerRadius;
@property(nonatomic,assign)BOOL safeInput;

@property(nonatomic,strong)UITextField * textField;


- (instancetype)initWithFrame:(CGRect)frame img:(NSString *)img text:(NSString *)text;

@end
