//
//  CycleScrollView.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/9.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "CycleScrollView.h"
#import "CycleScrollFlowLayout.h"
#import "CycleScrollCell.h"
@interface CycleScrollView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) NSArray *imgArr;//图片数组
@property (nonatomic,assign) NSInteger totalItems;//item总数

@property (nonatomic,strong) CycleScrollFlowLayout *flowLayout;
@property (nonatomic,strong) UILabel * titleLab;



@end

static NSString *const cellID = @"cellID";

@implementation CycleScrollView
{
    float _oldPoint;
    NSInteger _dragDirection;
}

+(instancetype)cycleScrollViewWithFrame:(CGRect)frame imageGroups:(NSArray *)imageGroups {
    CycleScrollView *cycleScrollView = [[CycleScrollView alloc]initWithFrame:frame];
    cycleScrollView.imgArr = imageGroups;
    return cycleScrollView;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self initialization];
        [self addSubview:self.collectionView];
        [self addSubview:self.titleLab];
        [self addSubview:self.pageControl];

    }
    return self;
}

-(void)initialization {
    _itemWidth = self.bounds.size.width;
    _itemSpace = 0;
    _imgCornerRadius = 0;
    _pageControl.currentPage = 0;
    _itemCount = 150;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
    self.pageControl.frame = CGRectMake(0, self.height + 80, self.width, 30);
    self.flowLayout.itemSize = CGSizeMake(_itemWidth, self.height);
    self.flowLayout.minimumLineSpacing = self.itemSpace;
    
    if(self.collectionView.contentOffset.x == 0 && _totalItems > 0) {
        //设置图片默认位置
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_totalItems * 0.5 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        _oldPoint = self.collectionView.contentOffset.x;
        self.collectionView.userInteractionEnabled = YES;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.collectionView.userInteractionEnabled = NO;
    self.pageControl.currentPage = [self currentIndex] % self.imgArr.count;
    self.titleLab.text = @[@"居民经济核对系统",@"社会救助系统",@"医疗救助一站式"][[self currentIndex] % self.imgArr.count];
}

-(NSInteger)currentIndex {
    if(self.collectionView.width == 0 || self.collectionView.height == 0)
        return 0;
    NSInteger index = 0;
    
    if (_flowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal) {//水平滑动
        index = (self.collectionView.contentOffset.x + (self.itemWidth + self.itemSpace) * 0.5) / (self.itemSpace + self.itemWidth);
    }else{
        index = (self.collectionView.contentOffset.y + _flowLayout.itemSize.height * 0.5)/ _flowLayout.itemSize.height;
    }
    return MAX(0,index);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _oldPoint = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:self.collectionView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.collectionView.userInteractionEnabled = YES;
}

//手离开屏幕的时候
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    //如果是向右滑或者滑动距离大于item的一半，则像右移动一个item+space的距离，反之向左
    float currentPoint = scrollView.contentOffset.x;
    float moveWidth = currentPoint-_oldPoint;
    int shouldPage = moveWidth/(self.itemWidth/2);
    if (velocity.x>0 || shouldPage > 0) {
        _dragDirection = 1;
    }else if (velocity.x<0 || shouldPage < 0){
        _dragDirection = -1;
    }else{
        _dragDirection = 0;
    }
}
- (void)scrollViewWillBeginDecelerating: (UIScrollView *)scrollView{
    //松开手指滑动开始减速的时候，设置滑动动画
    NSInteger currentIndex = (_oldPoint + (self.itemWidth + self.itemSpace) * 0.5) / (self.itemSpace + self.itemWidth);
    if (currentIndex == 0) {
        currentIndex = 150;
    }
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:currentIndex + _dragDirection inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

    self.itemCount = (int)currentIndex + (int)_dragDirection;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _totalItems;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CycleScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    long itemIndex = (int) indexPath.item % self.imgArr.count;
    NSString *imagePath = self.imgArr[itemIndex];
    

    UIImage *image = [UIImage imageNamed:imagePath];
    cell.imageView.image = image;
    cell.imageView.contentMode = UIViewContentModeScaleToFill;
    cell.imgCornerRadius = self.imgCornerRadius;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didSelectItemAtIndex:)]) {
        [self.delegate cycleScrollView:self didSelectItemAtIndex:[self currentIndex] % self.imgArr.count];
    }
}

-(void)setItemWidth:(CGFloat)itemWidth {
    _itemWidth = itemWidth;
    self.flowLayout.itemSize = CGSizeMake(itemWidth, self.height);
}
-(void)setItemSpace:(CGFloat)itemSpace {
    _itemSpace = itemSpace;
    self.flowLayout.minimumLineSpacing = itemSpace;
}

-(void)setImgArr:(NSArray *)imgArr {
    _imgArr = imgArr;
    self.pageControl.numberOfPages = imgArr.count;
    //如果循环则100倍，
    _totalItems = imgArr.count * 100;
    self.collectionView.scrollEnabled = YES;
    [self.collectionView reloadData];
}


-(UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        //注册cell
        [_collectionView registerClass:[CycleScrollCell class] forCellWithReuseIdentifier:cellID];
    }
    return _collectionView;
}
-(UIPageControl *)pageControl {
    if(_pageControl == nil) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    }
    return _pageControl;
}
- (UILabel *)titleLab {
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3, self.bounds.size.height, WIDTH/3, 30)];
        _titleLab.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.font = [UIFont systemFontOfSize:16];
        _titleLab.layer.cornerRadius = 15;
        _titleLab.clipsToBounds = YES;
    }
    return _titleLab;
}

-(CycleScrollFlowLayout *)flowLayout {
    if(_flowLayout == nil) {
        _flowLayout = [[CycleScrollFlowLayout alloc]init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}
@end
