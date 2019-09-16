//
//  UIView+Tips.m
//  Tools
//
//  Created by 周天荣 on 2019/8/19.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "UIView+Tips.h"
#import "TipsView.h"
#import "squareView.h"
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, strong) TipsView *tipsView;

@end

@implementation UIView (Tips)

#pragma mark - setupViews / removeViews

- (void)setupTipViews {
    CGFloat mainWidth = [UIScreen mainScreen].bounds.size.width;
    CGPoint selfPoint = self.frame.origin;
    CGSize selfSize = self.frame.size;
    
    self.tipsView = [[TipsView alloc] initWithTips:self.tips];
    self.tipsView.frame = CGRectMake(-selfPoint.x + 10, selfSize.height, mainWidth - 20, 50);
    
    [self addSubview:self.tipsView];
}

#pragma mark - public
- (void)showTips{
    [UIView animateWithDuration:0.3 animations:^{
        if(self.tipsView.hidden){
            self.tipsView.hidden = NO;
        }else{
            self.tipsView.hidden = YES;
        }
    }];
}

#pragma mark - setter / getter
- (void)setTips:(NSString *)tips{
    if(tips) {
        objc_setAssociatedObject(self, &@selector(tips), tips, OBJC_ASSOCIATION_COPY);
        [self setupTipViews];
    }
}

- (NSString *)tips{
    return objc_getAssociatedObject(self, &@selector(tips));
}

- (void)setTipsView:(TipsView *)tipsView{
    objc_setAssociatedObject(self, &@selector(tipsView), tipsView, OBJC_ASSOCIATION_RETAIN);
}

- (TipsView *)tipsView{
    return objc_getAssociatedObject(self, &@selector(tipsView));
}

@end
