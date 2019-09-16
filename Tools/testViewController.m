//
//  testViewController.m
//  Tools
//
//  Created by 周天荣 on 2019/9/2.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

//- (void)loadView {
//    NSLog(@"loadView");//在VC的view加载的时候调用 根据nib来调用
//    [super loadView];
//}

- (void)awakeFromNib {
    NSLog(@"awakeFromNib"); // 如果是用nib初始化的时候会调用这个方法
    [self.view setBackgroundColor:[UIColor greenColor]];
    [super awakeFromNib];
}
- (IBAction)clickbutton:(id)sender {
}

//- (instancetype)init {
//    if (self = [super init]) {
//        NSLog(@"init");
//    }
//    return self;
//}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"initWithCoder");
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSLog(@"initWithNib");
    }
    return self;
}
- (void)viewDidLoad {
    NSLog(@"Viewload");
    [super viewDidLoad];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
