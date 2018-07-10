//
//  UIWindow+CMFLEXSetting.m
//  CrackeAppDylib
//
//  Created by sen on 2018/7/9.
//  Copyright © 2018年 sen. All rights reserved.
//

#import "UIWindow+CMFLEXSetting.h"

#if DEBUG
#import "FLEXManager.h"
#endif

@implementation UIWindow (CMFLEXSetting)

#if DEBUG
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [super motionBegan:motion withEvent:event];
    
    if (motion == UIEventSubtypeMotionShake) {
        [[FLEXManager sharedManager] showExplorer];
    }
}
#endif

@end
