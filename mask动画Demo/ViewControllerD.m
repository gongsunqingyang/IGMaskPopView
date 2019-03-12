//
//  ViewControllerD.m
//  mask动画Demo
//
//  Created by yanglin on 2019/3/12.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "ViewControllerD.h"
#import "CustomMaskPopView.h"

@interface ViewControllerD ()
@property (nonatomic, strong) UIVisualEffectView *effectView;
@end

@implementation ViewControllerD

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(30, 100, 300, 80);
    [effectView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)]];
    self.effectView = effectView;
    [self.view addSubview:effectView];
}

- (void)click {
    CGRect rect = CGRectMake(_effectView.frame.origin.x, CGRectGetMaxY(_effectView.frame), _effectView.frame.size.width, 300);
    
    CustomMaskPopView *popView = [CustomMaskPopView new];
    popView.contentView = self.view;
    [popView configWithDirection:IGMaskPopViewDirectionDown animationDuration:0.7 containerRect:rect];
    [popView show];
}


@end
