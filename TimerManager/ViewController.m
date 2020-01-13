//
//  ViewController.m
//  TimerManager
//
//  Created by apple on 2020/1/13.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "DQTimerManager.h"

#define time 5
@interface ViewController ()
@property(nonatomic,strong) DQTimerManager *timerManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 50, 50, 50);
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.timerManager = [[DQTimerManager alloc]initWithTimeInterval:time target:self selector:@selector(controller1)];
}
-(void)buttonClicked {
    [self presentViewController:[[TestViewController alloc]init] animated:YES completion:nil];
    
}

-(void)controller1 {
    NSLog(@"111111");
}

-(void)dealloc {
    [self.timerManager stopTimer];
}
@end
