//
//  TextFiled_Login.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/8.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "TextFiled_Login.h"

@interface TextFiled_Login()

@end

@implementation TextFiled_Login

- (instancetype)initWithFrame:(CGRect)frame img:(NSString *)img text:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        UITextField * textF = [[UITextField alloc]init];
        textF.placeholder = text;
        textF.secureTextEntry = NO;
        textF.tag = 1001;
        if (img == nil) {
            textF.frame = CGRectMake(frame.size.height/2, frame.size.height/4, frame.size.width-frame.size.height, frame.size.height/2);
        } else {
            UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, frame.size.height/4, frame.size.height/2, frame.size.height/2)];
            imgView.image = [UIImage imageNamed:img];
            textF.frame = CGRectMake(frame.size.height/2+20, frame.size.height/4, frame.size.width-frame.size.height, frame.size.height/2);
            [self addSubview:imgView];
        }
        [self addSubview:textF];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldTextDidChangeOneCI:) name:UITextFieldTextDidChangeNotification object:textF];
    }
    return self;
}
-(void)textFieldTextDidChangeOneCI:(NSNotification *)notification
{
    UITextField *textfield=[notification object];
    self.text = textfield.text;
}
- (void)setCornerRadius:(float)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}
- (void)setSafeInput:(BOOL)safeInput {
    UITextField * text = [self viewWithTag:1001];
    text.secureTextEntry = YES;
}
@end
