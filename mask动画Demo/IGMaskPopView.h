//
//  IGMaskPopView.h
//  mask动画Demo
//
//  Created by yanglin on 2019/3/8.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "IGPopView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, IGMaskPopViewDirection) {
    IGMaskPopViewDirectionUp,
    IGMaskPopViewDirectionLeft,
    IGMaskPopViewDirectionDown,
    IGMaskPopViewDirectionRight,
};

@interface IGMaskPopView : IGPopView
@property (nonatomic, strong) UIView *containerView;

- (void)configWithDirection:(IGMaskPopViewDirection)direction
          animationDuration:(CGFloat)animationDuration
              containerRect:(CGRect)containerRect;


@end

NS_ASSUME_NONNULL_END
