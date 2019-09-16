//
//  ZTScreenViewController.m
//  Tools
//
//  Created by 周天荣 on 2019/9/14.
//  Copyright © 2019 周天荣. All rights reserved.
//

#import "ZTScreenViewController.h"
/// UIImagePickerController要遵守的两个协议
@interface ZTScreenViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
/// 自定义layer 包含隐式动画
@property (nonatomic, weak) CALayer *myLayer;
/// 点击屏幕的起始点
@property (nonatomic, assign) CGPoint startPoint;

@end

@implementation ZTScreenViewController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // 设置图片
    self.view.layer.contents = (__bridge id _Nullable)[UIImage imageNamed:@"back"].CGImage;
    // 设置手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
}


- (void)pan:(UIPanGestureRecognizer *)panGesture {
    CGPoint currentPoint = [panGesture locationInView:self.view];
    CGFloat x = self.startPoint.x;
    CGFloat y = self.startPoint.y;
    CGFloat width = currentPoint.x - self.startPoint.x;
    CGFloat height = currentPoint.y - self.startPoint.y;
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan: {
            self.startPoint = currentPoint;
        }
            break;
        case UIGestureRecognizerStateChanged: {
            // 还要考虑到判断手势的current和start的位置问题
            self.myLayer.anchorPoint = CGPointMake(0, 0);
            self.myLayer.position = CGPointMake(x, y);
            self.myLayer.bounds = CGRectMake(0, 0, width, height);
        }
            break;
        case UIGestureRecognizerStateEnded: {
            [self.myLayer removeFromSuperlayer];
            // 未知 如何释放掉layer
            // 通过设置为weak属性会自动释放
            
            UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, [UIScreen mainScreen].scale);
            
            CGContextRef ref = UIGraphicsGetCurrentContext();
            
            UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, width, height)];
            
            [clipPath addClip];
            
            [self.view.layer renderInContext:ref];
            
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            
            UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
            
            self.view.layer.contents = (__bridge id _Nullable)newImage.CGImage;
            
            UIGraphicsEndImageContext();
        }
            break;
        default:
            break;
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    // 回调
    UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
    // 要告诉要进入的相册类型
    pickVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    /*
     UIImagePickerControllerSourceTypePhotoLibrary,
     UIImagePickerControllerSourceTypeCamera,
     UIImagePickerControllerSourceTypeSavedPhotosAlbum 图片专辑
     */
    pickVC.delegate = self;///<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
    
    [self presentViewController:pickVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    // 回调返回info数据
    [self dismissViewControllerAnimated:YES completion:nil];// 需要dismiss
}

#pragma mark - lazy loading

- (CALayer *)myLayer {
    if (!_myLayer) {
        CALayer *layer = [CALayer layer];
        _myLayer = layer;
        //        [layer setDuration:1];
        [_myLayer setBackgroundColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:0.7].CGColor];
        [self.view.layer addSublayer:_myLayer];
    }
    return _myLayer;
}

@end
