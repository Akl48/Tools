//
//  ZTCoreViewController.m
//  Tools
//
//  Created by 周天荣 on 2019/9/16.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTCoreViewController.h"

@interface ZTCoreViewController ()

@end

@implementation ZTCoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createBasicAnimation];
    [self createKeyAnimation];
}

#pragma mark - create animation
- (void)createBasicAnimation {
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    
    basicAnimation.keyPath = @"postion";
    basicAnimation.toValue = @400;
    // 在动画完成时候会自动删除动画
    basicAnimation.removedOnCompletion = NO;
    // 设置动画完成时要保存的状态
    basicAnimation.fillMode = kCAFillModeForwards;
    // 设置重复次数
    basicAnimation.repeatCount = HUGE;
    // 设置执行时间
    basicAnimation.duration = 0.5;
    // 怎么执行怎么返回
    basicAnimation.autoreverses = YES;
    
    [self.view.layer addAnimation:basicAnimation forKey:@"basicAnimation"];
}

- (void)createKeyAnimation {
    // 根据路径做动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    
    keyAnimation.keyPath = @"transform.rotation";
    // 进行多个值的动画
    keyAnimation.values = @[@(-5*M_PI/180),@(5*M_PI/180),@(-5*M_PI/180)];
    keyAnimation.repeatCount = HUGE;
    keyAnimation.duration = 0.1;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 设置路径
    keyAnimation.path = path.CGPath;
    // Determines whether objects animating along the path rotate to match the path tangent. 设置自动旋转mode
    keyAnimation.rotationMode = @"autoReverse"; // auto | autoReverse
    // Specifies how intermediate keyframe values are calculated by the receiver. 设置时间计算mode
    keyAnimation.calculationMode = @"paced"; // CAAnimationCalculationMode
    
    [self.view.layer addAnimation:keyAnimation forKey:@"keyAnimation"];
}

- (void)createTransAnimation {
    
    CATransition *trans = [CATransition animation];
    // Specifies the predefined transition type.
    trans.type = @"cube";
    // Specifies an optional subtype that indicates the direction for the predefined motion-based transitions.方向
    trans.subtype = @"fromLeft";
    // 开始进度
    trans.startProgress = 0.1;
    // 结束进度
    trans.endProgress = 0.2;
}

- (void)animationGroup {
    CABasicAnimation *base = [CABasicAnimation animation];
    CAKeyframeAnimation *key = [CAKeyframeAnimation animation];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[base,key];
    // 设置组内动画
    group.duration = 1.0;
    [self.view.layer addAnimation:group forKey:@"group"];
}

@end
