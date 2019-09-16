//
//  ZTButton.m
//  Tools
//
//  Created by 周天荣 on 2019/9/4.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTButton.h"

@implementation ZTButton

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"begin tracking");
    return [super beginTrackingWithTouch:touch withEvent:event];
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"end tracking");
    [super endTrackingWithTouch:touch withEvent:event];
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    NSLog(@"cancel tracking");
    [super cancelTrackingWithEvent:event];
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    NSLog(@"continue tracking");
    return [super continueTrackingWithTouch:touch withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"ZTButton touchBegin");
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"ZTButton touchCancel");
    [super touchesCancelled:touches withEvent:event];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"ZTButton touchEnd");
    [super touchesEnded:touches withEvent:event];
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"buttonSendAction");
    [super sendAction:action to:target forEvent:event];
}
@end
