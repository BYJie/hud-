//
//  HMToolhud.h
//  H2ome
//
//  Created by hy on 16/8/6.
//  Copyright © 2016年 Shanghai h2ome information technology co., LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMToolhud : NSObject

+ (instancetype)sharedHudManager;

+ (void)showHudErrorMessage:(NSString *)message View:(UIView *)view;

+ (void)showErrorStatusCode:(NSString *)codeStr view:(UIView *)view;

@end
