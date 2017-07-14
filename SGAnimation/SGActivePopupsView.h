//
//  如遇到问题或有更好方案，请通过以下方式进行联系
//      QQ：1357127436
//      Email：kingsic@126.com
//      GitHub：https://github.com/kingsic/SGAnimation.git
//
//  SGActivePopupsView.h
//  SGAnimationExample
//
//  Created by apple on 2017/6/13.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedImageBlock)();

@interface SGActivePopupsView : UIView
/// imageName
@property (nonatomic, strong) UIImage *imageName;
/// 弹出 image 所需时间（默认，0.3）
@property (nonatomic, assign) CGFloat popupsTimeInterval;
/// SelectedImageBlock
@property (nonatomic, copy) SelectedImageBlock selectedImageBlock;
/// 显示 SGActivePopupsView
- (void)SG_show;

@end
