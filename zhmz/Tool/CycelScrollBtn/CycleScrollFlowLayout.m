//
//  CycleScrollFlowLayout.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/9.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "CycleScrollFlowLayout.h"

@implementation CycleScrollFlowLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    // 1.获取cell对应的attributes对象
    NSArray* arrayAttrs = [[NSArray alloc] initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
    
    // 2.计算整体的中心点的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width * 0.5;
    
    // 3.修改一下attributes对象
    for (UICollectionViewLayoutAttributes *attr in arrayAttrs) {
        // 3.1 计算每个cell的中心点距离
        CGFloat distance = ABS(attr.center.x - centerX);
        
        // 3.2 距离越大，缩放比越小，距离越小，缩放比越大
        CGFloat factor = 0.001;
        CGFloat scale = 1 / (1 + distance * factor);
        attr.alpha = scale;
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return arrayAttrs;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return true;
}

@end
