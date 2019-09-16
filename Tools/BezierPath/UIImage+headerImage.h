//
//  UIImage+headerImage.h
//  Tools
//
//  Created by 周天荣 on 2019/9/13.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (headerImage)

/// the method get header border
/// @param width border Width
/// @param color border color
/// @param image head image
- (UIImage *)imageWithBorder:(CGFloat)width color:(UIColor *)color image:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
