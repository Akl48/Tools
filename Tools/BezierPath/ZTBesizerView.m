//
//  ZTBesizerView.m
//  Tools
//
//  Created by 周天荣 on 2019/9/13.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTBesizerView.h"

@interface ZTBesizerView ()

@property (nonatomic, strong) CALayer *myLayer;
@property (nonatomic, strong) UIImageView *myImageView;
@property (nonatomic, assign) CGPoint startPoint;

@end


@implementation ZTBesizerView

- (void)layoutSubviews {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.frame];
    
    imageView.image = [UIImage imageNamed:@"back"];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:pan];
    
    [self addSubview:imageView];
}

- (void)pan:(UIPanGestureRecognizer *)panGesture {
    CGPoint currentPoint = [panGesture locationInView:self];
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan: {
            self.startPoint = currentPoint;
        }
            break;
        case UIGestureRecognizerStateChanged: {
            CGFloat x = self.startPoint.x;
            CGFloat y = self.startPoint.y;
            CGFloat width = currentPoint.x - self.startPoint.x;
            CGFloat height = currentPoint.y - self.startPoint.y;
            
            self.myLayer.position = CGPointMake(x, y);
            self.myLayer.bounds = CGRectMake(0, 0, width, height);
        }
            break;
        case UIGestureRecognizerStateEnded: {
       //     [self.myLayer removeFromSuperlayer];
        }
            break;
        default:
            break;
    }
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)Screenshot {
    UIGraphicsBeginImageContext(self.frame.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self.layer renderInContext:ctx];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    NSData *data = UIImagePNGRepresentation(image);
    
    UIGraphicsEndImageContext();
}

#pragma mark - draw Header
- (void)drawHeadImage {
//    加载图片
    UIImage *image = [UIImage imageNamed:@"头像"];
//    开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.frame.size, YES, [UIScreen mainScreen].scale);
//    绘制贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//    裁剪
    [path addClip];
//    将Image绘制在点上
    [image drawAtPoint:CGPointZero];
//    将绘制好的图图形上下文加载到图片上
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    结束图形上下文
    UIGraphicsEndImageContext();
}

#pragma mark - getter

- (CALayer *)myLayer {
    if (!_myLayer) {
        _myLayer = [CALayer layer];
        [_myLayer setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7].CGColor];
        [self.myImageView.layer addSublayer:_myLayer];
    }
    return _myLayer;
}
@end
