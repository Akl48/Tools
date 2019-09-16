//
//  UIImage+headerImage.m
//  Tools
//
//  Created by 周天荣 on 2019/9/13.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "UIImage+headerImage.h"

@implementation UIImage (headerImage)

- (UIImage *)imageWithBorder:(CGFloat)width color:(UIColor *)color image:(UIImage *)image {
    
    UIGraphicsBeginImageContextWithOptions(image.size, YES, [UIScreen mainScreen].scale);
    
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width + width * 2, image.size.height + width * 2)];
    [[UIColor redColor] setFill];
    [borderPath fill];
    
    UIBezierPath *imagePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(width, width, image.size.width, image.size.height)];
    [imagePath addClip];
    [image drawAtPoint:CGPointMake(width ,width)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
