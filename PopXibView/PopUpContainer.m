//
//  PopUpContainer.m
//  showLayoutView
//
//  Created by Fengj on 15/12/29.
//  Copyright © 2015年 wanlink. All rights reserved.
//

#import "PopUpContainer.h"

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

static CGFloat animationDuration = 0.2f;
static CGFloat backGroundViewAlpha = 0.2f;

@interface PopUpContainer ()

@property (nonatomic, assign) CGFloat popViewHeight;
@property (nonatomic, strong) NSLayoutConstraint *popViewBottonConstraint;

@end

@implementation PopUpContainer

+ (instancetype)containView:(UIView *)view {
    if (!view) {
        return nil;
    }
    PopUpContainer *popContainerView = [[PopUpContainer alloc]init];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:popContainerView action:@selector(hide)];
    [popContainerView addGestureRecognizer:tapGes];
    
    popContainerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];

    [popContainerView addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    popContainerView.popViewHeight = [view systemLayoutSizeFittingSize:CGSizeZero].height;
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(view);
    NSDictionary *metricsDict = @{
                               @"height"           : @(popContainerView.popViewHeight),
                               @"heightWhenHidden" : @(-popContainerView.popViewHeight)
                                 };
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(height)]-heightWhenHidden-|" options:0 metrics:metricsDict views:viewsDict];
    [popContainerView addConstraints:constraints];
    
    for (NSLayoutConstraint *aConstraint in constraints) {
        if (aConstraint.constant == -popContainerView.popViewHeight) {
            popContainerView.popViewBottonConstraint = aConstraint;
            break;
        }
    }
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:viewsDict];
    [popContainerView addConstraints:constraints];
    
    return popContainerView;
}

- (void)showInView:(UIView *)view {
    NSParameterAssert(view);
    if (self.superview) {
        return;
    }
    [view addSubview:self];
    self.frame = view.frame;
    [self layoutIfNeeded];
    [UIView animateWithDuration:animationDuration animations:^{
        self.popViewBottonConstraint.constant = 0;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:backGroundViewAlpha];
        [self layoutIfNeeded];
    } completion:nil];
}

- (void)hide {
    [UIView animateWithDuration:animationDuration animations:^{
        self.popViewBottonConstraint.constant = -self.popViewHeight;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
