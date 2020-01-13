//
//  DQTimerManager.m
//  TimerManager
//
//  Created by apple on 2020/1/13.
//  Copyright © 2020 apple. All rights reserved.
//
/**
   将timer封装到一个单独的类中，可以解决循环引用的问题，及时释放定时器和其引用类；
   并且可以多处调用，方便管理
   并且可以随时改变定时器的target和selector，更加灵活 比如线程A中调用DQTimerManager中的[target performSelector:selector withObject:nil]，线程B中修改了targer或者selector，在线程A中调用时及时target或者selcetor已经发生了改变，但performSelector仍然可以被正确的target和selector所调用。
*/

#import "DQTimerManager.h"
@interface DQTimerManager()

@property (nonatomic,strong)NSTimer *timer;

@end

@implementation DQTimerManager
-(instancetype)initWithTimeInterval:(NSTimeInterval)time target:(id)target selector:(SEL)selector {
    if (self = [super init]) {
        self.target = target;
        self.selector = selector;
        _timer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(timeMethod) userInfo:nil repeats:YES];
    }
    return self;
}

-(void)timeMethod {
    //可以做一些操作 如果有有值要带回业务页面，可通过[target performSelector:selector withObject:nil]传值回去
    
    //回到主线程
    __weak typeof (self)weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof (self)strongSelf = weakSelf;
        if (!strongSelf.target) {
            return;
        }
        if (!strongSelf.selector) {
            return;
        }
        id target = self.target;
        SEL selector = self.selector;
        
        if ([target respondsToSelector:selector]) {
            [target performSelector:selector withObject:nil];
        }
    });
    
}

-(void)stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}

@end
