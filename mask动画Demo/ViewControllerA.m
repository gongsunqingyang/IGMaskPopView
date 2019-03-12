//
//  ViewController.m
//  mask动画Demo
//
//  Created by yanglin on 2017/8/19.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#import "ViewControllerA.h"

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 背景
    CALayer *bgLayer = [CALayer layer];
    bgLayer.frame = CGRectMake(50, 100, 100, 300);
    bgLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1].CGColor;
    [self.view.layer addSublayer:bgLayer];

    UIImageView *iv0 = [[UIImageView alloc] init];
    iv0.frame = bgLayer.frame;
    iv0.image = [UIImage imageNamed:@"2"];
    iv0.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    [self.view addSubview:iv0];
    
    UIImageView *iv1 = [[UIImageView alloc] init];
    iv1.frame = CGRectMake(200, 100, 100, 300);
    iv1.image = [UIImage imageNamed:@"2"];
    iv1.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    [self.view addSubview:iv1];
    
    // mask
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(0, 0, iv0.bounds.size.height*2, iv0.bounds.size.height*2);
    maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    maskLayer.cornerRadius = iv0.bounds.size.height;
    maskLayer.position = CGPointMake(iv0.bounds.size.width/2, 0);
    
    // 添加遮盖
    iv0.layer.mask = maskLayer;
    
    // 动画
    CAKeyframeAnimation *scaleAni = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.values = @[@(0), @(.8), @(1), @(.8), @(.5), @(0)];
    scaleAni.keyTimes = @[@(0), @(.2), @(.4), @(.6), @(.8), @(1)];
    scaleAni.duration = 3;
    scaleAni.repeatCount = CGFLOAT_MAX;
    [maskLayer addAnimation:scaleAni forKey:nil];
    
    CAKeyframeAnimation *opacityAni = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAni.values = @[@(0), @(.8), @(1), @(.8), @(.5), @(0)];
    opacityAni.keyTimes = @[@(0), @(.2), @(.4), @(.6), @(.8), @(1)];
    opacityAni.duration = 3;
    opacityAni.repeatCount = CGFLOAT_MAX;
    [iv0.layer addAnimation:opacityAni forKey:nil];
}




@end
