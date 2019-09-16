//
//  whiteView.m
//  Tools
//
//  Created by 周天荣 on 2019/9/3.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "whiteView.h"

@implementation whiteView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        
//        [self addGestureRecognizer:longGesture];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)longPress:(id)sender {
    NSLog(@"%@,longGesture",sender);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"whiteView hit");
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"whiteView point");
    return [super pointInside:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"whiteView touchBegan");
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"whiteView touchCancel");
    [super touchesCancelled:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"white touchEnd");
    [super touchesEnded:touches withEvent:event];
}
@end
