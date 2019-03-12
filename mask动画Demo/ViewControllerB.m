//
//  ViewControllerB.m
//  mask动画Demo
//
//  Created by yanglin on 2019/3/7.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "ViewControllerB.h"
#import "IGPopView.h"
#import "CustomPopView.h"

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)defaultPopView:(id)sender {
    IGPopView *popView = [IGPopView new];
    popView.contentView = self.view;
    [popView show];
}

- (IBAction)customPopView:(id)sender {
    CustomPopView *popView = [CustomPopView new];
    popView.contentView = self.navigationController.view;
    popView.dismissOnTouchOutside = NO;
    popView.coverColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
    [popView show];
    
}



@end
