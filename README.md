
## 效果图

![](https://github.com/kingsic/SGAnimation/raw/master/Gif/sorgle.gif) 


## 主要内容的介绍

* `跑马灯`<br>

* `活动弹窗`<br>

* `饼图`<br>


## 代码介绍（详细使用，请参考 Demo）

* 将项目中 SGAnimation 文件夹导入工程

* 导入 #import "SGAnimation.h" 头文件

```Objective-C
    /// 跑马灯
    SGHorseRaceLampView *HRLView = [[SGHorseRaceLampView alloc] init];
    HRLView.frame = CGRectMake(0, 150, self.view.frame.size.width, 30);
    HRLView.title = @"使用 UIView 动画进行封装的跑马灯效果，Block 进行事件点击处理";
    HRLView.imageNage = @"horn_icon";
    [self.view addSubview:HRLView];
    HRLView.selectedBlock = ^{
        NSLog(@"被点击了");
    };
    
    
    /// 活动弹窗
    SGActivePopupsView *APView = [[SGActivePopupsView alloc] init];
    APView.imageName = [UIImage imageNamed:@"activePopus_imageView_icon"];
    APView.selectedImageBlock = ^{
        NSLog(@"图片被点击了");
    };
    [APView SG_show];
    
    
    /// 饼形视图
    NSArray *valueArr = @[@3, @2, @1, @4];
    NSArray *colorArr = @[[UIColor purpleColor], [UIColor blueColor], [UIColor orangeColor], [UIColor redColor]];
    CGFloat pieW = 200;
    CGFloat pieH = pieW;
    CGFloat pieX = 0.5 * ([UIScreen mainScreen].bounds.size.width - pieW);
    CGFloat pieY = 0.5 * ([UIScreen mainScreen].bounds.size.height - pieW);
    SGPieChart *pie = [[SGPieChart alloc] initWithFrame:CGRectMake(pieX, pieY, pieW, pieH)];
    [self.view addSubview:pie];
    [pie setProgressValues:valueArr colors:colorArr animated:YES];
```


## 版本介绍

* 2017-7-14 --> 新增饼形视图


## Concluding remarks

* 如在使用中, 遇到什么问题或有更好建议者, 请记得 [Issues me](https://github.com/kingsic/SGAnimation/issues) 或 kingsic@126.com 邮箱联系我

