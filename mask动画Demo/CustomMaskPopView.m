//
//  IGGamePopView.m
//  mask动画Demo
//
//  Created by yanglin on 2019/3/8.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "CustomMaskPopView.h"

@interface CustomMaskPopView ()
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CustomMaskPopView

- (void)setupUI {
    [super setupUI];
    
    self.coverColor = [UIColor clearColor];
    [self.containerView addSubview:self.imageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _imageView.frame = CGRectMake(5, 5, self.containerView.bounds.size.width - 5 * 2, self.containerView.bounds.size.height - 5 * 2);
}

#pragma mark - Getter
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    }
    return _imageView;
}

@end
