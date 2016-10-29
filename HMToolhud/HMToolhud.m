//
//  HMToolhud.m
//  H2ome
//
//  Created by hy on 16/8/6.
//  Copyright © 2016年 Shanghai h2ome information technology co., LTD. All rights reserved.
//

#import "HMToolhud.h"

static const CGFloat hmToolHudInViewH = 200.f;
static const CGFloat hudShowTime      = 1.f;

@implementation HMToolhud

+ (instancetype)sharedHudManager
{
    static dispatch_once_t once;
    static HMToolhud *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)showHudErrorMessage:(NSString *)message View:(UIView *)view
{
    [self sharedHudManager];
    NSLog(@"%@", message);
    if (view == nil) {
        view = [[UIApplication sharedApplication] windows].lastObject;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText      = message;
    hud.labelFont      = [UIFont systemFontOfSize:13.f];
    hud.yOffset        = hmToolHudInViewH;
    hud.mode           = MBProgressHUDModeText;
    hud.margin         = 7.f;
    hud.labelColor     = [UIColor whiteColor];
    hud.cornerRadius   = 15.f;
    hud.opacity        = 0.7;                           // 透明度
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:hudShowTime];
    //hud.animationType  = MBProgressHUDAnimationZoomOut; // 消失动画
}

+ (void)showErrorStatusCode:(NSString *)codeStr view:(UIView *)view
{
    if ([codeStr containsString:@"401"]) {
        [self showHudErrorMessage:@"该账户已在其他设备登录，请重新登录" View:view];
    } else {
        [self showHudErrorMessage:@"加载失败，请重试" View:view];
    }
}


@end
