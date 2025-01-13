//
//  ViewControllerY.m
//  mask动画Demo
//
//  Created by yanglin on 2019/3/14.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "ViewControllerY.h"
#import "YLPopupView.h"
#import "CustomPopupView.h"
#import "CustomView.h"

@interface ViewControllerY ()

@end

@implementation ViewControllerY

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)popup:(id)sender {
    [YLPopupView showTo:self.view animated:YES];
}

- (IBAction)customView:(id)sender {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
    imageView.image = [UIImage imageNamed:@"2"];

    YLPopupView *popup = [YLPopupView showTo:self.navigationController.view animated:YES];
    popup.customView = imageView;
}

- (IBAction)customPopupView:(id)sender {
    
    YLPopupView *popup = [YLPopupView showTo:self.navigationController.view animated:YES];
    popup.hideOnTouch = NO;
    
    CustomView *customView = [CustomView new];
    customView.closeBlock = ^{
        [popup hideAnimated:YES];
    };
    popup.customView = customView;
}

@end
