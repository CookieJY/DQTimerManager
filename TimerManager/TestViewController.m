
//
//  TestViewController.m
//  TimerManager
//
//  Created by apple on 2020/1/13.
//  Copyright © 2020 apple. All rights reserved.
//

#import "TestViewController.h"
#import "DQTimerManager.h"

#define time 1
@interface TestViewController ()
@property(nonatomic,strong) DQTimerManager *timerManager;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    self.timerManager = [[DQTimerManager alloc]initWithTimeInterval:time target:self selector:@selector(controller2)];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.timerManager.selector = @selector(timeChange);
    });
}

-(void)buttonClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)controller2 {
    NSLog(@"222222");
}
-(void)timeChange {
    NSLog(@"333333");
}

-(void)dealloc {
    [self.timerManager stopTimer];
}

@end
