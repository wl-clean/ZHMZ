//
//  CycleScrollView.h
//  zhmz
//
//  Created by 魏亮 on 2018/3/9.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycleScrollView : UIView

@property (nonatomic,strong) UICollectionView *collectionView;
//cell滑动个数
@property (nonatomic,assign) int itemCount;
//cell宽度
@property (nonatomic,assign) CGFloat itemWidth;
//cell间距
@property (nonatomic,assign) CGFloat itemSpace;
//imagView圆角，默认为0；
@property (nonatomic,assign) CGFloat imgCornerRadius;
//分页控制器
@property (nonatomic,strong) UIPageControl *pageControl;
//代理方法
@property (nonatomic,weak) id delegate;

//初始化方法
+(instancetype)cycleScrollViewWithFrame:(CGRect)frame imageGroups:(NSArray<NSString *> *)imageGroups;

@end

@protocol CycleScrollViewDelegate <NSObject>
/** 点击图片回调 */
- (void)cycleScrollView:(CycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
@end
