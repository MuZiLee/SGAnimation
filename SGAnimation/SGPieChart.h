//
//  如遇到问题或有更好方案，请通过以下方式进行联系
//      QQ：1357127436
//      Email：kingsic@126.com
//      GitHub：https://github.com/kingsic/SGAnimation.git
//
//  SGPieChart.h
//  SGAnimationExample
//
//  Created by apple on 2017/7/12.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGPieChart : UIView
/// 饼形宽度（默认，25）
@property (nonatomic, assign) CGFloat pieWidth;
/// 饼形进度所需时间（默认，progress 值）
@property (nonatomic, assign) CFTimeInterval pieAnimationTime;

/// 在调用之前想要改变圆形进度宽度，一定要先设置 pieWidth；否则 pieWidth 属性不起作用
- (void)setProgressValues:(NSArray *)values colors:(NSArray *)colors animated:(BOOL)animated;
/// 在调用之前想要改变圆形进度宽度，一定要先设置 pieWidth；否则 pieWidth 属性不起作用
- (void)setProgressValues:(NSArray *)values colors:(NSArray *)colors animated:(BOOL)animated delay:(CFTimeInterval)delay;

@end
