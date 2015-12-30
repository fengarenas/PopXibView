//
//  ViewController.m
//  PopXibView
//
//  Created by Fengj on 15/12/30.
//  Copyright © 2015年 DevFeng. All rights reserved.
//

#import "ViewController.h"
#import "PopUpContainer.h"
#import "PopUpView.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)show:(id)sender {
    PopUpView *popView = [[[NSBundle mainBundle]loadNibNamed:@"PopUpView" owner:self options:nil]firstObject];
    
    PopUpContainer *container = [PopUpContainer containView:popView];
    
    [container showInView:self.view];
}

@end
