//
//  TipsView.m
//  Tools
//
//  Created by 周天荣 on 2019/8/19.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "TipsView.h"

@interface TipsView()

@property (nonatomic, strong) UILabel *tipsLabel;

@end

@implementation TipsView

#pragma mark - Life Cycle
- (instancetype)initWithTips:(NSString *)tips{
    self = [super init];
    if(self){
        self.tipsLabel.text = tips;
    }
    return self;
}

- (void)didMoveToSuperview {
    if (!self.superview) {
        return;
    }
    CGRect frame = self.superview.frame;
}

#pragma mark - setupViews;
- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self setupViews];
}

- (void)setupViews{
    self.backgroundColor = [UIColor grayColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5.0;
    
    CGFloat selfWidth = self.frame.size.width;
    CGFloat selfHeight = self.frame.size.height;
    
    self.tipsLabel.frame = CGRectMake(10, 0, selfWidth - 20, selfHeight);
    [self addSubview:self.tipsLabel];
}

#pragma mark - setter / getter
- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.textColor = [UIColor whiteColor];
        _tipsLabel.font = [UIFont systemFontOfSize:18];
        _tipsLabel.numberOfLines = 0;
        _tipsLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _tipsLabel;
}

@end
