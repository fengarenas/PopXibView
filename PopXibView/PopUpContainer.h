//
//  PopUpContainer.h
//  showLayoutView
//
//  Created by Fengj on 15/12/29.
//  Copyright © 2015年 wanlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopUpContainer : UIView

+ (instancetype)containView:(UIView *)view;

- (void)showInView:(UIView *)view;

@end
