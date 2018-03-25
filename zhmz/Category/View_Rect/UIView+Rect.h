//
//  UIView+Rect.h
//  zhmz
//
//  Created by 魏亮 on 2018/3/8.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rect)
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat centerX;
@property (nonatomic, assign)CGFloat centerY;
@property (nonatomic, assign)CGSize size;
@property(nonatomic, assign) IBInspectable CGFloat borderWidth;
@property(nonatomic, assign) IBInspectable UIColor *borderColor;
@property(nonatomic, assign) IBInspectable CGFloat cornerRadius;

//水平居中
- (void)alignHorizontal;
//垂直居中
- (void)alignVertical;
//判断是否显示在主窗口上面
- (BOOL)isShowOnWindow;//@return 是否

- (UIViewController *)viewController;

@end
