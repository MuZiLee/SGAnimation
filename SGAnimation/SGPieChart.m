//
//  如遇到问题或有更好方案，请通过以下方式进行联系
//      QQ：1357127436
//      Email：kingsic@126.com
//      GitHub：https://github.com/kingsic/SGAnimation.git
//
//  SGPieChart.m
//  SGAnimationExample
//
//  Created by apple on 2017/7/12.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import "SGPieChart.h"

@interface SGPieChart ()
@property (nonatomic, strong) CAShapeLayer *bottomLayer;
@property (nonatomic, assign) CGFloat totalValue;
@property (nonatomic, strong) NSArray *valueArr;
@property (nonatomic, strong) NSArray *colorArr;
@property (nonatomic, strong) NSMutableArray *subLayerArr;
@end

@implementation SGPieChart

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initialization];
        [self setupSubviews];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialization];
    [self setupSubviews];
}

- (void)initialization {
    _pieWidth = 40;
    _pieAnimationTime = 1.0;
}

- (void)setupSubviews {
    [self.layer addSublayer:self.bottomLayer];
}

- (NSMutableArray *)subLayerArr {
    if (!_subLayerArr) {
        _subLayerArr = [NSMutableArray array];
    }
    return _subLayerArr;
}

- (CAShapeLayer *)bottomLayer {
    if (!_bottomLayer) {
        _bottomLayer = [CAShapeLayer layer];
        _bottomLayer.fillColor = [UIColor clearColor].CGColor;
        _bottomLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        _bottomLayer.strokeStart = 0.0;
        _bottomLayer.strokeEnd = 1.0;
        _bottomLayer.zPosition = 1;
        _bottomLayer.lineWidth = _pieWidth;
    }
    return _bottomLayer;
}

- (void)setProgressValues:(NSArray *)values colors:(NSArray *)colors animated:(BOOL)animated {
    [self setProgressValues:values colors:colors animated:animated delay:0.0];
}

- (void)setProgressValues:(NSArray *)values colors:(NSArray *)colors animated:(BOOL)animated delay:(CFTimeInterval)delay {
    self.valueArr = [NSArray arrayWithArray:values];
    self.colorArr = [NSArray arrayWithArray:colors];
    
    // 计算 totalValue 值
    for (int i = 0; i < self.valueArr.count; i++) {
        self.totalValue += [self.valueArr[i] floatValue];
    }
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    CGPoint point = CGPointMake(0.5 * width, 0.5 * height);
    CGFloat radius = 0;
    if (width >= height) {
        radius = 0.5 * (height - self.pieWidth);
    } else {
        radius = 0.5 * (width - self.pieWidth);
    }
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:- M_PI_2 endAngle:3 * M_PI_2 clockwise:YES];
    self.bottomLayer.path = path.CGPath;
    
    CGFloat startAngle = 0.0;
    CGFloat endAngle = 0.0;
    for (int i = 0; i < self.valueArr.count; i++) {
        endAngle = [self.valueArr[i] floatValue] / _totalValue + startAngle;
        
        CAShapeLayer *pieLayer = [CAShapeLayer layer];
        pieLayer.fillColor = [UIColor clearColor].CGColor;
        pieLayer.strokeStart = startAngle;
        pieLayer.strokeEnd = endAngle;
        pieLayer.lineWidth = self.pieWidth;
        pieLayer.zPosition = 2;
        pieLayer.path = path.CGPath;
        if (i > self.colorArr.count - 1 || !self.colorArr || self.colorArr.count == 0) { // 异常情况处理
            pieLayer.strokeColor = [self randomColor].CGColor;
        } else {
            pieLayer.strokeColor = ((UIColor *)self.colorArr[i]).CGColor;
        }
        [self.layer addSublayer:pieLayer];
        
        startAngle = endAngle;
        [self.subLayerArr addObject:pieLayer];
    }
    
    self.layer.mask = _bottomLayer;
    
    if (animated) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self addAnimation];
        });
    }
}

- (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random() % 255 / 255.0f green:arc4random() % 255 / 255.0f blue:arc4random() % 255 / 255.0f alpha:1.0];
}

- (void)addAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = self.pieAnimationTime;
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = NO;
    [self.bottomLayer addAnimation:animation forKey:nil];
}

#pragma mark - - - set
- (void)setPieWidth:(CGFloat)pieWidth {
    _pieWidth = pieWidth;
    _bottomLayer.lineWidth = pieWidth;
}

- (void)setPieAnimationTime:(CFTimeInterval)pieAnimationTime {
    _pieAnimationTime = pieAnimationTime;
}


@end

