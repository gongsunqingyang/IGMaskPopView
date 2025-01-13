//
//  CustomView.h
//  mask动画Demo
//
//  Created by yanglin on 2019/3/15.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomView : UIView
@property (nonatomic, copy) void (^closeBlock)();
@end

NS_ASSUME_NONNULL_END
