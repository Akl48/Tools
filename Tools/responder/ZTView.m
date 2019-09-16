//
//  ZTView.m
//  Tools
//
//  Created by 周天荣 on 2019/8/30.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTView.h"

@interface ZTView ()<UIGestureRecognizerDelegate>

@end

@implementation ZTView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.alpha <= 0.01 || !self.userInteractionEnabled || !self.isHidden) {
        return nil;
    }
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    for (UIView *view in self.subviews) {
        CGPoint childPoint = [view convertPoint:point toView:self];
        UIView *hitView = [view hitTest:childPoint withEvent:event];
        if (hitView) {
            return hitView;
        }
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint touchPoint = [touch locationInView:self];
    if (touchPoint.x > self.frame.size.width * 0.5)
        return YES;
    return NO;
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    // 想让控件随着手指移动而移动,监听手指移动
    // 获取UITouch对象
    UITouch *touch = [touches anyObject];
    // 获取当前点的位置
    CGPoint curP = [touch locationInView:self];
    // 获取上一个点的位置
    CGPoint preP = [touch previousLocationInView:self];
    // 获取它们x轴的偏移量,每次都是相对上一次
    CGFloat offsetX = curP.x - preP.x;
    // 获取y轴的偏移量
    CGFloat offsetY = curP.y - preP.y;
    // 修改控件的形变或者frame,center,就可以控制控件的位置
    // 形变也是相对上一次形变(平移)
    // CGAffineTransformMakeTranslation:会把之前形变给清空,重新开始设置形变参数
    // make:相对于最原始的位置形变
    // CGAffineTransform t:相对这个t的形变的基础上再去形变
    // 如果相对哪个形变再次形变,就传入它的形变
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    
    // [self updateConstraintsIfNeeded];
    // [self invalidateIntrinsicContentSize];
    
    // [self layoutIfNeeded];
    
}


- (void)setNeedsLayout {
    NSLog(@"%s",__func__);
    [super setNeedsLayout];
}

- (void)setNeedsDisplay {
    NSLog(@"%s",__func__);
    [super setNeedsDisplay];
}

- (void)setNeedsUpdateConstraints {
    NSLog(@"%s",__func__);
    [super setNeedsUpdateConstraints];
}

- (void)layoutSubviews {
    NSLog(@"%s",__func__);
    [super layoutSubviews];
}

- (void)drawRect:(CGRect)rect {
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tap:)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    NSLog(@"%s",__func__);
    [super drawRect:rect];
}

- (void)tap:(id)sender {
    NSLog(@"tap");
}

- (void)updateConstraints {
    NSLog(@"%s",__func__);
    [super updateConstraints];
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    printf("layoutSublayers");
}

@end
