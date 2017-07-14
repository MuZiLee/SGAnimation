//
//  PieChartVC.m
//  SGChartExample
//
//  Created by apple on 2017/7/12.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import "PieChartVC.h"
#import "SGPieChart.h"

@interface PieChartVC ()

@end

@implementation PieChartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *valueArr = @[@3, @2, @1, @4];
    NSArray *colorArr = @[[UIColor purpleColor], [UIColor blueColor], [UIColor orangeColor], [UIColor redColor]];
    
    CGFloat pieW = 200;
    CGFloat pieH = pieW;
    CGFloat pieX = 0.5 * ([UIScreen mainScreen].bounds.size.width - pieW);
    CGFloat pieY = 0.5 * ([UIScreen mainScreen].bounds.size.height - pieW);
    SGPieChart *pie = [[SGPieChart alloc] initWithFrame:CGRectMake(pieX, pieY, pieW, pieH)];
//    pie.pieWidth = 100;
    [self.view addSubview:pie];
    [pie setProgressValues:valueArr colors:colorArr animated:YES];
    pie.pieAnimationTime = 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
