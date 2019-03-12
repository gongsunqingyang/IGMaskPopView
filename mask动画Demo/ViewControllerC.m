//
//  ViewControllerC.m
//  mask动画Demo
//
//  Created by yanglin on 2019/3/11.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "ViewControllerC.h"
#import "IGMaskPopView.h"

@interface ViewControllerC ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *maskView;
@end

@implementation ViewControllerC
- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)clickDirectionBtn:(UIButton *)sender {
    IGMaskPopViewDirection direction = sender.tag;
    CGRect rect = CGRectMake(100, 100, 200, 300);
    
    IGMaskPopView *popView = [IGMaskPopView new];
    popView.contentView = self.view;
    [popView configWithDirection:direction
               animationDuration:0.2
                   containerRect:rect];
    [popView show];
}


@end
