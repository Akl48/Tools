//
//  squareView.m
//  Tools
//
//  Created by 周天荣 on 2019/8/19.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "squareView.h"

@implementation squareView

- (void)drawRect:(CGRect)rect {
    CGFloat selfWidth = self.frame.size.width;
    CGFloat selfHeight = self.frame.size.height;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, selfHeight)];
    [path addLineToPoint:CGPointMake(selfWidth, selfHeight)];
    [path addLineToPoint:CGPointMake(selfWidth / 2, 0)];
    [path closePath];
    
    UIColor *backColor = [UIColor grayColor];
    [backColor set];
    [path fill];
    [path stroke];
}

@end
